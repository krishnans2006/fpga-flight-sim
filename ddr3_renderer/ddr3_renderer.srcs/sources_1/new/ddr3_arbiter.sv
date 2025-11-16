`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Krishy Fishy and Aniketh Dynamic Duo
// Engineer: Aniketh Tarikonda
// 
// Create Date: 11/15/2025 06:50:29 PM
// Design Name: 
// Module Name: ddr3_arbiter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Basic DDR3 priority arbiter to interface with custom graphics pipeline & VGA horizontal line buffer(s)
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ddr3_arbiter (
  input logic           DDR3_CLK100,
  input logic  [3:0]    SW,
  output logic [3:0]    LED,
  output logic          RGBLED0,

  // ### BEGIN DDR3 IO ###
	// Inouts
	inout	logic [15:0]	  ddr3_dq,
	inout logic	[1:0]	    ddr3_dqs_n,
	inout	logic [1:0]	    ddr3_dqs_p,
	
	// Outputs
	output logic [13:0]	  ddr3_addr, //ddr3_addr[13] is N/C on Urbana board
	output logic [2:0]	  ddr3_ba,
	output logic	        ddr3_ras_n,
	output logic          ddr3_cas_n,
	output logic          ddr3_we_n,
	output logic          ddr3_reset_n,
	output logic [0:0]	  ddr3_ck_p,
	output logic [0:0]	  ddr3_ck_n,
	output logic [0:0]	  ddr3_cke,
	//output	[0:0]	ddr3_cs_n,//removed in Urbana board
	output logic [1:0]	  ddr3_dm,
	output logic [0:0]	  ddr3_odt,
  // ### END DDR3 IO ###

  // Arbitration Signals
  input logic  [1:0]  req,
  input logic         blank_n,
  output logic [1:0]  grant,

  // ### BEGIN DDR3 R/W Signals ###
  input logic	 [127:0]	r128_wrdata,
  input logic  [26:0]   app_addr,

  input logic           r_phy_cmd_en,
  input logic           r_phy_cmd_sel,

  output logic          rddata_valid,
  output logic [127:0]  w128_rddata,
  output logic          w_cmd_full,
  
  // misc debugging signal
  output logic          w_clk_div_o
);


wire	w_clk_ddr, w_clk_ddr_n;
wire	w_clk_ddr_90, w_clk_ddr_90_n;
wire	w_clk_div, w_clk_div_n;
wire	w_clk_idelayctrl;
wire	w_pll_locked;

clk_wiz_1 clkgen_ddr3ctrl_instance (
	// Clock out ports
	.clk_out1_ddr(w_clk_ddr),		// fast clock, in sync with DQS
	.clk_out2_ddr_90(w_clk_ddr_90),	// fast clock delayed by 90?, aligns to DQ
	.clk_out3_ref(w_clk_idelayctrl),// IDELAYCTRL, 200 MHz
	.clk_out4_div(w_clk_div),		// slow clock is 1:2 slower
	// Status and control signals
	.reset(1'b0),
	.locked(w_pll_locked),
	// Clock in ports
	.clk_in1(DDR3_CLK100)
);

// Default DDR3 configuration for Urbana Board
localparam lp_DDR_FREQ = 400;
localparam lp_ISERDES_32B_SHIFT = "TRUE";
localparam lp_REFCLK_FREQ = 200.0;
localparam lp_RD_DELAY = 8;
localparam nCK_PER_CLK = 2;

// 2 devices connected to arbiter
localparam N = 2;

logic	 w_phy_init_done;
logic	 w_phy_rddata_valid;
logic  [127:0] w128_phy_rddata;
logic  w_phy_cmd_full;

// ### BEGIN Internal Connection Wires - Ported from Example Project ###
reg	[7:0]	r8_wrdm = 8'b0;
wire	w8_phy_wrdm;
reg r_phy_rst = 1'b0;
wire	[1:0]	w2_dqs_delay_ld = {w_dqs_delay_ld, w_dqs_delay_ld};
wire	[1:0]	w2_dq_delay_ld = {w_dq_delay_ld, w_dq_delay_ld};
//wire	[1:0]	w2_dq_delay_ld, w2_dqs_delay_ld;
wire	[9:0]	w10_dq_delay_out, w10_dqs_delay_out;
wire	[4:0]	w5_dq_idelay_cnt, w5_dqs_idelay_cnt;
wire	[9:0]	w10_dq_delay_in = {w5_dq_idelay_cnt, w5_dq_idelay_cnt};
wire	[9:0]	w10_dqs_delay_in = {w5_dqs_idelay_cnt, w5_dqs_idelay_cnt};

wire w_idelay_rdy;

wire w_ddr3_ras_n;
wire w_ddr3_cas_n;
wire w_ddr3_we_n;

assign ddr3_ras_n = w_ddr3_ras_n;
assign ddr3_cas_n = w_ddr3_cas_n;
assign ddr3_we_n = w_ddr3_we_n;
assign w_clk_div_o = w_clk_div;

wire	[2:0]	w3_ddr3_ba;
wire	[13:0]	w14_ddr3_addr;
assign ddr3_ba = w3_ddr3_ba;
assign ddr3_addr = w14_ddr3_addr;

wire [2:0] w_ba;
wire [13:0] w_row;
wire [9:0] w_col;

wire [63:0]	w64_iserdes, w64_iserdes_shift;

assign LED[0] = w_phy_init_done;
assign LED[1] = w_pll_locked;
assign LED[2] = w_idelay_rdy;
assign LED[3] = w_rdcal_done;

assign rddata_valid = w_phy_rddata_valid;
assign w128_rddata = w128_phy_rddata;
assign w_cmd_full = w_phy_cmd_full;
assign {w_ba, w_row[12:0], w_col} = app_addr; //for 1Gb DDR3
 
// ### END Internal Connection Wires ###

ddr3_x16_phy_cust #(
	.p_IDELAY_TYPE("VAR_LOAD"),//"VARIABLE"),
	.p_IDELAY_INIT_DQS(0),//10),//31,
	.p_IDELAY_INIT_DQ(0),//6),
	.p_DDR_FREQ_MHZ(lp_DDR_FREQ),
	.p_RD_DELAY(lp_RD_DELAY),
	.p_REFCLK_FREQUENCY(lp_REFCLK_FREQ),
	.p_ISERDES_32B_SHIFT(lp_ISERDES_32B_SHIFT),
	.p_ROW_W(14),//14
	.p_ADDR_W(14)//14
) phy_instance (
	.on_oserdes_shifted(w64_iserdes_shift),
	.on_iserdes_par(w64_iserdes),

	.i_clk_ddr(w_clk_ddr),//	input	i_clk_ddr,	// memory bus clock frequency
	.i_clk_ddr_90(w_clk_ddr_90),//	input	i_clk_ddr_90,	// same but delayed by 90?, used to generate output DQ from OSERDES
	.i_clk_ref(w_clk_idelayctrl),//	input	i_clk_ref,	// 200 MHz, used for IDELAYCTRL, which controls taps for input DQS IDELAY
	.i_clk_div(w_clk_div),//	input	i_clk_div,	// half of bus clock frequency
		
	.i_mem_rst(r_phy_rst),//	input	i_phy_rst,	// active high reset for ODDR, OSERDES, ISERDES, IDELAYCTRL, hold HIGH until all clocks are generated
		
	.i_mem_wr(w_phy_cmd_en),//	input	i_phy_cmd_en,	// Active high strobe for inputs: cmd_sel, addr, 
	.i_mem_op(w_phy_cmd_sel),//	input	i_phy_cmd_sel,	// Command for current request: 'b0 = WRITE || 'b1 = READ
	.o_mem_full(w_phy_cmd_full),
	//	output	o_phy_cmd_rdy,	// Active high indicates UI ready to accept commands
	
	.in_mem_bank(w3_phy_bank),//	input	[p_BANK_W-1:0]	in_phy_bank,
	.in_mem_row(w14_phy_row),//	input	[p_ROW_W-1:0]	in_phy_row,
	.in_mem_col(w10_phy_col),//	input	[p_COL_W-1:0]	in_phy_col,
	.in_mem_wrd(w128_phy_wrdata),//	input	[(8*p_DQ_W)-1:0]	in_phy_wrdata,	// eight words of write data for OSERDES (out of 8 for a total of BL8)
	.i8_mem_wrdm(w8_phy_wrdm),//	input	[7:0]	i8_phy_wrdm,	// write data mask input, 1 bit per word in burst
	.on_mem_rddata(w128_phy_rddata),//	output	[(4*p_DQ_W)-1:0]	on_phy_rddata,	// four words of read data from ISERDES (out of 8 for a total of BL8)
	.o_mem_rddata_valid(w_phy_rddata_valid),//output	o_phy_rddata_valid, // output data valid flag
	//	output	o_phy_rddata_end,	// last burst of read data
		
	.o_mem_init_done(w_phy_init_done),//	output	o_init_done,
	.o_mem_idelay_rdy(w_idelay_rdy),
	
	
	.in_dq_delay_ce(2'b00),
	.in_dqs_delay_ce(2'b00),
	
	.in_dqs_delay_inc(2'b00),
	.in_dq_delay_inc(2'b00),
	
	.in_dqs_delay_ld(w2_dqs_delay_ld),
	.in_dq_delay_ld(w2_dq_delay_ld),
	
	.in_dqs_idelay_cnt(w10_dqs_delay_in),
	.in_dq_idelay_cnt(w10_dq_delay_in),

	.on_dqs_idelay_cnt(w10_dqs_delay_out),
	.on_dq_idelay_cnt(w10_dq_delay_out),
			
	//	 CONNECTION TO DRAM by PHY CORE
	.ion_ddr_dq(ddr3_dq),//	inout	[p_DQ_W-1:0]	ion_ddr_dq,
	.ion_ddr_dqs_p(ddr3_dqs_p),//	inout	[(p_DQ_W/8)-1:0]	ion_ddr_dqs_p,
	.ion_ddr_dqs_n(ddr3_dqs_n),//	inout	[(p_DQ_W/8)-1:0]	ion_ddr_dqs_n,
		
	.on_ddr_addr(w14_ddr3_addr),//	output	[p_ADDR_W-1:0]	on_ddr_addr,
	
	.o_ddr_ck_p(ddr3_ck_p),//	output	o_ddr_ck_p,
	.o_ddr_ck_n(ddr3_ck_n),//	output	o_ddr_ck_n,
		
	//	 CONNECTION TO DRAM by LOGIC CORE (ADDR, BANK, CS/RAS/CAS/WE, ODT, CKE, UDM/LDM)
	.on_ddr_dm(ddr3_dm),//	output	[(p_DQ_W/8)-1:0]	on_ddr_dm,
	.on_ddr_bank(w3_ddr3_ba),//	output	[p_BANK_W-1:0]	on_ddr_bank,
	
	.o_ddr_nrst(ddr3_reset_n),//	output	o_ddr_nrst,
	.o_ddr_cke(ddr3_cke),//	output	o_ddr_cke,
	.o_ddr_ncs(),//	output	o_ddr_ncs,
	.o_ddr_nras(w_ddr3_ras_n),//	output	o_ddr_nras,
	.o_ddr_ncas(w_ddr3_cas_n),//	output	o_ddr_ncas,
	.o_ddr_nwe(w_ddr3_we_n),//	output	o_ddr_nwe,
	.o_ddr_odt(ddr3_odt)//	output	o_ddr_odt
);

/** BEGIN ddr3_rdcal module */
reg	r_rdcal_start = 1'b0;
wire	w_rdcal_done;
wire	w_dqs_delay_ld, w_dq_delay_ld;

wire	w_phy_cmd_en, w_phy_cmd_sel;
wire	[2:0]	w3_phy_bank;
wire	[13:0]	w14_phy_row;
wire	[9:0]	w10_phy_col;
wire	[127:0]	w128_phy_wrdata;

wire	[2:0]	w3_calib_state;

ddr3_rdcal #(
    .p_RDCAL_ROW(14) //14
    ) rdcal_instance (
//	.o3_calib_state(w3_calib_state),
//	.o_curr_byte(w_curr_byte),

  .i_clk_div(w_clk_div),//input	i_clk_div,
	.i_rdcal_start(r_rdcal_start),//input	i_rdcal_start, <- needs to be driven somehow
	
	.o_rdcal_done(w_rdcal_done),//output	o_rdcal_done,
	.o_rdcal_err(RGBLED0),//output	o_rdcal_err,
	
	.o_dqs_delay_ld(w_dqs_delay_ld),//output	o_dqs_delay_ld,
	.o_dq_delay_ld(w_dq_delay_ld),//output	o_dq_delay_ld,
	
	.o5_dqs_idelay_cnt(w5_dqs_idelay_cnt),//output	[4:0]	o5_dqs_idelay_cnt,
	.o5_dq_idelay_cnt(w5_dq_idelay_cnt),//output	[4:0]	o5_dq_idelay_cnt,
	
	//.o5_dqs1_idelay_cnt(w5_dqs1_idelay_cnt),//output	[4:0]	o5_dqs_idelay_cnt,
	//.o5_dq1_idelay_cnt(w5_dq1_idelay_cnt),//output	[4:0]	o5_dq_idelay_cnt,
	
	.i_phy_init_done(w_phy_init_done),//input	i_phy_init_done,
	.i_phy_rddata_valid(w_phy_rddata_valid),//input	i_phy_rddata_valid,
	.in_phy_rddata(w128_phy_rddata),//input	[127:0]	in_phy_rddata,
	

	.i_phy_cmd_full(w_phy_cmd_full),//input	i_phy_cmd_full,

	.i_rdc_cmd_en(r_phy_cmd_en),//input	i_rdc_cmd_en,
	.i_rdc_cmd_sel(r_phy_cmd_sel),//input	i_rdc_cmd_sel,
	.i3_rdc_bank(w_ba),//input	[2:0]	i3_rdc_bank,
	.i14_rdc_row(w_row),//input	[13:0]	i14_rdc_row,
	.i10_rdc_col(w_col),//input	[9:0]	i10_rdc_col,
	.i128_rdc_wrdata(r128_wrdata),//input	[127:0]	i128_rdc_wrdata,
	.i8_rdc_wrdm(r8_wrdm),//input	[7:0]	i8_rdc_wrdm, this never gets modified from 8'b0 as we ALWAYS write 128 bits
	
	.o_phy_cmd_en(w_phy_cmd_en),//output	o_phy_cmd_en,
	.o_phy_cmd_sel(w_phy_cmd_sel),//output	o_phy_cmd_sel,
	.o3_phy_bank(w3_phy_bank),//output	[2:0]	o3_phy_bank,
	.o14_phy_row(w14_phy_row),//output	[13:0]	o14_phy_row,
	.o10_phy_col(w10_phy_col),//output	[9:0]	o10_phy_col,
	.o128_phy_wrdata(w128_phy_wrdata),//output	[127:0]	o128_phy_wrdata,
	.o8_phy_wrdm(w8_phy_wrdm)//output	[7:0]	o8_phy_wrdm
);

/** END ddr3_rdcal module */

localparam lp_RST_CTR_INITVAL = 50000;
reg	[$clog2(lp_RST_CTR_INITVAL)-1:0] rn_rst_ctr;
always_ff @(posedge w_clk_div) begin: rst_ctrl
	if (SW[3] || !w_pll_locked) begin
		rn_rst_ctr <= lp_RST_CTR_INITVAL;
		r_phy_rst <= 1'b1;
	end else if (rn_rst_ctr > 0)
		rn_rst_ctr <= rn_rst_ctr - 1'b1;
	else
		r_phy_rst <= 1'b0;
end

// calibration
logic btn0_prev;

always_ff @(posedge w_clk_div) begin: ddr3_calibration
	if (!w_rdcal_done)
		r_rdcal_start <= 1'b1;
	else
		r_rdcal_start <= 1'b0;
end

/* Implements the following control structure:

If device 1 (req[0]) requests DDR3 access, it will always be provided. 
In the case blank_n is asserted (corresponds to the horizontal blanking interval), device 2 (req[1]) (frame buffer logic) should always have priority. 

*/
always_comb begin : ddr3_arbiter
  if (req[0] == 1'b1) begin 
    grant = (2'b01 ^ ({blank_n, blank_n}));
  end else if (req[1] == 1'b1) begin
    grant = 2'b10;
  end
end

endmodule

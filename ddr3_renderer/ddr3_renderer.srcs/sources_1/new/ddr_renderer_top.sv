`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2025 05:27:27 PM
// Design Name: 
// Module Name: ddr_renderer_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ddr_renderer_top(

	input 	DDR3_CLK100,
	input 	[3:0]	SW,
	input	[3:0]	BTN,
	output	[3:0]	LED,
	output	[2:0]	RGBLED0,
	output	[2:0]	RGBLED1,
	
	input	UART_TXD_IN,
	output	UART_RXD_OUT,
	/* ### BEGIN DDR3 IO ### */
	// Inouts
	inout	[15:0]	ddr3_dq,
	inout 	[1:0]	ddr3_dqs_n,
	inout	[1:0]	ddr3_dqs_p,
	
	// Outputs
	output	[13:0]	ddr3_addr, //ddr3_addr[13] is N/C on Urbana board
	output	[2:0]	ddr3_ba,
	output	ddr3_ras_n,
	output	ddr3_cas_n,
	output	ddr3_we_n,
	output  ddr3_reset_n,
	output	[0:0]	ddr3_ck_p,
	output	[0:0]	ddr3_ck_n,
	output	[0:0]	ddr3_cke,
	//output	[0:0]	ddr3_cs_n,//removed in Urbana board
	output 	[1:0]	ddr3_dm,
	output	[0:0]	ddr3_odt,
	/* ### END DDR3 IO ### */
	
	//HDMI
    output logic       hdmi_tmds_clk_n,
    output logic       hdmi_tmds_clk_p,
    output logic [2:0] hdmi_tmds_data_n,
    output logic [2:0] hdmi_tmds_data_p
);

localparam lp_DDR_FREQ = 400;
localparam lp_HORIZ_PIXEL_WIDTH = 640;

ddr3_arbiter ddr3_arbiter_inst (
  .DDR3_CLK100(DDR3_CLK100),
  .SW(SW),
  .LED(LED),
  .RGBLED0(RGBLED0[0]),

  // ### BEGIN DDR3 IO ###
	// Inouts
	.ddr3_dq(ddr3_dq),
	.ddr3_dqs_n(ddr3_dqs_n),
	.ddr3_dqs_p(ddr3_dqs_p),
	
	// Outputs
	.ddr3_addr(ddr3_addr), //ddr3_addr[13] is N/C on Urbana board
	.ddr3_ba(ddr3_ba),
	.ddr3_ras_n(ddr3_ras_n),
	.ddr3_cas_n(ddr3_cas_n),
	.ddr3_we_n(ddr3_we_n),
	.ddr3_reset_n(ddr3_reset_n),
	.ddr3_ck_p(ddr3_ck_p),
	.ddr3_ck_n(ddr3_ck_n),
	.ddr3_cke(ddr3_cke),
	.ddr3_dm(ddr3_dm),
	.ddr3_odt(ddr3_odt),
  // ### END DDR3 IO ###

  // Arbitration Signals
  .req(),
  .grant(),
  .blank_n(),

  /* ### BEGIN DDR3 R/W Signals ### */
  .r128_wrdata(r128_wrdata),
	.wrdm(8'b0), // always write 128-bits, for now...
  .app_addr(app_addr),

  .r_phy_cmd_en(r_phy_cmd_en),
  .r_phy_cmd_sel(r_phy_cmd_sel),

  .rddata_valid(w_phy_rddata_valid),
  .w128_rddata(w128_phy_rddata),
  .w_cmd_full(w_phy_cmd_full),
	/* ### END DDR3 R/W Signals */

    .w_clk_div_o(w_uart_clk)
);

/* misc signals */
logic r_phy_cmd_en;
logic r_phy_cmd_sel;
logic w_phy_rddata_valid;
logic w_phy_cmd_full;
logic [26:0] app_addr;
logic [127:0] w128_phy_rddata, r128_wrdata;

/* ### BEGIN HDMI signals ### */
logic clk_25Mhz, clk_125Mhz, hdmi_clk;
logic locked;
logic reset_ah;
logic [3:0] red, green, blue;
logic hsync, vsync, vde;

assign reset_ah = BTN[0];
assign hdmi_clk = DDR3_CLK100;
logic hdmi_clk_o;

BUFG bufg_inst (.I(hdmi_clk), .O(hdmi_clk_o));

//clock wizard configured with a 1x and 5x clock for HDMI
logic [9:0] drawX, drawY;

clk_wiz_0 clk_wiz (
  .clk_out1(clk_25MHz),
  .clk_out2(clk_125MHz),
  .reset   (reset_ah),
  .locked  (locked),
  .clk_in1 (hdmi_clk_o)
);

  //VGA Sync signal generator
  vga_controller vga (
   .pixel_clk    (clk_25MHz),
   .reset        (reset_ah),
   .hs           (hsync),
   .vs           (vsync),
   .active_nblank(vde),
   .drawX        (drawX),
   .drawY        (drawY)
);

//Real Digital VGA to HDMI converter
hdmi_tx_0 vga_to_hdmi (
//Clocking and Reset
  .pix_clk       (clk_25MHz),
  .pix_clkx5     (clk_125MHz),
  .pix_clk_locked(locked),
  .rst           (reset_ah),
 //Color and Sync Signals
  .red           (red),
  .green         (green),
  .blue          (blue),
  .hsync         (hsync),
  .vsync         (vsync),
  .vde           (vde),

 //aux Data (unused)
  .aux0_din(4'b0),
  .aux1_din(4'b0),
  .aux2_din(4'b0),
  .ade     (1'b0),

 //Differential outputs
  .TMDS_CLK_P (hdmi_tmds_clk_p),
  .TMDS_CLK_N (hdmi_tmds_clk_n),
  .TMDS_DATA_P(hdmi_tmds_data_p),
  .TMDS_DATA_N(hdmi_tmds_data_n)
);
/* ### END HDMI signals ### */

/* BEGIN Frame Buffer */
logic fbuf_we, fbuf_wr_complete;
logic [9:0] fbuf_addr;
logic [15:0] fbuf_dout;
logic [127:0] ddr3_dout_latched_burst_d, ddr3_dout_latched_burst_q, fbuf_dina_burst;

frame_buffer frame_buffer_inst (
  .clk(w_uart_clk),
  .rst_n(~reset_ah),
  .fbuf_we(fbuf_we),
  .fbuf_addr(fbuf_addr),
  .fbuf_raddr(drawX),
  .fbuf_dina_burst(fbuf_dina_burst),

  .fbuf_dout(fbuf_dout),
  .fbuf_wr_complete(fbuf_wr_complete)
);

// frame buffer write logic

logic [26:0] output_buffer_addr, staging_buffer_addr;

/*
StIdle waits until blanking interval, at which point it transitions to StPoll
StReqDDR3/StPollDDR3 wait until DRAM burst is ready, at which point it transitions to StWrite
StWrite(s) write into frame buffer until fbuf_wr_complete is asserted, at which point it returns to StPoll, or StIdle if all 80 bursts are written.

Circular-Buffer VRAM Design/Memory Map

0x00000 - 0x4AFFF : VRAM 1
0x4B000 - 0x960FF : VRAM 2

One buffer is used to hold next frame, the other is used to draw current frame. On every vsync call, the pointers to these buffers are swapped.
*/

typedef enum {
    StIdle, StReqDDR3, StPollDDR3, StWrite0, StWrite1, StWrite2
} fbuf_wr_state_e;

logic [26:0] rd_addr;
logic [26:0] rd_addr_offset;
logic old_vga_vde;
logic [6:0] curr_counter_d, curr_counter_q;
logic rd_cmd_en, rd_cmd_sel, rd_flag;
fbuf_wr_state_e fbuf_wr_state_d, fbuf_wr_state_q;

assign RGBLED0[2] = rd_flag;

// combinational decode of the state
always_comb begin
	curr_counter_d = curr_counter_q;
	fbuf_wr_state_d = fbuf_wr_state_q;
	fbuf_addr = {3'b0, curr_counter_q} << 3; // multiply by 8 to determine start address'
	fbuf_we = 1'b0;

	ddr3_dout_latched_burst_d = ddr3_dout_latched_burst_q;
	fbuf_dina_burst = 128'b0;
	rd_cmd_en = 1'b0;
 	rd_cmd_sel = 1'b0;

	/* 
	starting address of VRAM + current row offset + current column "chunk"
	*/
	rd_addr = output_buffer_addr + rd_addr_offset + {17'b0, curr_counter_q, 3'b000};
	
	// debugging
	rd_flag = 1'b0;

	unique case (fbuf_wr_state_q)
		StIdle: begin
		// this currently has the potential to do multiple FB writes in one blanking interval ~ timing issue
			curr_counter_d = 7'b0;
			
			// transition on falling edge of vde
			if (~vde && old_vga_vde) begin
				fbuf_wr_state_d = StReqDDR3;
			end
		end
		StReqDDR3: begin
			rd_cmd_en = 1'b1;
 			rd_cmd_sel = 1'b1; // 1'b1 is read mode, 1'b0 is write mode

		// check cmd FIFO status
			if (!w_phy_cmd_full) begin
				fbuf_wr_state_d = StPollDDR3;
			end else begin
				fbuf_wr_state_d = StReqDDR3;
			end
		end
		StPollDDR3: begin
			if (w_phy_rddata_valid) begin
				fbuf_wr_state_d = StWrite0;
				rd_flag = 1'b1;
				ddr3_dout_latched_burst_d = w128_phy_rddata;
			end
		end
		StWrite0: begin
			rd_flag = 1'b1;
			fbuf_we = 1'b1;
			fbuf_dina_burst = ddr3_dout_latched_burst_q;
			fbuf_wr_state_d = StWrite1;
		end
		StWrite1: begin
		  rd_flag = 1'b1;
			curr_counter_d = curr_counter_d + 1;

			// stop at 80 bursts ~ corresponds to 640 pixels
			if (curr_counter_q == 7'b1001111) begin
				fbuf_wr_state_d = StIdle;
			end else begin
				fbuf_wr_state_d = StWrite2;
			end
		end
		StWrite2: begin
		  rd_flag = 1'b1;
			if (fbuf_wr_complete) begin
				fbuf_wr_state_d = StReqDDR3;
			end else begin 
				fbuf_wr_state_d = StWrite2;
		end
		end
	// catch parasitic states
		default: fbuf_wr_state_d = StIdle;
	endcase
end

// register the write SM @ 200 Mhz
always_ff @(posedge w_uart_clk) begin
  if (reset_ah) begin
		fbuf_wr_state_q <= StIdle;
		curr_counter_q = 7'b0;
		ddr3_dout_latched_burst_q <= 128'b0;
		old_vga_vde <= 1'b0;
		rd_addr_offset <= 27'b0;

		// initialize buffer addresses
		staging_buffer_addr <= 27'h004B000;
		output_buffer_addr  <= 27'h0000000;
	end else begin
		fbuf_wr_state_q <= fbuf_wr_state_d;
		curr_counter_q <= curr_counter_d;
		ddr3_dout_latched_burst_q <= ddr3_dout_latched_burst_d;
		old_vga_vde <= vde;
		
		if (~vsync && old_vga_vsync) begin
		  rd_addr_offset <= 27'b0;
		  // on falling edge of vsync, swap buffers
		  staging_buffer_addr <= output_buffer_addr;
		  output_buffer_addr  <= staging_buffer_addr;
		end else if (fbuf_wr_state_q == StWrite1 && fbuf_wr_state_d == StIdle) 
		  rd_addr_offset <= rd_addr_offset + lp_HORIZ_PIXEL_WIDTH;
	end
end

// frame buffer read logic (easy)
always_comb begin
  if (vde) begin
    red = fbuf_dout[11:8];
    blue = fbuf_dout[7:4];
    green = fbuf_dout[3:0];
  end else begin
    red = 4'b0;
    blue = 4'b0;
    green = 4'b0;
  end
end

/* ### END Frame Buffer ### */

/* ### BEGIN DDR3 Write Logic ### */
typedef enum { 
	StIdleWr, StIdleWr1, StReqDDR3Wr, StPollDDR3Wr, StDoneWr
} ddr3_wr_state_e;

ddr3_wr_state_e ddr3_wr_state_d, ddr3_wr_state_q;
logic [127:0] ddr3_wr_data;
logic [26:0]  wr_addr;
logic [7:0] 	vga_vsync_counter;
logic				 	wr_cmd_en, wr_cmd_sel;

// TEMP
logic [6:0] wr_counter_d, wr_counter_q;
logic old_vga_vsync;


// register states
always_ff @(posedge w_uart_clk) begin
	if (reset_ah) begin
		ddr3_wr_state_q <= StIdleWr;
		wr_counter_q <= 7'b0;
		old_vga_vsync <= 1'b0;
		vga_vsync_counter <= 8'b0;
	end else begin
		old_vga_vsync <= vsync;
		ddr3_wr_state_q <= ddr3_wr_state_d;
		wr_counter_q <= wr_counter_d;

		if (~vsync && old_vga_vsync) begin
			vga_vsync_counter <= vga_vsync_counter + 1;
		end 
	end
end

// combinational decode of write statres
always_comb begin
	wr_cmd_en = 1'b0;
	wr_cmd_sel = 1'b0;

	ddr3_wr_state_d = ddr3_wr_state_q;
	wr_addr = staging_buffer_addr + 27'h0028000 + {17'b0, wr_counter_q, 3'b0}; // write to addr 0 for now
	ddr3_wr_data = {8{{vga_vsync_counter, wr_counter_q[3:0], 4'b0}}}; // test data thgat looks cool
	wr_counter_d = wr_counter_q;


	unique case (ddr3_wr_state_q)
		StIdleWr: begin
			/* NOTE: when GPU implementation is finished, this state should transition only after some handshaking process */
			wr_counter_d = 7'b0;

      // begin write on falling edge of vsync
			if (~vsync && old_vga_vsync) begin
				ddr3_wr_state_d = StIdleWr1;
			end else begin
				ddr3_wr_state_d = StIdleWr;
			end
		end
		StIdleWr1: begin
			// transition state just to allow buffer pointers to stabilize
			ddr3_wr_state_d = StReqDDR3Wr;
		end
		StReqDDR3Wr: begin
			wr_cmd_en = 1'b1;
			wr_cmd_sel = 1'b0;

			if (!w_phy_cmd_full) begin
				ddr3_wr_state_d = StPollDDR3Wr;
			end else begin
				ddr3_wr_state_d = StReqDDR3Wr;
			end
		end
		StPollDDR3Wr: begin
			wr_counter_d = wr_counter_d + 1;
			ddr3_wr_state_d = StDoneWr;
		end
		StDoneWr: begin
			if (wr_counter_q == 7'b1001111) begin
				ddr3_wr_state_d = StIdleWr;
			end else begin
				ddr3_wr_state_d = StReqDDR3Wr;
			end
		end
	// catch parasitic states
		default: ddr3_wr_state_d = StIdleWr;
	endcase
end

// arbitration logic

// TEMP
logic btn_active;
assign btn_active = (ddr3_wr_state_q != StIdleWr);
assign RGBLED1[1] = btn_active;

always_comb begin
	// priority encoder
	if (btn_active) begin
		app_addr = wr_addr;
		r_phy_cmd_en = wr_cmd_en;
		r_phy_cmd_sel = wr_cmd_sel;
		r128_wrdata = ddr3_wr_data;
	end else begin
		app_addr = rd_addr;
		r_phy_cmd_en = rd_cmd_en;
		r_phy_cmd_sel = rd_cmd_sel;
		r128_wrdata = 'b0;
 	end
end

/* ### END DDR3 Write Logic ### */

endmodule

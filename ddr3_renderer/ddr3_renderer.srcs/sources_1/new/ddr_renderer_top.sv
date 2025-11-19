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
logic [127:0] fbuf_dina_burst;

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

/*
StIdle waits until blanking interval, at which point it transitions to StPoll
StPoll waits until DRAM burst is ready, at which point it transitions to StWrite
StWrite(s) write into frame buffer until fbuf_wr_complete is asserted, at which point it returns to StPoll, or StIdle if all 80 bursts are written.
*/
typedef enum {
    StIdle, StPoll, StWrite0, StWrite1, StWrite2
} fbuf_wr_state_e;

logic [6:0] curr_counter_d, curr_counter_q;
fbuf_wr_state_e fbuf_wr_state_d, fbuf_wr_state_q;

// assign temporary value to burst, this will eventually be the DRAM burst output
assign fbuf_dina_burst = 128'h0FFF0FFF_0FF00FF0_0F0F0F0F_00FF00FF;

// combinational decode of the state
always_comb begin
	fbuf_we = 1'b0;
	curr_counter_d = curr_counter_q;
	fbuf_wr_state_d = fbuf_wr_state_q;
	fbuf_addr = {3'b0, curr_counter_q} << 3; // multiply by 8 to determine start address

	unique case (fbuf_wr_state_q)
		StIdle: begin
		// this currently has the potential to do multiple FB writes in one blanking interval ~ timing issue
			curr_counter_d = 7'b0;
			if (~vde) fbuf_wr_state_d = StPoll;
		end
		StPoll: begin
			// currently skip DRAM, just go to write
			fbuf_wr_state_d = StWrite0;
		end
		StWrite0: begin
			fbuf_we = 1'b1;
			fbuf_wr_state_d = StWrite1;
		end
		StWrite1: begin
			curr_counter_d = curr_counter_d + 1;

			if (curr_counter_q == 7'b1001111) begin
				fbuf_wr_state_d = StIdle;
			end else begin
				fbuf_wr_state_d = StWrite2;
			end
		end
		StWrite2: begin
			if (fbuf_wr_complete) fbuf_wr_state_d = StPoll;
			else fbuf_wr_state_d = StWrite2;
		end
	endcase
end

// register the write SM @ 200 Mhz
always_ff @(posedge w_uart_clk) begin
  if (reset_ah) begin
		fbuf_wr_state_q <= StIdle;
		curr_counter_q = 7'b0;
	end else begin
		fbuf_wr_state_q <= fbuf_wr_state_d;
		curr_counter_q <= curr_counter_d;
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

/* uart clock signal */
wire w_uart_clk;
localparam lp_UART_CLK_FREQ = lp_DDR_FREQ*500_000;
localparam lp_UART_BAUDRATE = 3_000_000;

/** BEGIN UART_RX module */
	reg r_uart_rx_en = 1'b0;
	wire w_uart_rx_done;
	wire [7:0] w8_uart_rx_data;
uart_rx #(
	.p_BAUDRATE(lp_UART_BAUDRATE),
	.p_CLK_FREQ(lp_UART_CLK_FREQ)
	)
uart_rx_instance (
	.i_clk(w_uart_clk),
	.i_en(r_uart_rx_en),
	.i_uart_rx(UART_TXD_IN),
	
	.o_done(w_uart_rx_done),
	.o8_rxdata(w8_uart_rx_data)
	);
/** End UART_RX module */
/** Begin UART_TX module */
	wire w_uart_tx_rdy;
	wire w_uart_tx_byte_done;
	reg r_uart_tx_send_en = 1'b0;
	reg [7:0] r8_uart_tx_data;
uart_tx #(
	.p_BAUDRATE(lp_UART_BAUDRATE),
	.p_CLK_FREQ(lp_UART_CLK_FREQ)
) uart_tx_instance (
	.i_en(r_uart_tx_send_en),
	.i8_txdata(r8_uart_tx_data),
	.i_clk(w_uart_clk),
	
	.o_ready(w_uart_tx_rdy),
	.o_done(w_uart_tx_byte_done),
	.o_uart_tx(UART_RXD_OUT)
);
/* End UART_TX module */


reg btn0_prev, btn1_prev, btn2_prev, btn3_prev = 1'b0;

reg [3:0] r4_uart_state = 4'b0000;
reg [3:0] r4_uart_byte_index = 4'b1111; // counts bytes in DDR read vector for uart tx

reg [127:0] r128_ddr_rd_buffer = 128'b0; // 128 bit (read) buffer from DDR
reg [3:0] r4_rx_byte_index = 4'b1111; // counts 16 bytes across 128 bit words in 2x128 bit rx buffer
reg r1_rx_word_index_delay = 1'b0;
reg r1_rx_word_index_prev_read = 1'b0;

reg	[14+10+3-1:0] r27_start_addr = 'b0;
reg	[14+10+3-1:0] r27_end_addr = 'b0;

reg	[7:0]	r8_16_rx_buff	[15:0];
reg	r_uart_128_done, r_uart_128_done_prev;
reg	[127:0]	r128_dram_wrbuf;

/*(* ram_style = "block" *)*/
reg [127:0] rn_ram [127:0];

reg	[6:0]	r7_ram_ctr;
reg	[6:0]	r7_rd_valid_ctr;
reg	[31:0]	r32_rd_seq_tmr;

// UART MACHINE
/**/
assign RGBLED1[1] = ~r4_rx_byte_index[0]; // blue 1 toggles with each byte received
assign RGBLED0[2] = (!r_uart_128_done_prev && r_uart_128_done) ? ~RGBLED0[2] : RGBLED0[2]; // green 1 toggles with each 128-bit word received

always @(posedge w_uart_clk) begin: uart_state_machine
	btn0_prev <= BTN[0];

	r_uart_128_done <= 1'b0;
	r_uart_128_done_prev <= r_uart_128_done;
	r_uart_rx_en <= 1'b1;
	if (w_uart_rx_done) begin
		r8_16_rx_buff[r4_rx_byte_index] <= w8_uart_rx_data;
		r4_rx_byte_index <= r4_rx_byte_index - 1; // keep overflowing 16 byte counter
		if (r4_rx_byte_index == 4'b0000) begin
			r128_dram_wrbuf <= {r8_16_rx_buff[15], r8_16_rx_buff[14], r8_16_rx_buff[13], r8_16_rx_buff[12],
				r8_16_rx_buff[11], r8_16_rx_buff[10], r8_16_rx_buff[9], r8_16_rx_buff[8], r8_16_rx_buff[7], 
				r8_16_rx_buff[6], r8_16_rx_buff[5], r8_16_rx_buff[4], r8_16_rx_buff[3], r8_16_rx_buff[2],
				r8_16_rx_buff[1], w8_uart_rx_data};
			r_uart_128_done <= 1'b1;
		end
	end

case (r4_uart_state)
	'b0000: begin // TAKE DATA FROM RX BUFFER, decide next state based on buffer contents
		r_uart_tx_send_en <= 1'b0;
		r_phy_cmd_en <= 1'b0;
		r_phy_cmd_sel <= 1'b0;
		
		if (!r_uart_128_done_prev && r_uart_128_done) begin
			// Send ACK byte, reset current write address
			if (r128_dram_wrbuf == 128'h66666666_66666666_66666666_66666666) begin // ASCII 'f'
				app_addr <= 27'b0;
				r_uart_tx_send_en <= 1'b1;
				r8_uart_tx_data <= 8'h8a;
				
			// Set read begin/end address and commence read
			end else if ((r128_dram_wrbuf[127:64] == 64'h77777777_77777777) // ASCII 'w'
						&& (r128_dram_wrbuf[58:32] != r128_dram_wrbuf[26:0])) begin
				r4_uart_state <= 4'b0011; // go to read/tx loop
				r27_start_addr <= r128_dram_wrbuf[58:32]; // send end addr for RD op
				r27_end_addr <= r128_dram_wrbuf[26:0]; // set start addr for RD op
				
			// Set current write address
			end else if (r128_dram_wrbuf[127:64] == 64'h61616161_61616161) begin // ASCII '!'
				app_addr <= r128_dram_wrbuf[26:0];
			
			// Test sequential speeds -- read first row of SDRAM into FPGA BRAM
			end else if (r128_dram_wrbuf == 128'h72727272_72727272_72727272_72727272) begin // ASCII 's' (sequential)
				app_addr <= 27'b0;
				r4_uart_state <= 4'b1000;
				
				r_phy_cmd_en <= 1'b1;
				r_phy_cmd_sel <= 1'b1;
				
				r7_rd_valid_ctr <= 9'b0;
				r32_rd_seq_tmr <= 32'b0;
				
				r_uart_tx_send_en <= 1'b0;
				r8_uart_tx_data <= 8'hfd;
				
			// Write data to SDRAM
			end else begin
				r128_wrdata <= r128_dram_wrbuf; // wr data
				r4_uart_state <= 4'b0001; // DDR WR
			end
		end
	end
	'b0001: begin // END WR CMD, SIGNAL ENABLE
		r_phy_cmd_en <= 1'b1;
		r_phy_cmd_sel <= 1'b0;
		r4_uart_state <= 4'b0010;
	end
	'b0010: begin // STOP WRITE, INCREMENT ADDR, BACK TO IDLE
		r_phy_cmd_en <= 1'b0;
		
		app_addr <= app_addr + 8;
		//r_uart_tx_send_en <= 1'b1;
		r8_uart_tx_data <= 8'h8a;
		r4_uart_state <= 4'b0000;
	end
	'b0011: begin // DDR/TX STATE MACHINE BEGIN, addr start/end setup
		//r27_rd_addr_max <= {app_addr[26:3] - 1'b1, app_addr[2:0]};
		app_addr <= r27_start_addr;
		r4_uart_byte_index <= 4'b1111;
		r4_uart_state <= 4'b0100;
	end
	'b0100: begin // REQUEST DATA FROM DDR BLOCK
		// (is separate state for easier looping from 'b111)
		r_phy_cmd_en <= 1'b1;
		r_phy_cmd_sel <= 1'b1;
		r4_uart_state <= 4'b0101;
	end
	'b0101: begin // WAIT FOR DDR DATA VALID, BUFFER RD DATA
		r_phy_cmd_en <= 1'b0;
		if (w_phy_rddata_valid) begin
			r128_ddr_rd_buffer <= w128_phy_rddata;
			r4_uart_state <= 4'b0110;
		end else if (w_uart_rx_done)
			r4_uart_state <= 4'b0000;
	end
	'b0110: begin // SETUP (NEXT) TX BYTE AND SEND ENABLE
		r8_uart_tx_data <= r128_ddr_rd_buffer[r4_uart_byte_index*8 +: 8];
		r_uart_tx_send_en <= 1;
		r4_uart_state <= 4'b0111;
	end
	'b0111: begin // WAIT FOR TX BYTE DONE
		r_uart_tx_send_en <= 0;
		if (w_uart_tx_byte_done) begin
			r4_uart_byte_index <= r4_uart_byte_index - 1; // always increment, no resets, overflow
			if (r4_uart_byte_index == 4'b0000) begin // rd buffer sent
				if (app_addr == r27_end_addr) begin // read finished
					app_addr <= r27_start_addr;
					r4_uart_state <= 4'b0000;
				end else begin // read not finished, read from next addr
					app_addr <= app_addr + 8;
					r4_uart_state <= 4'b0100;
				end
			end else begin // rd buffer not sent, setup next buffer byte
				r4_uart_state <= 4'b0110;
			end
		end
	end
	'b1000: begin // read entire first row of SDRAM into FPGA BRAM
		r_uart_tx_send_en <= 1'b0;
		r_phy_cmd_en <= 1'b1;
		r_phy_cmd_sel <= 1'b1;
		
		if (!w_phy_cmd_full) begin
			app_addr <= app_addr + 'b1000;
			if (app_addr == 'h400) begin
				r4_uart_state <= 'b1001;
				r_phy_cmd_en <= 1'b0;
			end
		end
	end
	'b1001: begin
		r_phy_cmd_en <= 1'b0;
		if (r7_rd_valid_ctr == 'd127) begin
			r4_uart_state <= 'b1010;
			r7_ram_ctr <= 8'd0;
			r4_uart_byte_index <= 'b1111;
		end

	end
	'b1010: begin
		r8_uart_tx_data <= rn_ram[r7_ram_ctr][r4_uart_byte_index*8 +: 8];
		r_uart_tx_send_en <= 1;
		r4_uart_state <= 'b1011;
	end
	'b1011: begin
		r_uart_tx_send_en <= 0;
		
		if (w_uart_tx_byte_done) begin
			r4_uart_byte_index <= r4_uart_byte_index - 1; // always increment, no resets, overflow
			if (r4_uart_byte_index == 4'b0000) begin // rd buffer sent
				if (r7_ram_ctr == 'd127) begin // read finished
					r4_uart_state <= 4'b1100;
					r4_uart_byte_index <= 4'b0011;
				end else begin // read not finished, read from next addr
					r7_ram_ctr <= r7_ram_ctr + 1;
					r4_uart_state <= 4'b1010;
				end
			end else begin // rd buffer not sent, setup next buffer byte
				r4_uart_state <= 4'b1010;
			end
		end
	end
	'b1100: begin
		r8_uart_tx_data <= r32_rd_seq_tmr[r4_uart_byte_index*8 +: 8];
		r_uart_tx_send_en <= 1;
		r4_uart_state <= 'b1101;	
	end
	'b1101: begin
		r_uart_tx_send_en <= 0;
		
		if (w_uart_tx_byte_done) begin
			r4_uart_byte_index <= r4_uart_byte_index - 1; // always increment, no resets, overflow
			if (r4_uart_byte_index == 4'b0000) begin // rd buffer sent
				r4_uart_state <= 'b0000;
			end else begin // rd buffer not sent, setup next buffer byte
				r4_uart_state <= 4'b1100;
			end
		end
	end
	default: ; // should not be reached
	endcase
		
	if (r4_uart_state == 'b1000 || r4_uart_state == 'b1001) begin
		r32_rd_seq_tmr <= r32_rd_seq_tmr + 1'b1;
		if (w_phy_rddata_valid) begin
			r7_rd_valid_ctr <= r7_rd_valid_ctr + 1'b1;
			rn_ram[r7_rd_valid_ctr] <= w128_phy_rddata;
		end
	end
end //always
/**/
// END UART MACHINE

reg	[4:0]	r5_dqs_delay_out;
reg	[4:0]	r5_dq_delay_out;

wire w_btnpress = (!btn0_prev && BTN[0]) || (!btn1_prev && BTN[1]) || (!btn2_prev && BTN[2]) || (!btn3_prev && BTN[3]);

endmodule

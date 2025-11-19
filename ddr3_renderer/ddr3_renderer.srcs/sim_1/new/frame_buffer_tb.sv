`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2025 02:25:39 PM
// Design Name: 
// Module Name: frame_buffer_tb
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


module frame_buffer_tb;

  // DUT inputs
  logic         clk;
  logic         rst_n;
  logic         fbuf_we;
  logic [9:0]   fbuf_addr;
  logic [127:0] fbuf_dina_burst;

  // DUT outputs
  logic  [15:0] fbuf_dout;
  logic         fbuf_wr_complete;

  // Clock generation: 10ns period (100 MHz)
  initial clk = 0;
  always #5 clk = ~clk;

  // Instantiate DUT
  frame_buffer dut (
    .clk              (clk),
    .rst_n            (rst_n),
    .fbuf_we          (fbuf_we),
    .fbuf_addr        (fbuf_addr),
    .fbuf_dina_burst  (fbuf_dina_burst),
    .fbuf_dout        (fbuf_dout),
    .fbuf_wr_complete (fbuf_wr_complete)
  );
  
  // Internal signals
  logic [2:0] ctr;
  assign ctr = dut.bram_wr_dbyte_index_q;
  
  logic [9:0] int_waddr;
  assign int_waddr = dut.bram_waddr;
  
  logic [1:0] bram_wea;
  assign bram_wea = dut.wea;
  
  logic [15:0] bram_wdata;
  assign bram_wdata = dut.bram_dina;
  
  logic wr_ip;
  assign wr_ip = dut.wr_in_progress;

  // Test sequence
  initial begin
    // Initialize inputs
    rst_n = 0;
    fbuf_we = 0;
    fbuf_addr = 10'd0;
    fbuf_dina_burst = 128'h0;

    // Apply reset
    repeat (20) @(posedge clk);
    rst_n = 1;

    // Wait a few cycles
    repeat (3) @(posedge clk);

    // -----------------------------
    // Start single write transaction
    // -----------------------------

    @(posedge clk);
    fbuf_addr = 10'd12;  // arbitrary address
    fbuf_dina_burst = 128'hDEADBEEF_01234567_89ABCDEF_FEEDC0DE;
    fbuf_we = 1;        // assert write enable

    @(posedge clk);
    fbuf_addr = 10'd0;  // arbitrary address
    fbuf_we = 0;        // drop write enable; FSM continues internally
    
    repeat (2) @(posedge clk);
    fbuf_addr = 10'd12;
    
    // Wait for FSM to finish writing into BRAM
    wait (fbuf_wr_complete);

    for (integer i = 0; i < 8; i = i + 1) begin
      repeat (4) @(posedge clk);
      fbuf_addr = fbuf_addr + 1;
    end

    repeat (4) @(posedge clk);
    $display("Read/Write transaction complete. Check waveform for BRAM writes.");
    $finish;
  end

endmodule

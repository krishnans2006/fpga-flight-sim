`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2025 12:08:27 AM
// Design Name: 
// Module Name: frame_buffer
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


module frame_buffer(
  input logic         clk,
  input logic [1:0]   wea, // byte-write enable, but practically this is always 2'b11 or 2'b00
  input logic [9:0]   fbuf_addr,
  input logic [127:0] fbuf_dina_burst,

  output logic        fbuf_dout,
  output logic        fbuf_wr_complete
    );
    
  logic [15:0] bram_dina;
  logic wr_complete;

  // Instantiation of BRAM
  blk_mem_gen_0 bram0 (
    .addra(frame_buff_addr),
    .clka (clk), // setting this to AXI clock, check this
    .dina (bram_dina),
    .ena  (1'b1),
    .wea  (wea),
    .douta(fbuf_dout)
  );


endmodule

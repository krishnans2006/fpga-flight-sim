`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2025 10:27:32 PM
// Design Name: 
// Module Name: zbuffer
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


module zbuffer(
  /* BEGIN interface with memory (cache) */
  output logic  [26:0]   zbuf_addr,
  output logic           zbuf_req,
  output logic           zbuf_rw_n, // 1 = Read, 0 = Write
  output logic  [15:0]   zbuf_dout,
  input logic [15:0]     zbuf_din,
  input logic            zbuf_valid // asserted when read value is valid OR value has been successfully written
);




endmodule

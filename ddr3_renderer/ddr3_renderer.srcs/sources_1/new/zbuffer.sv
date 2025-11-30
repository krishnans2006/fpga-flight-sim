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
// like the barycentric module, this module is pipelined in order to process multiple Z-values concurrently
//////////////////////////////////////////////////////////////////////////////////


module zbuffer(
  input logic            clk,
  input logic            rst,
  /* Interface with rasterizer */

  /* BEGIN interface with memory (cache) */
  output logic [26:0]    zbuf_addr,
  output logic           zbuf_req,
  output logic           zbuf_rw_n, // 1 = Read, 0 = Write
  output logic [15:0]    zbuf_dout,
  input logic  [15:0]    zbuf_din,
  input logic            zbuf_valid // asserted when read value is valid OR value has been successfully written
);

// Stage 1 -> read from cache (and if necessary, ddr3)
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] zbuff_val;
} zbuf_q;

zbuf_q zbuf_q_d, zbuf_q_q;

// Stage 2 -> compare with existing Z-value
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] zbuff_val_in;
  logic [15:0] zbuff_val_stored;
} zbuf_q2;

zbuf_q2 zbuf_q2_d, zbuf_q2_q;

// Stage 3 -> compare with existing Z-value
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] zbuff_val_in;
  logic [15:0] zbuff_val_stored;
} zbuf_q3;

zbuf_q3 zbuf_q3_d, zbuf_q3_q;

always_ff @(posedge clk) begin
  if (rst) begin
    zbuf_q_q  <= 'b0;
    zbuf_q2_q <= 'b0;
    zbuf_q3_q <= 'b0;
  end else begin
    zbuf_q_q  <= zbuf_q_d;
    zbuf_q2_q <= zbuf_q2_d;
    zbuf_q3_q <= zbuf_q3_d;
  end
end

always_comb begin
  // stage 1

  
end

endmodule

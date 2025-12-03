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
  input logic  [31:0]    z0, z1, z2, // Z values of the vertices
  input logic  [31:0]    alpha, beta, gamma, // barycentric coords in Q8.24
  input logic            mem_valid,
  input logic  [26:0]    mem_addr,
  input logic  [15:0]    mem_data,

  /* BEGIN interface with memory (cache) */
  output logic [26:0]    zbuf_addr,
  output logic           zbuf_req, // cache request
  output logic           zbuf_rw_n, // 1 = Read, 0 = Write
  output logic [15:0]    zbuf_dout,
  input logic  [15:0]    zbuf_din,
  input logic            zbuf_valid, // asserted when read value is valid OR value has been successfully written

  /* Interface with writeback controller */
  input logic         wb_ready,
  output logic        mem_valid_out,
  output logic [26:0] mem_addr_out,
  output logic [15:0] mem_data_out
);

localparam VRAM_UBOUND = 27'h0096000;
 
// Stage 1 -> read from cache (and if necessary, ddr3)
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] data;
  logic [15:0] zbuff_val;
} zbuf_q;

zbuf_q zbuf_q_d, zbuf_q_q;

// Stage 2 -> compare with existing Z-value
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] data;
  logic [15:0] zbuff_val_in;
  logic [15:0] zbuff_val_stored;
} zbuf_q2;

zbuf_q2 zbuf_q2_d, zbuf_q2_q;

// Stage 3 -> write back the updated value
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] data;
  logic [15:0] zbuff_val_out;
} zbuf_q3;

zbuf_q3 zbuf_q3_d, zbuf_q3_q;

logic signed [63:0] tmp0, tmp1, tmp2, sum;
logic mem_req_q3, gstall;

always_ff @(posedge clk) begin
  if (rst) begin
    zbuf_q_q  <= 'b0;
    zbuf_q2_q <= 'b0;
    zbuf_q3_q <= 'b0;
  end else begin
    if (!gstall) begin
      zbuf_q_q  <= zbuf_q_d;
      zbuf_q2_q <= zbuf_q2_d;
      zbuf_q3_q <= zbuf_q3_d;
    end
  end
end

always_comb begin
  /* we don't infer latches in this town, boy */
  gstall = 1'b0;

  // z-buffer cache
  zbuf_req = 1'b0;
  zbuf_rw_n = 1'b0;
  zbuf_addr = 'b0;
  zbuf_dout = 'b0;

  // writeback controller
  mem_valid_out = mem_valid; // 1'b0
  mem_data_out  = mem_data;//zbuf_q3_q.data;
  mem_addr_out  = mem_addr;//zbuf_q3_q.addr;
  
  /* stage 1 */
  zbuf_q_d.valid = mem_valid;
  zbuf_q_d.data = mem_data;
  zbuf_q_d.addr = mem_addr;

  if (mem_valid) begin
    // calculate Z-value, truncate to 16 bits
    tmp0 = $signed(z0) * $signed(alpha);
    tmp1 = $signed(z1) * $signed(beta);
    tmp2 = $signed(z2) * $signed(gamma);

    sum = tmp0 + tmp1 + tmp2;
    zbuf_q_d.zbuff_val = sum[47:32]; // splice a 16-bit section
  end else begin
    zbuf_q_d.zbuff_val = 16'b0;
  end

  /* stage 2 */
  zbuf_q2_d.valid = 1'b1; // originally 1'b0;
  zbuf_q2_d.addr = zbuf_q_q.addr;
  zbuf_q2_d.zbuff_val_in = zbuf_q_q.zbuff_val;
  zbuf_q2_d.zbuff_val_stored = 16'b0;
  zbuf_q2_d.data = zbuf_q_q.data;

//  if (zbuf_q_q.valid) begin
//    // backpressure, can only do one memory op at any given time
//    if (mem_req_q3) begin
//      gstall = 1'b1;
//      zbuf_q2_d = zbuf_q2_q;
//    end else begin
//      zbuf_req = 1'b1;
//      zbuf_rw_n = 1'b1; // read
//      zbuf_addr = zbuf_q_q.addr + VRAM_UBOUND; // take advantage of the similar memory map for vram and z-buffer

//      // we are in this state and valid is asserted
//      if (zbuf_valid) begin
//        zbuf_q2_d.valid = 1'b1;
//        zbuf_q2_d.zbuff_val_stored = zbuf_din;
//      end else begin
//        gstall = 1'b1;
//        zbuf_q2_d = zbuf_q2_q;
//      end
//    end
//  end

  /* stage 3 */
  mem_req_q3 = 1'b0;

  zbuf_q3_d.valid = 1'b1; // originally 1'b0;
  zbuf_q3_d.addr = zbuf_q2_q.addr;
  zbuf_q3_d.data = zbuf_q2_q.data;
  zbuf_q3_d.zbuff_val_out = 16'b0;

  /* ok so pixel gets replaced if its Z value is less than the stored one
  we're storing inv-Z values (1/Z)
  thus, if the stored value is larger than the new value, the pixel gets replaced
  */
  if (zbuf_q2_q.valid) begin
    if ($signed(zbuf_q2_q.zbuff_val_stored) < $signed(zbuf_q2_q.zbuff_val_in)) begin
      zbuf_q3_d.valid = 1'b1;
    end
  end

  /* write-back into main memory (and cache)*/
  if (zbuf_q3_q.valid) begin
    mem_req_q3 = 1'b1;

//    zbuf_req = 1'b1;
//    zbuf_rw_n = 1'b0;
//    zbuf_addr = zbuf_q3_q.addr + VRAM_UBOUND;
//    zbuf_dout = zbuf_q3_q.zbuff_val_out;

//    if (zbuf_valid) begin
//      if (wb_ready)
//        mem_valid_out = 1'b1;
//      else
//        gstall = 1'b1;
//    end else begin
//      gstall = 1'b1;
//    end
  end
end

// assign output signals


endmodule

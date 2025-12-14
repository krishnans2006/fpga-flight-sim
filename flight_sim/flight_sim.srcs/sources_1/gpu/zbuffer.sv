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
  output logic           ready,

  // /* BEGIN interface with memory (cache) */
  // output logic [26:0]    zbuf_addr,
  // output logic           zbuf_req, // cache request
  // output logic           zbuf_rw_n, // 1 = Read, 0 = Write
  // output logic [15:0]    zbuf_dout,
  // input logic  [15:0]    zbuf_din,
  // input logic            zbuf_valid, // asserted when read value is valid OR value has been successfully written

  /* Interface with writeback controller */
  input logic         wb_ready,
  input logic         wb_memwr_active,
  output logic        mem_valid_out,
  output logic [26:0] mem_addr_out,
  output logic [15:0] mem_data_out
);

localparam VRAM_UBOUND = 27'h0096000;
localparam ZMIN = -8'b0100_0000;
 
// Stage 1 -> read from cache (and if necessary, ddr3)
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] data;
  logic [15:0] zbuff_val;
} zbuf_q_t;

zbuf_q_t zbuf_q, zbuf_q_d, zbuf_q_q;

// Stage 2 -> compare with existing Z-value
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] data;
  logic [15:0] zbuff_val_in;
  logic [15:0] zbuff_val_stored;
} zbuf_q2_t;

zbuf_q2_t zbuf_q2, zbuf_q2_d, zbuf_q2_q;

// Stage 3 -> write back the updated value
typedef struct packed {
  logic valid;
  logic [26:0] addr;
  logic [15:0] data;
  logic [15:0] zbuff_val_out;
  logic [15:0] q2_diff;
} zbuf_q3_t;

zbuf_q3_t zbuf_q3, zbuf_q3_d, zbuf_q3_q;

typedef enum {
  StIdle, StReq, StDone
} cache_state_e;

cache_state_e cache_state_d, cache_state_q;
logic signed [63:0] tmp0, tmp1, tmp2, sum;
logic replace;
logic mem_req_q3, cache_fetch_stall;
//logic [3:0] delay_q, delay_d;

// /* Instantiate BRAM */
// logic [16:0] bram_addr;
// logic [15:0] bram_din;
// logic        bram_wea;
// logic [15:0] bram_dout;

// blk_mem_gen_2 bram_inst (
//     .addra(bram_addr),
//     .clka (clk),
//     .dina (bram_din),
//     .ena  (1'b1),
//     .wea  (bram_wea),
//     .douta(bram_dout)
// );


always_ff @(posedge clk) begin
  if (rst) begin
    cache_state_q <= StIdle;
 end else begin
  cache_state_q <= cache_state_d;

//  // read in data from cache
//  if (cache_state_q == StReq && zbuf_valid) begin
//    zbuf_q2.zbuff_val_stored <= zbuf_din;
//  end
 end
end

always_comb begin
// Calculations for stage 1
  // calculate Z-value, truncate to 16 bits
  tmp0 = $signed(z0) * $signed(alpha);
  tmp1 = $signed(z1) * $signed(beta);
  tmp2 = $signed(z2) * $signed(gamma);

  sum = tmp0 + tmp1 + tmp2;

// SM for cache R/W

  // defaults
//  zbuf_addr = zbuf_q.addr + VRAM_UBOUND;
//  zbuf_req = 1'b0;
//  zbuf_rw_n = 1'b0;
//  zbuf_dout = 16'b0;

  cache_state_d = cache_state_q;
//  delay_d = delay_q;
  cache_fetch_stall = 1'b0;

  unique case (cache_state_q)
    StIdle: begin
//      delay_d = 3'b000;
      if (zbuf_q.valid) begin
        cache_state_d = StReq;
      end
    end
    StReq: begin
      cache_fetch_stall = 1'b1;
      // zbuf_rw_n = 1'b1;
      // zbuf_req = 1'b1;

      // if (zbuf_valid) begin
        cache_state_d = StDone;
      // end
    end
    StDone: begin
      // extra state to allow zbuff_val_stored to be written in properly
      cache_fetch_stall = 1'b1;
      cache_state_d = StIdle;
    end
  endcase
end

always_ff @(posedge clk) begin
  if (wb_ready) begin
    // Stage 1
    zbuf_q.valid <= mem_valid;
    zbuf_q.addr <= mem_addr;
    zbuf_q.data <= mem_data;
    zbuf_q.zbuff_val <= sum[47:32];

    // Stage 2
    zbuf_q2.valid <= zbuf_q.valid;
    zbuf_q2.addr <= zbuf_q.addr;
    zbuf_q2.data <= zbuf_q.data;

    zbuf_q2.zbuff_val_in <= zbuf_q.zbuff_val;

    // Stage 3
//    if (zbuf_q2.valid) begin
//      if (zbuf_q2.should_replace) begin
//        zbuf_q3.valid <= 1'b1;
//      end else begin
//        zbuf_q3.valid <= 1'b0;
//      end
//    end else begin
//        zbuf_q3.valid <= 1'b0;
//    end

    zbuf_q3.valid <= zbuf_q2.valid;
    zbuf_q3.addr <= zbuf_q2.addr;
    zbuf_q3.data <= zbuf_q2.data;
    zbuf_q3.zbuff_val_out <= zbuf_q2.zbuff_val_in;
    
    //(*use_dsp = "yes" *) 
    // zbuf_q3.q2_diff <= zbuf_q2.zbuff_val_in - zbuf_q2.zbuff_val_stored;
  end
end

// assign outputs
assign mem_valid_out = zbuf_q3.valid;
assign mem_addr_out = zbuf_q3.addr;
assign mem_data_out = zbuf_q3.data;
assign ready = wb_ready;

endmodule
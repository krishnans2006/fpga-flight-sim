`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2025 04:30:08 PM
// Design Name: 
// Module Name: cache
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
// (p)LRU cache meant to serve as an interface between Z-buffer and DDR3 memory
// relatively small cache, but its not too difficult to customize to improve performnace
//////////////////////////////////////////////////////////////////////////////////


module cache #(
  parameter N_CACHE_LINES = 16,
  parameter CACHE_LINE_WIDTH = 512 // 32 consecutive Z-values per line
)(
  input clk,
  input rst,

  /* BEGIN interface with DDR3 arbiter */
  // R/W
  output logic [26:0]   cache_ddr3_addr,
  // R
  input logic  [127:0]  cache_ddr3_din,
  input logic           cache_ddr3_din_valid,
  // W
  output logic [127:0]  cache_ddr3_dout,
  output logic [7:0]    cache_ddr3_wrdm,
  /* END interface with DDR3 arbiter */

  /* BEGIN interface with Z-buffer */
  input logic  [26:0]   zbuf_addr,
  input logic           zbuf_ren, // we want to be careful about values stored in the cache
  input logic           zbuf_wen,
  input logic  [15:0]   zbuf_din,
  output logic [15:0]   zbuf_dout,
  output logic          zbuf_dout_valid
);

localparam TAG_WIDTH    = 18; // 26:9
localparam INDEX_WIDTH  = 4;  // 8:5
localparam OFFSET_WIDTH = 5;  // 4:0

// Instantiation of BRAM
logic [INDEX_WIDTH-1:0] bram_addr;
logic [CACHE_LINE_WIDTH-1:0] bram_din, bram_dout;
logic [(CACHE_LINE_WIDTH/8)-1:0] bram_wea; // byte write enable

/* 
  Memory Type: Single Port Memory
  BRAM resources (18K): 0
  BRAM resources (36K): 8
  Port A Read Latency: 2 clk cycles
  Address Width A: $clog2(N_CACHE_LINES)
*/
blk_mem_gen_1 bram1 (
    .addra(bram_addr),
    .clka (clk),
    .dina (bram_din),
    .ena  (1'b1),
    .wea  (bram_wea),
    .douta(bram_dout)
);

// instantiate this in registers instead of BRAM
logic [TAG_WIDTH-1:0] cache_tag [N_CACHE_LINES-1:0];
logic [N_CACHE_LINES-1:0] cache_valid;
logic [N_CACHE_LINES-1:0] cache_dirty;

// cache addressing
logic [TAG_WIDTH-1:0] input_tag;
logic [INDEX_WIDTH-1:0] input_index;
logic [OFFSET_WIDTH-1:0] input_offset; // Selects 1 of 32 Z-values

// may want to latch these later
assign input_tag = zbuf_addr[26:9];
assign input_index = zbuf_addr[8:5];
assign input_offset = zbuf_addr[4:0];

// determine current "status"
logic curr_valid, curr_dirty, curr_tag_matches, hit;

assign curr_valid = cache_valid[input_index];
assign curr_dirty = cache_dirty[input_index];
assign curr_tag_matches = (input_tag == cache_tag[input_index]);
assign hit = (curr_tag_matches && curr_valid);

typedef enum {
  StIdle, StCacheHit0, StCacheHit1, StCacheMiss
} cache_state_e;

cache_state_e cache_state_d, cache_state_q;

always_ff @(posedge clk) begin
  if (rst) begin
    cache_state_q <= StIdle;
    cache_valid <= 'b0;
    cache_dirty <= 'b0;
    
    for (integer i = 0; i < N_CACHE_LINES; i = i + 1) begin
      cache_tag <= 'b0;
    end

  end else begin
    cache_state_q <= cache_state_d;

    // insert logic to handle valid, dirty, tag fields
  end
end

always_comb begin
  unique case (cache_state_q)
    
  endcase
end

endmodule

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
// direct-mapped cache meant to serve as an interface between Z-buffer and DDR3 memory
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
  output logic          cache_ddr3_req,
  output logic          cache_ddr3_rw_n, // 1 = Read, 0 = Write
  input logic           cache_ddr3_ready,
  // R
  input logic  [127:0]  cache_ddr3_din,
  input logic           cache_ddr3_din_valid,
  // W
  output logic [127:0]  cache_ddr3_dout,
  output logic [7:0]    cache_ddr3_wrdm,
  // output logic          cache_ddr3_dout_valid,
  /* END interface with DDR3 arbiter */

  /* BEGIN interface with Z-buffer */
  input logic  [26:0]   zbuf_addr,
  input logic           zbuf_req,
  input logic           zbuf_rw_n, // 1 = Read, 0 = Write
  input logic  [15:0]   zbuf_din,
  output logic [15:0]   zbuf_dout,
  output logic          zbuf_dout_valid, // asserted when read value is valid OR value has been successfully written

  // control signal
  output logic          cache_is_active
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
logic input_op; // 1 = read, 0 = write

// determine current "status"
logic curr_valid, curr_dirty, curr_tag_matches, hit;

assign curr_valid = cache_valid[input_index];
assign curr_dirty = cache_dirty[input_index];
assign curr_tag_matches = (input_tag == cache_tag[input_index]);
assign hit = (curr_tag_matches && curr_valid);

// keeps track of evicted values
logic [1:0] chunk_count_d, chunk_count_q;
logic [CACHE_LINE_WIDTH-1:0] evict_buffer;
logic [TAG_WIDTH-1:0] evict_tag;

typedef enum {
  StIdle, StDecode, StCacheHit0, StCacheHit1, StEvictRead, StEvictWB, StRead0, StRead1, StRead2
} cache_state_e;

cache_state_e cache_state_d, cache_state_q;

assign cache_is_active = (cache_state_q == StEvictRead) ||
                         (cache_state_q == StEvictWB) ||
                         (cache_state_q == StRead0) ||
                         (cache_state_q == StRead1);

//assign cache_is_active = (cache_state_q != StIdle);

always_ff @(posedge clk) begin
  if (rst) begin
    cache_state_q <= StIdle;
    cache_valid <= 'b0;
    cache_dirty <= 'b0;
    chunk_count_q <= 2'b0;
    
    for (integer i = 0; i < N_CACHE_LINES; i = i + 1) begin
      cache_tag[i] <= 'b0;
    end
  end else begin
    cache_state_q <= cache_state_d;
    chunk_count_q <= chunk_count_d;

    // insert logic to handle valid, dirty, tag fields
    if (zbuf_req) begin
      input_tag <= zbuf_addr[26:9];
      input_index <= zbuf_addr[8:5];
      input_offset <= zbuf_addr[4:0];
      input_op <= zbuf_rw_n;
    end

    // StCacheHit1: mark dirty if modified
    if (cache_state_q == StCacheHit1 && ~input_op) begin
      cache_dirty[input_index] <= 1'b1;
    end

    // StEvictRead: read bram_dout into evict_buffer, ensure counter is 0
    if (cache_state_q == StEvictRead) begin
      evict_buffer <= bram_dout;
      evict_tag <= cache_tag[input_index];
    end

    // if (cache_state_q == StEvictWB && cache_ddr3_ready) begin
    //   chunk_count <= chunk_count + 1;
    // end

    // StRead2: if value has been evicted & we're done reading from ddr3/writing to bram, reset tag/valid/dirty
    if (cache_state_q == StRead2) begin
      cache_tag[input_index] <= input_tag;
      cache_valid[input_index] <= 1'b1;
      cache_dirty[input_index] <= 1'b0;
    end
  end
end

always_comb begin
  cache_state_d = cache_state_q;
  chunk_count_d = chunk_count_q;

  // BRAM default assignments
  bram_addr = input_index;
  bram_wea = 'b0;
  bram_din = 'b0;

  // DDR3 default assignments
  cache_ddr3_req = 1'b0;
  cache_ddr3_rw_n = 1'b1; // default to reads idk
  cache_ddr3_addr = 27'b0;
  cache_ddr3_wrdm = 8'hFF;
  cache_ddr3_dout =  evict_buffer[128*chunk_count_q +: 128];

  // Z-buffer default assignmnets
  zbuf_dout = bram_dout[(input_offset*16) +: 16];
  zbuf_dout_valid = 1'b0;

  unique case (cache_state_q)
    StIdle: begin
      chunk_count_d = 2'b00;

      if (zbuf_req) begin
        cache_state_d = StDecode;
      end
    end
    StDecode: begin
      // separating out this and Idle in order to allow registers to latch
      if (hit) begin
        // Cache Hit
        cache_state_d = StCacheHit0;
      end else begin
        // Cache Miss, we implement a write-back cache here, so only write back to main memory on eviction
        if (curr_dirty && curr_valid) begin
          // WB -> read new value
          cache_state_d = StEvictRead;
        end else begin
          // read new value
          cache_state_d = StRead0;
        end
      end
//       cache_state_d = StCacheHit0;
    end
    StCacheHit0: begin
      // redundant state to account for BRAM latency
      cache_state_d = StCacheHit1;

      // if wen is asserted, keep this asserted for one clock cycle
      if (~input_op) begin
        bram_din = {32{zbuf_din}};
        bram_wea = 64'b11 << (input_offset * 2); // we are writing two bytes
      end
    end
    StCacheHit1: begin
      zbuf_dout_valid = 1'b1;
      cache_state_d = StIdle;
    end
    StEvictRead: begin
      // we're reading bram_dout to write back to main memory, so we need to account for BRAM latency
      cache_state_d = StEvictWB;
    end
    StEvictWB: begin
      if (cache_ddr3_ready) begin
        cache_ddr3_req = 1'b1;
        cache_ddr3_rw_n = 1'b0;

        // cache_ddr3_dout_valid = 1'b1;
        cache_ddr3_addr = {evict_tag, input_index, chunk_count_q, 3'b000};
        cache_ddr3_wrdm = 8'b0; // writing everything

        if (chunk_count_q == 2'b11) begin
          // This was the 4th write (index 3). Done with eviction.
          chunk_count_d = 2'b00; // Reset counter for the next read
          cache_state_d = StRead0; // Proceed to read the new line
        end else begin
          chunk_count_d = chunk_count_q + 1;
        end
      end
    end
    StRead0: begin
      cache_ddr3_req = 1'b1;
      cache_ddr3_rw_n = 1'b1;
      cache_ddr3_addr = {input_tag, input_index, chunk_count_q, 3'b000};

      // issue ddr3 read
      if (cache_ddr3_ready) begin
        cache_state_d = StRead1;
      end
    end
    StRead1: begin
      // write the value into bram
      if (cache_ddr3_din_valid) begin
        bram_wea = 64'h0000_0000_0000_FFFF << (chunk_count_q * 16);
        bram_din = {4{cache_ddr3_din}};
        
        if (chunk_count_q == 2'b11) begin
          // Done with all 4 reads (0, 1, 2, 3)
          chunk_count_d = 2'b00; // Reset counter
          cache_state_d = StRead2; // Exit loop, wait for BRAM latency
        end else begin
          // More chunks to read, increment counter and request the next one
         chunk_count_d = chunk_count_q + 1;
         cache_state_d = StRead0; 
        end
      end
    end
    StRead2: begin
      // duplicate state to account for bram 2 cycle latency
      cache_state_d = StCacheHit0;
    end
    default: cache_state_d = StIdle;
  endcase
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2025 03:57:04 PM
// Design Name: 
// Module Name: rasterizer
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
// This module coalesces 8 consecutive memory writes into a 128-bit chunk, which can more efficiently be written into DDR3.
//////////////////////////////////////////////////////////////////////////////////


module gpu_wb_controller(
  input                   clk,
  input                   stall,
  input                   rst,
// connection to rasterizer
  input logic [15:0]      din,
  input logic [26:0]      din_addr,
  input logic             din_valid,
  output logic            ready,
// connection to DDR3 arbiter
  input logic             mem_wrdy,
  output logic [26:0]     dout_burst_addr,
  output logic [7:0]      dout_wrdm,
  output logic [127:0]    dout_burst_128,
  output logic            dout_burst_valid
);

typedef enum {
  StIdle, StRead, StWriteback, StFlush
} wb_controller_state_e;

wb_controller_state_e wb_controller_state_d, wb_controller_state_q;

logic [127:0] wb_buffer_d, wb_buffer_q;
logic [7:0] din_wrdm_q, din_wrdm_d;
logic [23:0] din_tag_q, din_tag_d; // keep track of previous tags for comparison

// address current value
logic [2:0] curr_din_idx, din_idx_latched;
logic [23:0] curr_din_tag, din_tag_latched;
logic [15:0] din_latched;

assign curr_din_idx = din_addr[2:0]; // where in the 128-bit buffer is the value
assign curr_din_tag = din_addr[26:3]; // where in ddr3 is this chunk located

always_ff @(posedge clk) begin
  if (rst) begin
    wb_controller_state_q <= StIdle;
    wb_buffer_q <= 128'b0;
    din_wrdm_q <= 8'b0;
    din_tag_q <= 3'b0;

    // latched values
    din_idx_latched <= 3'b0;
    din_tag_latched <= 24'b0;
    din_latched <= 16'b0;

  end else begin
    if (!stall) begin
      wb_controller_state_q <= wb_controller_state_d;
      din_tag_q <= din_tag_d;
      wb_buffer_q <= wb_buffer_d;
      din_wrdm_q <= din_wrdm_d;
    end

    if (din_valid) begin
      din_idx_latched <= curr_din_idx;
      din_tag_latched <= curr_din_tag;
      din_latched <= din;
    end
  end
end

always_comb begin
  wb_controller_state_d = wb_controller_state_q;
  wb_buffer_d = wb_buffer_q;
  din_wrdm_d = din_wrdm_q;
  din_tag_d = din_tag_q;

  dout_burst_valid = 1'b0;
  dout_burst_128 = wb_buffer_q;
  dout_wrdm = ~din_wrdm_q;
  dout_burst_addr = {din_tag_q, 3'b0}; // reconstruct to 27 bits

  ready = 1'b0;

  unique case (wb_controller_state_q)
    StIdle: begin
      // this is only executed on resets & initially, when there is no previous tags/values to compare
      if (din_valid) begin
        wb_controller_state_d = StRead;
        wb_buffer_d[curr_din_idx*16 +: 16] = din; // part select
        din_tag_d = curr_din_tag;
        din_wrdm_d[curr_din_idx] = 1'b1;
      end else begin
        wb_controller_state_d = StIdle;
      end

      ready = 1'b1;
    end
    StRead: begin
      if (din_valid) begin
        if (din_tag_q == curr_din_tag) begin
          wb_buffer_d[curr_din_idx*16 +: 16] = din;
          din_wrdm_d[curr_din_idx] = 1'b1;
          ready = 1'b1;
          wb_controller_state_d = StRead;
        end else begin
          wb_controller_state_d = StWriteback;
        end
      end
    end
    StWriteback: begin
      if (mem_wrdy) begin
        dout_burst_valid = 1'b1;
        wb_controller_state_d = StFlush;
      end else
        wb_controller_state_d = StWriteback;
    end
    StFlush: begin
      wb_controller_state_d = StRead;

      // when we get this point, there is still some latched value waiting to be written
      wb_buffer_d = {112'b0, din_latched} << (din_idx_latched*16); // shifts latched din into right place
      din_wrdm_d = 8'b00000001 << (din_idx_latched);
      din_tag_d = din_tag_latched;
      ready = 1'b1;
    end
    // catch parasitic states
    default: wb_controller_state_d = StIdle;
  endcase
end

endmodule
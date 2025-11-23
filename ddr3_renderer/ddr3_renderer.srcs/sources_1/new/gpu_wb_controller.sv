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
  input logic [15:0]      din,
  input logic [26:0]      din_addr,
  input logic             din_valid,
  output logic [26:0]     dout_burst_addr,
  output logic [7:0]      dout_wrdm,
  output logic [127:0]    dout_burst_128,
  output logic            dout_burst_valid
);

typedef enum {
  StIdle, StRead0, StRead1, StUpdate, StWriteback
} wb_controller_state_e;

wb_controller_state_e wb_controller_state_d, wb_controller_state_q;

logic [127:0] wb_buffer;
logic [26:0] din_addr_latched, buffer_addr;
logic [15:0] din_latched;
logic [2:0] curr_avail_q, curr_avail_d; // pointer to next available spot in wb_buffer

always_ff @(posedge clk) begin
  if (rst) begin
    wb_controller_state_q <= StIdle;
    curr_avail_q <= 3'b0;
    wb_buffer <= 128'b0;
    din_addr_latched <= 27'b0;
    din_latched <= 16'b0;
  end else begin
    if (!stall) begin
      wb_controller_state_q <= wb_controller_state_d;
      curr_avail_q <= curr_avail_d;
    end

    // latch appropriate values
    if (din_valid) begin
      din_latched = din;
      din_addr_latched = din_addr;
    end
  end
end

always_comb begin
  wb_controller_state_d = wb_controller_state_q;
  dout_burst_valid = 1'b0;
  dout_burst_128 = wb_buffer;
  curr_avail_d = curr_avail_q;

  unique case (wb_controller_state_q)
    StIdle: begin
      if (din_valid)
        wb_controller_state_d = StRead0;
      else
        wb_controller_state_d = StIdle;
    end
    StRead0: begin
      // temporary state for latched values to settle
      wb_controller_state_d = StRead1;
    end
    StRead1: begin
      if (curr_avail_q == 3'b0) begin

      end
    end
    StUpdate: begin
    end
    StWriteback: begin
      dout_burst_valid = 1'b1;
      wb_controller_state_d = StIdle;
    end
  endcase
end

endmodule
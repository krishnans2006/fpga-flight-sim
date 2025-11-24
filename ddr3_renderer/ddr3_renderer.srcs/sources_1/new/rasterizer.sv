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
// Note: this module repeatedly sends memory address/value pairs until the rasterizer_done signal is asserted high.
// When interfacing with DDR3, use an intermediate 128-bit buffer (such as in gpu_wb_controller.sv) to best utilize DDR3 bandwidth.
//////////////////////////////////////////////////////////////////////////////////


module rasterizer(
  input logic         clk,
  input logic         rst,
  input logic         stall, // pipeline signal
  // signal to prev. stage to indicate current inputs have been fully rasterized
  output logic        rasterizer_done,
  // currently we're working with a "box" rasterizer ~ this will be updated to do triangles
  input logic         vertex_valid,
  input logic [9:0]   x1, x2, y1, y2,
  input logic [11:0]  color,
  // interface with writeback controller
  input logic         wb_ready,
  output logic        mem_valid,
  output logic [26:0] mem_addr,
  output logic [15:0] mem_data
); 

localparam lp_HORIZ_PIXEL_WIDTH = 27'h0000280;

typedef enum {
  StIdle, StSetup, StDraw, StDone
} rasterizer_state_e;

rasterizer_state_e rasterizer_state_d, rasterizer_state_q;

// we will latch these
logic [9:0] curr_x_d, curr_x_q, curr_y_d, curr_y_q, 
            start_x, end_x, start_y, end_y;

logic [26:0] start_addr, curr_addr_d, curr_addr_q;
/* 640 * curr_y = (512 * curr_y) + (128 * curr_y) = curr_y << 9 + curr_y << 7
   doing this to avoid inferring a DSP unit ~ we want to preserve as many as possible
*/
assign start_addr = (({17'b0, start_y} << 9) + ({17'b0, start_y} << 7)) + start_x;

// register states
always_ff @(posedge clk) begin
  if (rst) begin
    rasterizer_state_q <= StIdle;
    curr_addr_q <= 'b0;
    curr_x_q <= 'b0;
    curr_y_q <= 'b0;
  end else begin
    if (!stall) begin
      rasterizer_state_q <= rasterizer_state_d;
      curr_addr_q <= curr_addr_d;
      curr_x_q <= curr_x_d;
      curr_y_q <= curr_y_d;
    end

    // latch values
    if (vertex_valid) begin
      start_x   <= x1;
      end_x     <= x2;
      start_y   <= y1;
      end_y     <= y2;
    end
  end
end

// combinational decode of states
always_comb begin
  rasterizer_state_d = rasterizer_state_q;
  curr_addr_d = curr_addr_q;
  curr_x_d = curr_x_q;
  curr_y_d = curr_y_q;

  rasterizer_done = 1'b0;
  mem_valid = 1'b0;
  mem_data = 16'b0;
  mem_addr = 27'b0;

  unique case (rasterizer_state_q)
    StIdle: begin
      if (vertex_valid) 
        rasterizer_state_d = StSetup;
      else
        rasterizer_state_d = StIdle;
    end
    StSetup: begin
    // redundant state to allow for registers to settle, also allows us to toggle mem_valid
      rasterizer_state_d = StDraw;
      curr_addr_d = start_addr;

      curr_x_d = start_x;
      curr_y_d = start_y;
    end
    StDraw: begin
      mem_data = {4'b0, color};
      mem_addr = curr_addr_q;
      mem_valid = 1'b1;
    // this needs to be updated with more boundary conditions when we implement triangle-rasterization (necessary for more complex shapes)
      if (wb_ready) begin
        if (curr_x_q == end_x) begin
          if (curr_y_q == end_y) begin
            rasterizer_state_d = StDone;
          end else begin
            curr_x_d = start_x;
            curr_y_d = curr_y_d + 1;
            curr_addr_d = curr_addr_d + lp_HORIZ_PIXEL_WIDTH - (end_x - start_x);
            rasterizer_state_d = StDraw;
          end
        end else begin
          curr_x_d = curr_x_d + 1;
          curr_addr_d = curr_addr_d + 1;
          rasterizer_state_d = StDraw;
        end
      end else
        rasterizer_state_d = StDraw;
    end
    StDone: begin
      rasterizer_state_d = StIdle;
      rasterizer_done = 1'b1;
    end
    // catch parasitic states
    default: rasterizer_state_d = StIdle;
  endcase
end


endmodule

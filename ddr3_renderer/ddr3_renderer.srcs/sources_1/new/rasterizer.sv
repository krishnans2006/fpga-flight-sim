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
  // currently we're working with a "box" rasterizer
  input logic         vertex_valid,
  input logic [9:0]   x1, x2, y1, y2,
  input logic [11:0]  color,
  
  output logic        mem_valid,
  output logic [26:0] mem_addr,
  output logic [15:0] mem_data
); 

typedef enum {
  StIdle, StSetup, StDraw, StDone
} rasterizer_state_e;

rasterizer_state_e rasterizer_state_d, rasterizer_state_q;

// we will latch these
logic [9:0] curr_x, curr_y, 
            start_x, end_x, 
            start_y, start_x;

logic [26:0] start_addr;
/* 640 * curr_y = (512 * curr_y) + (128 * curr_y) = curr_y << 9 + curr_y << 7
   doing this to avoid inferring a DSP unit ~ we want to preserve as many as possible
*/
assign start_addr = (curr_y << 9 + curr_y << 7) + curr_x;

// register states
always_ff @(posedge clk) begin
  if (rst) begin
    rasterizer_state_q <= StIdle;
  end else begin
    rasterizer_state_q <= rasterizer_state_d;

    // latch values
    if (vertex_valid) begin
      start_x <= x1;
      end_x <= x2;
      start_y <= y1;
      end_y <= y2;
    end
  end
end

// combinational decode of states
always_comb begin
  rasterizer_state_d = rasterizer_state_q;
  rasterizer_done = 1'b0;

  unique case (rasterizer_state_q)
    StIdle:
    StSetup:
    StDraw:
    StDone: begin
      rasterizer_state_d = StIdle;
      rasterizer_done = 1'b1;
    end
    // catch parasitic states
    default: rasterizer_state_d = StIdle;
  endcase
end


endmodule

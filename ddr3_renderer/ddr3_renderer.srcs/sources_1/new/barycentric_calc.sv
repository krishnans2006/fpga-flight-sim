`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2025 01:31:00 AM
// Design Name: 
// Module Name: barycentric_calc
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
// Adapted to SystemVerilog from https://alchitry.com/tutorials/projects/gpu/
// FP32 is expensive to implement, so we get around that by using fixed-point representations, like Q8.24
// inherently pipelined, 7 cycles of latency
//////////////////////////////////////////////////////////////////////////////////


module barycentric_calc (
  input logic     clk,
  input logic     stall,

  // three triangle vertices
  input logic [9:0]    t0_x, t0_y,
  input logic [9:0]    t1_x, t1_y,
  input logic [9:0]    t2_x, t2_y,

  // inverse triangle area in Q8.24
  input logic [31:0]   inv_area,
  input logic [9:0]    point_x, point_y,

  // output to rasterizer
  output logic         within_tri,
  output logic [31:0]  alpha, beta, gamma
);

/* For reference, all variables have a suffix _[n] where n refers to the stage in the pipeline */

// Stage 1 -> 2
logic [31:0] a_1, b_1, c_1, d_1, e_1, f_1;
logic [31:0] dp_1;

// Stage 2 -> 3
logic [63:0] mr1_2, mr2_2, mr3_2, mr4_2;
logic [31:0] dp_2;

// Stage 3 -> 4
logic [63:0] mr1_3, mr2_3, mr3_3, mr4_3;
logic [31:0] dp_3;

// Stage 4 -> 5
logic [63:0] m1_4, m2_4;
logic [31:0] dp_4;

// Stage 5 -> 6
logic [31:0] r_norm1_5, r_norm2_5;
logic [63:0] r_unnorm1_5, r_unnorm2_5, r_unnorm3_5;

// Stage 6 -> 7 67 67 67 67 \_(^^)___
logic [31:0] r_norm1_6, r_norm2_6;
logic        within_tri_6;

// Output
logic [31:0] alpha_o, beta_o, gamma_o;
logic        within_tri_7;

// we can setup initial values combinationally
assign a_1 = $signed({t1_y, 16'b0}) - $signed({t2_y, 16'b0});
assign b_1 = $signed({t2_x, 16'b0}) - $signed({t1_x, 16'b0});
assign c_1 = $signed({t2_y, 16'b0}) - $signed({t0_y, 16'b0});
assign d_1 = $signed({t0_x, 16'b0}) - $signed({t2_x, 16'b0});
assign e_1 = $signed({point_x, 16'b0}) - $signed({t2_x, 16'b0});
assign f_1 = $signed({point_y, 16'b0}) - $signed({t2_y, 16'b0});
assign dp_1 = inv_area;

always_ff @(posedge clk) begin
  if (~stall) begin
    // fill this out later
  end
end

assign alpha = alpha_o;
assign beta = beta_o;
assign gamma = gamma_o;
assign within_tri = within_tri_7;

endmodule

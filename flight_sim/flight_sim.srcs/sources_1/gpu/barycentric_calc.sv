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
// No idea how any of this math works tbh
// FP32 is expensive to implement, so we get around that by using fixed-point representations, like Q8.24
// inherently pipelined, 7 cycles of latency
// This module uses quite a few DSP units, pray that impl makes this work
//////////////////////////////////////////////////////////////////////////////////

module barycentric_calc (
  input logic     clk,
  input logic     stall,

  // three triangle vertices
  input logic [15:0]    t0_x, t0_y,
  input logic [15:0]    t1_x, t1_y,
  input logic [15:0]    t2_x, t2_y,

  // inverse triangle area in Q8.24
  input logic [31:0]   inv_area,
  input logic [15:0]    point_x, point_y,

  // output to rasterizer
  output logic         within_tri,
  output logic [31:0]  alpha, beta, gamma
);

/* For reference, all variables have a suffix _[n] where n refers to the stage in the pipeline */

// Stage 1 -> 2
logic signed [31:0] a_1, b_1, c_1, d_1, e_1, f_1;
logic signed [31:0] ara_1, arb_1, arc_1, ard_1;
logic signed [31:0] dp_1;

// Stage 2 -> 3
logic signed [63:0] mr1_2, mr2_2, mr3_2, mr4_2;
logic signed [63:0] mar1_2, mar2_2;
logic signed [31:0] dp_2;

// Stage 3 -> 4
logic signed [63:0] mr1_3, mr2_3, mr3_3, mr4_3;
logic signed [63:0] mar1_3, mar2_3;
logic signed [31:0] dp_3;

// Stage 4 -> 5
logic signed [63:0] m1_4, m2_4;
logic signed [127:0] tmp1, tmp2;
logic signed [63:0] mar_4;
logic signed [31:0] dp_4;

// Stage 5 -> 6
logic signed [31:0] r_norm1_5, r_norm2_5;
logic neg_area;
logic signed [63:0] r_unnorm1_5, r_unnorm2_5, r_unnorm3_5;

// Stage 6 -> 7 67 67 67 67 \_(^^)___
logic signed [31:0] r_norm1_6, r_norm2_6;
logic               within_tri_6;

// Output
logic signed [31:0] alpha_o, beta_o, gamma_o;
logic               within_tri_7;

// stage 5 intermediate calculation
always_comb begin
  tmp1 = $signed(m1_4[47:16]) * $signed(dp_4);
  tmp2 = $signed(m2_4[47:16]) * $signed(dp_4);
end

always_ff @(posedge clk) begin
  if (~stall) begin
    // Stage 1 -> 1
    a_1 <= ($signed(t1_y) - $signed(t2_y)) <<< 16;
    b_1 <= ($signed(t2_x) - $signed(t1_x)) <<< 16;
    c_1 <= ($signed(t2_y) - $signed(t0_y)) <<< 16;
    d_1 <= ($signed(t0_x) - $signed(t2_x)) <<< 16;
    e_1 <= ($signed(point_x) - $signed(t2_x)) <<< 16;
    f_1 <= ($signed(point_y) - $signed(t2_y)) <<< 16;
    
    ara_1 <= ($signed(t1_y) - $signed(t2_y)) <<< 16;
    arb_1 <= ($signed(t0_x) - $signed(t2_x)) <<< 16;
    arc_1 <= ($signed(t2_x) - $signed(t1_x)) <<< 16;
    ard_1 <= ($signed(t0_y) - $signed(t2_y)) <<< 16;

    dp_1 <= inv_area;

    // Stage 1 -> 2
    mr1_2 <= a_1 * e_1;
    mr2_2 <= b_1 * f_1;
    mr3_2 <= c_1 * e_1;
    mr4_2 <= d_1 * f_1;

    mar1_2 <= ara_1 * arb_1;
    mar2_2 <= arc_1 * ard_1;
    dp_2  <= dp_1;

    // Stage 2 -> 3 -- I think this is to account for hardware multiplier latency?
    mr1_3 <= mr1_2;
    mr2_3 <= mr2_2;
    mr3_3 <= mr3_2;
    mr4_3 <= mr4_2;

    mar1_3 <= mar1_2;
    mar2_3 <= mar2_2;
    dp_3  <= dp_2;

    // Stage 3 -> 4
    m1_4 <= mr1_3 + mr2_3;
    m2_4 <= mr3_3 + mr4_3;

    mar_4 <= mar1_3 + mar2_3;
    dp_4 <= dp_3;

    // Stage 4 -> 5
    r_norm1_5 <= $signed(tmp1[47:16]) + tmp1[48];
    r_norm2_5 <= $signed(tmp2[47:16]) + tmp2[48];

    r_unnorm1_5 <= m1_4;
    r_unnorm2_5 <= m2_4;
    neg_area <= mar_4[63];
    r_unnorm3_5 <= mar_4 - m1_4 - m2_4;

    // Stage 5 -> 6
    r_norm1_6 <= r_norm1_5;
    r_norm2_6 <= r_norm2_5;
    
    if (neg_area)
        within_tri_6 <= (r_unnorm1_5[63] && r_unnorm2_5[63] && r_unnorm3_5[63]);
    else 
        within_tri_6 <= (~r_unnorm1_5[63] && ~r_unnorm2_5[63] && ~r_unnorm3_5[63]);

    // Stage 6 -> 7
    alpha_o <= r_norm1_6;
    beta_o <= r_norm2_6;
    gamma_o <= $signed(32'h01000000) - r_norm1_6 - r_norm2_6; // magic numbers yippeeee
    within_tri_7 <= within_tri_6;

  end
end

assign alpha = alpha_o;
assign beta = beta_o;
assign gamma = gamma_o;
assign within_tri = within_tri_7;

endmodule

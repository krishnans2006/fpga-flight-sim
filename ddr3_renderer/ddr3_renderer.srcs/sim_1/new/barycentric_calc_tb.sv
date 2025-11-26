`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2025 02:17:04 PM
// Design Name: 
// Module Name: barycentric_calc_tb
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
// 
//////////////////////////////////////////////////////////////////////////////////


module barycentric_calc_tb;

  // -------------------------------------------------------------------------
  // Signals and Constants
  // -------------------------------------------------------------------------
  logic clk;
  logic stall;

  // Triangle Vertices
  logic signed [15:0] t0_x, t0_y;
  logic signed [15:0] t1_x, t1_y;
  logic signed [15:0] t2_x, t2_y;

  // Inputs
  logic [31:0] inv_area;
  logic signed [15:0] point_x, point_y;

  // Outputs
  logic within_tri;
  logic [31:0] alpha, beta, gamma;

  // Constants for Fixed Point Q8.24
  localparam real Q24_SCALE = 16777216.0; // 2^24

  // -------------------------------------------------------------------------
  // DUT Instantiation
  // -------------------------------------------------------------------------
  barycentric_calc u_dut (
    .clk(clk),
    .stall(stall),
    .t0_x(t0_x), .t0_y(t0_y),
    .t1_x(t1_x), .t1_y(t1_y),
    .t2_x(t2_x), .t2_y(t2_y),
    .inv_area(inv_area),
    .point_x(point_x), .point_y(point_y),
    .within_tri(within_tri),
    .alpha(alpha), .beta(beta), .gamma(gamma)
  );

  // -------------------------------------------------------------------------
  // Clock Generation
  // -------------------------------------------------------------------------
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period (100MHz)
  end

  // -------------------------------------------------------------------------
  // Helper Functions
  // -------------------------------------------------------------------------
  
  // Convert Q8.24 to Real for printing
  function real fixed_to_real(input logic [31:0] val);
    logic signed [31:0] s_val;
    s_val = val;
    return $itor(s_val) / Q24_SCALE;
  endfunction

  // Calculate Triangle Area (Cross Product) needed for inv_area input
  // Matches the winding order logic of the DUT
  function logic [31:0] calc_inv_area(int x0, int y0, int x1, int y1, int x2, int y2);
    real area;
    // Area calc based on edge functions (standard 2D cross product)
    // Area = (x1 - x2) * (y0 - y2) - (y1 - y2) * (x0 - x2)
    // Note: The DUT calculates unnormalized weights. The sum of weights = Area.
    // The specific winding formula adapted from Alchitry/standard rasterizers:
    area = (y1 - y2) * (x0 - x2) + (x2 - x1) * (y0 - y2);
    
    // If area is 0, return 0 to avoid div by zero (degenerate triangle)
    if (area == 0) return 0;
    
    // Return 1.0 / Area in Q8.24 format
    return $rtoi((1.0 / area) * Q24_SCALE);
  endfunction

  // -------------------------------------------------------------------------
  // Test Procedure
  // -------------------------------------------------------------------------
  initial begin
    // Initialize
    stall = 0;
    t0_x = 0; t0_y = 0;
    t1_x = 0; t1_y = 0;
    t2_x = 0; t2_y = 0;
    point_x = 0; point_y = 0;
    inv_area = 0;

    // Wait for global reset (if any)
    repeat(5) @(posedge clk);
    
    $display("Starting Barycentric Calculator Testbench...");
    $display("----------------------------------------------------------------");

    // =========================================================
    // Test Case 1: Standard Right Triangle
    // (10,50) -> (10, 55) -> (15, 50)
    // =========================================================
    $display("Test Case 1: Right Angle Triangle");
    
    // 1. Setup Triangle
    t0_x = 10; t0_y = 50;
    t1_x = 10; t1_y = 55;
    t2_x = 15; t2_y = 50;
    
    // 2. Calculate Inverse Area and drive it
    inv_area = calc_inv_area(t0_x, t0_y, t1_x, t1_y, t2_x, t2_y);
    
    // 3. Drive a point strictly INSIDE the triangle (Example: 30, 30)
    // Expected: Equal pull from t0, and some from others.
    drive_pixel(11, 51, "Inside Point");

    // 4. Drive a point ON VERTEX t0 (10, 10)
    // Expected: Alpha or Beta or Gamma should be approx 1.0 (depending on vertex assignment)
    drive_pixel(10, 50, "Vertex T0");

    // 5. Drive a point OUTSIDE the triangle (150, 150)
    // Expected: within_tri = 0.
    drive_pixel(11, 54, "Outside Point");

    // =========================================================
    // Test Case 2: Pipelining Stress Test
    // Feed 3 points back-to-back without waiting
    // =========================================================
    $display("\nTest Case 2: Pipeline Stress (3 points back-to-back)");
    
    // Feed inputs
    @(posedge clk);
    point_x = 12; point_y = 51; // Inside
    @(posedge clk);
    point_x = 13; point_y = 50; // Vertex
    @(posedge clk);
    point_x = 200; point_y = 200; // Outside
    
    // Wait for latency (7 cycles from first input)
    // We fed 3 inputs, so we expect 3 valid outputs sequentially
    repeat(5) @(posedge clk); // Already waited 2 posedges during feed

    // Check Output 1
    $display("Pipeline Out 1 (Inside): Within=%b | Alpha=%0.4f Beta=%0.4f Gamma=%0.4f", 
             within_tri, fixed_to_real(alpha), fixed_to_real(beta), fixed_to_real(gamma));
    
    @(posedge clk);
    // Check Output 2
    $display("Pipeline Out 2 (Vertex): Within=%b | Alpha=%0.4f Beta=%0.4f Gamma=%0.4f", 
             within_tri, fixed_to_real(alpha), fixed_to_real(beta), fixed_to_real(gamma));

    @(posedge clk);
    // Check Output 3
    $display("Pipeline Out 3 (Outsd) : Within=%b | Alpha=%0.4f Beta=%0.4f Gamma=%0.4f", 
             within_tri, fixed_to_real(alpha), fixed_to_real(beta), fixed_to_real(gamma));

    // =========================================================
    // Test Case 3: Stall Verification
    // =========================================================
    $display("\nTest Case 3: Stall Logic");
    point_x = 60; point_y = 60; // Valid point
    
    @(posedge clk);
    stall = 1; // Assert Stall immediately after providing input
    $display("Stall asserted.");
    
    repeat(10) @(posedge clk); // Wait longer than pipeline depth
    
    stall = 0; // Release Stall
    $display("Stall released.");
    
    // Wait remaining cycles (approx 6-7)
    repeat(7) @(posedge clk);
    
    $display("Post-Stall Output: Within=%b | Alpha=%0.4f", within_tri, fixed_to_real(alpha));
    if(within_tri === 1'b1) $display("SUCCESS: Data preserved during stall.");
    else $display("FAILURE: Data lost during stall.");

    $stop;
  end

  // -------------------------------------------------------------------------
  // Driver Task
  // -------------------------------------------------------------------------
  task drive_pixel(input logic signed [15:0] px, input logic signed [15:0] py, string desc);
    begin
      // Drive Input
      point_x = px;
      point_y = py;
      
      // The module has 7 cycles of latency
      repeat(7) @(posedge clk);
      
      // Check Output (Sample just after the 7th edge)
      #1; 
      $display("[%s] In=(%0d,%0d) | Inside=%b | A=%.3f B=%.3f G=%.3f | Sum=%.3f",
        desc, px, py, within_tri, 
        fixed_to_real(alpha), fixed_to_real(beta), fixed_to_real(gamma),
        fixed_to_real(alpha) + fixed_to_real(beta) + fixed_to_real(gamma)
      );
    end
  endtask

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 12:46:07 PM
// Design Name: 
// Module Name: tb_integrated
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


`timescale 1ns / 1ps

module tb_integrated;

  // -------------------------------------------------------------------------
  // 1. Signal Declarations
  // -------------------------------------------------------------------------
  logic clk;
  logic rst;

  // Control Signals
  logic start_frame;
  logic model_done;
  logic [3:0] sel;

  // Interconnect: Model Engine -> Projector
  logic        link_valid; // proj_valid from engine
  logic        link_ready; // ready from projector
  logic signed [31:0] t_x [3];
  logic signed [31:0] t_y [3];
  logic signed [31:0] t_z [3];
  logic [15:0] face_color;

  // Projector Outputs
  logic signed [31:0] p_x [3];
  logic signed [31:0] p_y [3];
  logic signed [31:0] p_z [3];
  logic [31:0] dr; // 1/Area
  logic        out_valid;
  logic [15:0] color_out;
  
  // Stall emulation (optional, held low for max throughput)
  logic        stall_rasterizer;

  // -------------------------------------------------------------------------
  // 2. DUT Instantiations
  // -------------------------------------------------------------------------

  model_engine u_engine (
    .clk        (clk),
    .rst        (rst),
    .start_frame(start_frame),
    .model_done (model_done),
    
    // Handshake & Data
    .proj_ready (link_ready),
    .proj_valid (link_valid),
    .t_x        (t_x),
    .t_y        (t_y),
    .t_z        (t_z),
    .face_color (face_color)
  );

  projector u_projector (
    .clk      (clk),
    .rst      (rst),
    
    // Inputs from Engine
    .t_x      (t_x),
    .t_y      (t_y),
    .t_z      (t_z),
    .color    (face_color),
    .in_valid (link_valid),
    .ready    (link_ready),
    
    // Outputs to Rasterizer (monitored by TB)
    .p_x      (p_x),
    .p_y      (p_y),
    .p_z      (p_z),
    .dr       (dr),
    .out_valid(out_valid),
    .color_out(color_out),
    
    // Backpressure input
    .stall    (stall_rasterizer)
  );

  // -------------------------------------------------------------------------
  // 3. Clock & Helper Functions
  // -------------------------------------------------------------------------
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz
  end

  // Helper to display Q16.16 as float
  function real to_real(input signed [31:0] val);
    return real'(val) / 65536.0;
  endfunction

  // -------------------------------------------------------------------------
  // 4. Main Stimulus
  // -------------------------------------------------------------------------
  initial begin
    // Init
    rst = 1;
    start_frame = 0;
    sel = 0;
    stall_rasterizer = 0; // Simulate an always-ready Rasterizer

    // Reset Sequence
    #100;
    rst = 0;
    #20;

    $display("--- Starting Simulation ---");

    // TEST CASE 1: Process 2 Faces (Indices 0 to 1)
    // 'sel' in model_engine is the *stop index*.
    // If logic is `if (face_ctr_q == sel) done`, setting sel=1 processes faces 0 and 1.
    sel = 4'd1; 
    
    @(posedge clk);
    start_frame = 1;
    @(posedge clk);
    start_frame = 0;

    $display("[%0t] Frame Started. Requesting Faces 0 to %0d...", $time, sel);

    // Wait for Model Engine to finish fetching
    wait(model_done);
    $display("[%0t] Model Engine DONE. Waiting for Projector to drain...", $time);

    // Wait extra time for the Projector pipeline (Divider latency) to finish
    // A safe margin is ~100 cycles per face
    repeat(200) @(posedge clk);

    $display("--- Simulation Finished ---");
    $finish;
  end

  // -------------------------------------------------------------------------
  // 5. Output Monitor
  // -------------------------------------------------------------------------
  
  // Monitor the link between Engine and Projector
  always @(posedge clk) begin
    if (link_valid && link_ready) begin
      $display("[%0t] HANDSHAKE: Engine sent Face to Projector.", $time);
      $display("        Raw V0: (%f, %f, %f)", to_real(t_x[0]), to_real(t_y[0]), to_real(t_z[0]));
      // Note: Since we don't know ROM contents, we just print the raw values to verify movement.
    end
  end

  // Monitor the output of the Projector
  integer face_count = 0;
  
  always @(posedge clk) begin
    if (out_valid) begin
      $display("---------------------------------------------------------------");
      $display("[%0t] PROJECTOR OUTPUT VALID (Face %0d)", $time, face_count);
      $display("        Color: 0x%h", color_out);
      $display("        InvArea (dr): %f", to_real(dr));
      
      // Display projected points
      // Note: These values depend on your scaling logic in the projector
      // If they look like huge integers, it's because of the bit-shifts in the projector module.
      $display("        P0: x=%f, y=%f, z=%f", to_real(p_x[0]), to_real(p_y[0]), to_real(p_z[0]));
      $display("        P1: x=%f, y=%f, z=%f", to_real(p_x[1]), to_real(p_y[1]), to_real(p_z[1]));
      $display("        P2: x=%f, y=%f, z=%f", to_real(p_x[2]), to_real(p_y[2]), to_real(p_z[2]));
      
      face_count++;
      $display("---------------------------------------------------------------");
    end
  end

endmodule
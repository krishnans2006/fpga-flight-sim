`timescale 1ns / 1ps

module tb_model_engine;

  // -------------------------------------------------------------------------
  // 1. Signal Declarations
  // -------------------------------------------------------------------------
  logic clk;
  logic rst;
  logic start_frame;
  logic model_done;

  // Projector interface signals
  logic proj_ready;
  logic proj_valid;
  logic signed [31:0] t_x [3];
  logic signed [31:0] t_y [3];
  logic signed [31:0] t_z [3];
  logic [15:0] face_color;

  // -------------------------------------------------------------------------
  // 2. DUT Instantiation
  // -------------------------------------------------------------------------
  model_engine dut (
    .clk        (clk),
    .rst        (rst),
    .start_frame(start_frame),
    .model_done (model_done),
    .proj_ready (proj_ready),
    .proj_valid (proj_valid),
    .t_x        (t_x),
    .t_y        (t_y),
    .t_z        (t_z),
    .face_color (face_color)
  );

  // -------------------------------------------------------------------------
  // 3. Clock Generation (100MHz)
  // -------------------------------------------------------------------------
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // -------------------------------------------------------------------------
  // 4. Stimulus Process
  // -------------------------------------------------------------------------
  initial begin
    // Initialize Inputs
    rst = 1;
    start_frame = 0;
    proj_ready = 0;

    // Hold reset for 100ns
    #100;
    rst = 0;
    #20;

    // Start the frame processing
    $display("--- Starting Simulation ---");
    start_frame = 1;
    @(posedge clk); 
    start_frame = 0;

    // Simulate downstream readiness (projector is ready to accept data)
    // You can toggle this to test flow control, but setting to 1 yields max throughput.
    proj_ready = 1;

    // Wait for the engine to finish all faces
    wait(model_done);
    
    // Allow a few cycles for final states to settle
    #100;
    $display("--- Model Processing Complete ---");
    $finish;
  end

  // -------------------------------------------------------------------------
  // 5. Output Monitor
  // -------------------------------------------------------------------------
  // This block watches for valid data on every clock edge and prints it.
  always @(posedge clk) begin
    if (proj_valid && proj_ready) begin
      $display("Time: %0t | Face Output Detected", $time);
      $display("  Color: 0x%h", face_color);
      
      // Loop through the 3 vertices of the triangle
      for (int i = 0; i < 3; i++) begin
        $display("  Vertex %0d: X=%0d, Y=%0d, Z=%0d", 
                 i, t_x[i], t_y[i], t_z[i]);
      end
      $display("-------------------------------------------");
    end
  end

endmodule
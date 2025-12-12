`timescale 1ns / 1ps

module tb_model_engine;

    // =================================================================
    // 1. Signal Declarations
    // =================================================================
    logic clk;
    logic rst;

    // Control
    logic start_frame;
    logic frame_done;

    // Projector Interface
    logic proj_ready;
    logic proj_valid;
    logic signed [31:0] t_x [3];
    logic signed [31:0] t_y [3];
    logic signed [31:0] t_z [3];
    logic [15:0] t_color;

    // =================================================================
    // 2. DUT Instantiation
    // =================================================================
    model_engine dut (
        .clk(clk),
        .rst(rst),
        .start_frame(start_frame),
        .model_done(frame_done),
        .proj_ready(proj_ready),
        .proj_valid(proj_valid),
        .t_x(t_x),
        .t_y(t_y),
        .t_z(t_z),
        .face_color(t_color)
    );

    // =================================================================
    // 3. Clock Generation
    // =================================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz
    end

    // =================================================================
    // 4. Helper: Fixed Point to Float
    // =================================================================
    function real q16_to_float(logic signed [31:0] val);
        return real'(val) / 65536.0;
    endfunction

    // =================================================================
    // 5. Test Stimulus
    // =================================================================
    initial begin
        // Init
        rst = 1;
        start_frame = 0;
        proj_ready = 0; // Initially busy
        
        #20 rst = 0;
        #20;

        $display("=== Simulation Start ===");
        
        // Start Frame
        $display("[%0t] Starting Frame...", $time);
        start_frame = 1;
        @(posedge clk);
        start_frame = 0;

        // Wait for first triangle (proj_valid)
        // The engine has to fetch Face index (Latencies) + 3 Vertices (Latencies)
        wait(proj_valid);
        $display("[%0t] Projector Valid Asserted!", $time);
        
        // Verify Triangle 0 (Front Face 1: Indices 0, 1, 2)
        // Expected Data based on .coe file:
        // V0: (-1, -1, 30)
        // V1: ( 1, -1, 30)
        // V2: ( 1,  1, 30)
        // Color: Red (0x0F00)
        
        verify_triangle(0, 
            -1.0, -1.0, 30.0, 
             1.0, -1.0, 30.0, 
             1.0,  1.0, 30.0, 
             16'h0F00
        );

        // Acknowledge Triangle 0
        @(posedge clk);
        proj_ready = 1; 
        @(posedge clk);
        proj_ready = 0; // Apply backpressure immediately to test stall logic
        repeat (5) @(posedge clk);

        // Wait for Triangle 1
        wait(proj_valid);
        $display("[%0t] Projector Valid Asserted (Triangle 1)!", $time);
        
        // Verify Triangle 1 (Front Face 2: Indices 0, 2, 3)
        // V0: (-1, -1, 30)
        // V2: ( 1,  1, 30)
        // V3: (-1,  1, 30)
        
        verify_triangle(1, 
            -1.0, -1.0, 30.0, 
             1.0,  1.0, 30.0, 
            -1.0,  1.0, 30.0, 
             16'h0F00
        );

        // Let the rest run freely
        proj_ready = 1;
        
        wait(frame_done);
        $display("[%0t] Frame Done Signal Asserted!", $time);
        
        #50;
        $finish;
    end

    // Verification Task
    task verify_triangle(
        input int id,
        input real e_x0, input real e_y0, input real e_z0,
        input real e_x1, input real e_y1, input real e_z1,
        input real e_x2, input real e_y2, input real e_z2,
        input logic [15:0] e_color
    );
        real x[3], y[3], z[3];
        int i;
        logic error;
        error = 0;

        for(i=0; i<3; i++) begin
            x[i] = q16_to_float(t_x[i]);
            y[i] = q16_to_float(t_y[i]);
            z[i] = q16_to_float(t_z[i]);
        end

        $display("  Triangle %0d Received:", id);
        $display("    V0: (%.1f, %.1f, %.1f)", x[0], y[0], z[0]);
        $display("    V1: (%.1f, %.1f, %.1f)", x[1], y[1], z[1]);
        $display("    V2: (%.1f, %.1f, %.1f)", x[2], y[2], z[2]);
        $display("    Color: %h", t_color);

        // Simple Check (Approximate float equality)
        if (x[0] != e_x0 || y[0] != e_y0 || z[0] != e_z0) error = 1;
        if (x[1] != e_x1 || y[1] != e_y1 || z[1] != e_z1) error = 1;
        if (x[2] != e_x2 || y[2] != e_y2 || z[2] != e_z2) error = 1;
        if (t_color !== e_color) error = 1;

        if (error) $error("  [FAIL] Data Mismatch!");
        else $display("  [PASS] Data Matches Expected.");
    endtask

endmodule
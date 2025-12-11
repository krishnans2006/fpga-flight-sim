`timescale 1ns / 1ps

module tb_projector;

    // =================================================================
    // 1. Signal Declarations
    // =================================================================
    logic clk;
    logic rst;

    // Inputs (View Space Vertices - Q16.16)
    logic signed [31:0] t_x [3];
    logic signed [31:0] t_y [3];
    logic signed [31:0] t_z [3];
    logic in_valid;
    logic stall;

    // Outputs (Screen Space - Q16.16)
    logic signed [31:0] p_x [3];
    logic signed [31:0] p_y [3];
    logic signed [31:0] p_z [3];
    
    // Output 1/Area (Q8.24)
    logic signed [31:0] dr;
    logic out_valid;
    logic ready;

    // =================================================================
    // 2. DUT Instantiation
    // =================================================================
    projector dut (
        .clk(clk),
        .rst(rst),
        .t_x(t_x),
        .t_y(t_y),
        .t_z(t_z),
        .in_valid(in_valid),
        .ready(ready),
        .p_x(p_x),
        .p_y(p_y),
        .p_z(p_z),
        .dr(dr),
        .out_valid(out_valid),
        .stall(stall)
    );

    // =================================================================
    // 3. Clock Generation
    // =================================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz
    end

    // =================================================================
    // 4. Helper Functions (Fixed Point)
    // =================================================================
    function logic [31:0] float_to_q16(real val);
        return $rtoi(val * 65536.0);
    endfunction

    function real q16_to_float(logic signed [31:0] val);
        return real'(val) / 65536.0;
    endfunction
    
    // New Helper for Q8.24
    function real q24_to_float(logic signed [31:0] val);
        return real'(val) / 16777216.0;
    endfunction

    // =================================================================
    // 5. Checker Task
    // =================================================================
    task verify_outputs();
        real x0, y0, x1, y1, x2, y2;
        real double_area;
        real expected_dr;
        real actual_dr_scaled;
        real error_margin;
        
        // 1. Capture Outputs as Floats
        x0 = q16_to_float(p_x[0]); y0 = q16_to_float(p_y[0]);
        x1 = q16_to_float(p_x[1]); y1 = q16_to_float(p_y[1]);
        x2 = q16_to_float(p_x[2]); y2 = q16_to_float(p_y[2]);
        
        $display("  Screen Coords: V0(%.2f, %.2f), V1(%.2f, %.2f), V2(%.2f, %.2f)", x0, y0, x1, y1, x2, y2);

        // 2. Calculate 2*Area
        double_area = (y1 - y2) * (x0 - x2) + (x2 - x1) * (y0 - y2);
        $display("  Calculated 2*Area (Determinant): %.6f", double_area);

        // 3. Compare Reciprocal Determinant (dr)
        // Hardware DR is Q8.24
        actual_dr_scaled = q24_to_float(dr);
        
        if (double_area != 0) expected_dr = 1.0 / double_area;
        else expected_dr = 0;

        $display("  Output dr (Q8.24 view): %.10f | Expected (1/Det): %.10f", actual_dr_scaled, expected_dr);
        
        error_margin = (actual_dr_scaled - expected_dr);
        if (error_margin < 0) error_margin = -error_margin;
        
        if (error_margin < 0.0001) $display("  [PASS] Determinant is correct.");
        else $display("  [WARN] Determinant scaling mismatch (Diff: %.6f).", error_margin);
    endtask

    // =================================================================
    // 6. Test Stimulus
    // =================================================================
    initial begin
        // Initialize
        rst = 1; in_valid = 0; stall = 0;
        t_x = '{0, 0, 0}; t_y = '{0, 0, 0}; t_z = '{0, 0, 0};

        #20 rst = 0;
        #20;

        $display("=== Simulation Start ===");

        // -------------------------------------------------------------
        // Test 1: Large Triangle at Z=10.0
        // Fits well on screen. Used for basic coordinate check.
        // -------------------------------------------------------------
        $display("[%0t] Test 1: Standard Triangle (Z=10.0)", $time);
        
        wait(ready);
        @(posedge clk);
        t_x[0] = float_to_q16(-1.0); t_y[0] = float_to_q16(-1.0); t_z[0] = float_to_q16(10.0);
        t_x[1] = float_to_q16( 1.0); t_y[1] = float_to_q16(-1.0); t_z[1] = float_to_q16(10.0);
        t_x[2] = float_to_q16( 0.0); t_y[2] = float_to_q16( 1.0); t_z[2] = float_to_q16(10.0);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        // -------------------------------------------------------------
        // Test 2: Small Triangle at Z=10.0
        // Vertices are only 0.1 units apart.
        // -------------------------------------------------------------
        $display("[%0t] Test 2: Small Triangle (Z=10.0, width=0.2)", $time);
        
        wait(ready);
        @(posedge clk);
        t_x[0] = float_to_q16(-0.1); t_y[0] = float_to_q16(-0.1); t_z[0] = float_to_q16(10.0);
        t_x[1] = float_to_q16( 0.1); t_y[1] = float_to_q16(-0.1); t_z[1] = float_to_q16(10.0);
        t_x[2] = float_to_q16( 0.0); t_y[2] = float_to_q16( 0.1); t_z[2] = float_to_q16(10.0);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        // -------------------------------------------------------------
        // Test 3: Off-Center Triangle at Z=15.0
        // Shifted to Top-Right quadrant.
        // -------------------------------------------------------------
        $display("[%0t] Test 3: Off-Center Triangle (Z=15.0)", $time);
        
        wait(ready);
        @(posedge clk);
        // Center around (0.5, 0.5)
        t_x[0] = float_to_q16( 0.4); t_y[0] = float_to_q16( 0.4); t_z[0] = float_to_q16(15.0);
        t_x[1] = float_to_q16( 0.6); t_y[1] = float_to_q16( 0.4); t_z[1] = float_to_q16(15.0);
        t_x[2] = float_to_q16( 0.5); t_y[2] = float_to_q16( 0.6); t_z[2] = float_to_q16(15.0);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        // -------------------------------------------------------------
        // Test 4: Near Camera Triangle (Z=2.5)
        // Should result in very large screen coordinates (possibly off-screen)
        // -------------------------------------------------------------
        $display("[%0t] Test 4: Near Camera (Z=2.5) - Expect Large Coords", $time);
        
        wait(ready);
        @(posedge clk);
        t_x[0] = float_to_q16(-1.0); t_y[0] = float_to_q16(-1.0); t_z[0] = float_to_q16(2.5);
        t_x[1] = float_to_q16( 1.0); t_y[1] = float_to_q16(-1.0); t_z[1] = float_to_q16(2.5);
        t_x[2] = float_to_q16( 0.0); t_y[2] = float_to_q16( 1.0); t_z[2] = float_to_q16(2.5);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        // -------------------------------------------------------------
        // Test 5: Far Camera Triangle (Z=100.0)
        // Should result in coordinates very close to center (320, 240)
        // -------------------------------------------------------------
        $display("[%0t] Test 5: Far Camera (Z=100.0) - Expect Center Convergence", $time);
        
        wait(ready);
        @(posedge clk);
        t_x[0] = float_to_q16(-2.0); t_y[0] = float_to_q16(-2.0); t_z[0] = float_to_q16(100.0);
        t_x[1] = float_to_q16( 2.0); t_y[1] = float_to_q16(-2.0); t_z[1] = float_to_q16(100.0);
        t_x[2] = float_to_q16( 0.0); t_y[2] = float_to_q16( 2.0); t_z[2] = float_to_q16(100.0);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        // -------------------------------------------------------------
        // Test 6: Bottom-Left Quadrant Check (View Space -X, -Y)
        // Screen Space should be X < 320, Y > 240 (due to Y flip)
        // -------------------------------------------------------------
        $display("[%0t] Test 6: Bottom-Left View Space (-X, -Y)", $time);
        
        wait(ready);
        @(posedge clk);
        t_x[0] = float_to_q16(-2.0); t_y[0] = float_to_q16(-2.0); t_z[0] = float_to_q16(20.0);
        t_x[1] = float_to_q16(-1.0); t_y[1] = float_to_q16(-2.0); t_z[1] = float_to_q16(20.0);
        t_x[2] = float_to_q16(-1.5); t_y[2] = float_to_q16(-1.0); t_z[2] = float_to_q16(20.0);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        // -------------------------------------------------------------
        // Test 7: Top-Right Quadrant Check (View Space +X, +Y)
        // Screen Space should be X > 320, Y < 240
        // -------------------------------------------------------------
        $display("[%0t] Test 7: Top-Right View Space (+X, +Y)", $time);
        
        wait(ready);
        @(posedge clk);
        t_x[0] = float_to_q16( 1.0); t_y[0] = float_to_q16( 1.0); t_z[0] = float_to_q16(20.0);
        t_x[1] = float_to_q16( 2.0); t_y[1] = float_to_q16( 1.0); t_z[1] = float_to_q16(20.0);
        t_x[2] = float_to_q16( 1.5); t_y[2] = float_to_q16( 2.0); t_z[2] = float_to_q16(20.0);
        in_valid = 1;
        @(posedge clk);
        in_valid = 0;

        wait(out_valid);
        verify_outputs();
        @(posedge clk);

        #100;
        $finish;
    end

endmodule
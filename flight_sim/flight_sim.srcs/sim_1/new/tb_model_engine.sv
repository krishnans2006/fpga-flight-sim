`timescale 1ns / 1ps

module tb_model_engine;

    // -------------------------------------------------------------------------
    // 1. Signals & Constants
    // -------------------------------------------------------------------------
    logic clk;
    logic rst;

    // Inputs
    logic signed [31:0] m_x [3], m_y [3], m_z [3];
    logic        [15:0] color_in;
    logic signed [9:0]  model_matrix [3][4];
    logic               draw;
    logic               stall;

    // Outputs
    logic signed [31:0] t_x [3], t_y [3], t_z [3];
    logic        [15:0] color_out;
    logic               valid;
    logic               busy;

    localparam CLK_PERIOD = 10;

    // -------------------------------------------------------------------------
    // 2. DUT Instantiation
    // -------------------------------------------------------------------------
    transformation dut (
        .clk(clk),
        .rst(rst),
        .t_x(m_x), .t_y(m_y), .t_z(m_z),
        .color(color_in),
        .model_matrix(model_matrix),
        .in_valid(draw),
        .stall(stall),
        .out_x(t_x), .out_y(t_y), .out_z(t_z),
        .color_out(color_out),
        .valid(valid)
    );

    // -------------------------------------------------------------------------
    // 3. Clock Generation
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // -------------------------------------------------------------------------
    // 4. Golden Model (Software Reference)
    // -------------------------------------------------------------------------
    // Replicates the exact DSP48 math logic: 
    // (Matrix * Coord)[39:8] + (Translation << 16)
    function automatic logic signed [31:0] expected_calc(
        input logic signed [31:0] px, py, pz,
        input logic signed [9:0]  row[4]
    );
        logic signed [47:0] tmp_x, tmp_y, tmp_z;
        logic signed [31:0] res_x, res_y, res_z;
        logic signed [31:0] translation;

        // 1. Multiply (Q2.8 * Q16.16)
        tmp_x = $signed(row[0]) * px;
        tmp_y = $signed(row[1]) * py;
        tmp_z = $signed(row[2]) * pz;

        // 2. Truncate (Extract [39:8] -> Q18.14 approx)
        res_x = tmp_x[39:8];
        res_y = tmp_y[39:8];
        res_z = tmp_z[39:8];

        // 3. Translation (Q2.8 -> Q16.16)
        // CRITICAL: Must cast to $signed before shifting/adding
        translation = $signed({row[3], 16'b0});

        return res_x + res_y + res_z + translation;
    endfunction

    // -------------------------------------------------------------------------
    // 5. Tasks
    // -------------------------------------------------------------------------
    task apply_reset();
        rst = 1; draw = 0; stall = 0;
        repeat(5) @(posedge clk);
        rst = 0;
        @(posedge clk);
    endtask

    task drive_inputs(
        input logic signed [31:0] in_x[3], in_y[3], in_z[3],
        input logic signed [9:0]  mat[3][4]
    );
        m_x = in_x; m_y = in_y; m_z = in_z;
        model_matrix = mat;
        // Arbitrary color for pass-through check
        color_in = 16'h0F00;
        
        draw = 1;
        repeat (2) @(posedge clk);
        draw = 0;
    endtask

    task check_outputs(
        input logic signed [31:0] in_x[3], in_y[3], in_z[3],
        input logic signed [9:0]  mat[3][4],
        input string test_name
    );
        logic signed [31:0] exp_x, exp_y, exp_z;
        int err = 0;

        // Wait for valid signal
        wait(valid);

        for (int i=0; i<3; i++) begin
            exp_x = expected_calc(in_x[i], in_y[i], in_z[i], mat[0]);
            exp_y = expected_calc(in_x[i], in_y[i], in_z[i], mat[1]);
            exp_z = expected_calc(in_x[i], in_y[i], in_z[i], mat[2]);

            if (t_x[i] !== exp_x || t_y[i] !== exp_y || t_z[i] !== exp_z) begin
                $error("[%s] ERROR Vertex %0d", test_name, i);
                $display("  Input:  (%d, %d, %d)", in_x[i], in_y[i], in_z[i]);
                $display("  Matrix: Row0=%p", mat[0]);
                $display("  Exp:    (%d, %d, %d)", exp_x, exp_y, exp_z);
                $display("  Got:    (%d, %d, %d)", t_x[i], t_y[i], t_z[i]);
                err++;
            end
        end

        if (err == 0) $display("[%s] PASS", test_name);
        else $stop;

        // Wait for handshake
        @(posedge clk);
    endtask

    // -------------------------------------------------------------------------
    // 6. Main Stimulus
    // -------------------------------------------------------------------------
    logic signed [31:0] tx[3], ty[3], tz[3];
    logic signed [9:0]  tm[3][4];

    initial begin
        $display("---------------------------------------------------");
        $display("     TB_MODEL_TRANSFORM STARTED");
        $display("---------------------------------------------------");
        
        apply_reset();

        // ------------------------------------------------------------
        // Test 1: Identity Matrix
        // 1.0 in Q2.8 is 256 (1 << 8)
        // ------------------------------------------------------------
        tx = '{100, 200, 300}; 
        ty = '{10, 20, 30}; 
        tz = '{5, 5, 5};
        
        tm = '{ '{256, 0, 0, 0}, '{0, 256, 0, 0}, '{0, 0, 256, 0} };

        drive_inputs(tx, ty, tz, tm);
        check_outputs(tx, ty, tz, tm, "Identity");


        // ------------------------------------------------------------
        // Test 2: Negative Translation
        // ------------------------------------------------------------
        // X: +50 (50), Y: -20 (1004 in 10-bit 2's comp), Z: 0
        tm = '{ '{256, 0, 0, 10'sd50}, '{0, 256, 0, -10'sd20}, '{0, 0, 256, 0} };

        drive_inputs(tx, ty, tz, tm);
        check_outputs(tx, ty, tz, tm, "Neg Translation");


        // ------------------------------------------------------------
        // Test 3: Scaling (0.5x)
        // 0.5 = 128
        // ------------------------------------------------------------
        tm = '{ '{128, 0, 0, 0}, '{0, 128, 0, 0}, '{0, 0, 128, 0} };

        drive_inputs(tx, ty, tz, tm);
        check_outputs(tx, ty, tz, tm, "Scaling 0.5");


//        // ------------------------------------------------------------
//        // Test 4: Stall / Backpressure
//        // ------------------------------------------------------------
//        $display("[Stall Test] Triggering input...");
//        tm = '{ '{256, 0, 0, 0}, '{0, 256, 0, 0}, '{0, 0, 256, 0} };
        
//        m_x = tx; m_y = ty; m_z = tz; model_matrix = tm;
//        draw = 1;
//        @(posedge clk);
//        draw = 0;

//        // Wait 3 cycles (Pipeline is filling)
//        repeat(3) @(posedge clk);
        
//        $display("[Stall Test] Asserting Stall...");
//        stall = 1;

//        // Wait 10 cycles. The module should finish calc, but hold at P6 output.
//        repeat(10) @(posedge clk);

//        // Verify Valid holds HIGH
//        if (valid !== 1) begin
//            $error("[Stall Test] Valid dropped early! Pipeline didn't hold.");
//            $stop;
//        end

//        // Verify Data is correct while stalled
//        // (Manual check because check_outputs task waits for posedge)
//        if (t_x[0] !== 100) begin // Identity check
//             $error("[Stall Test] Output data corrupted during stall!");
//             $stop;
//        end

//        $display("[Stall Test] Releasing Stall...");
//        stall = 0;
//        @(posedge clk);
//        // Valid should drop now
//        if (valid !== 0 && draw == 0) begin // Assuming no new draw
//             // Note: In some FSMs valid stays high 1 cycle after stall drops.
//             // This check depends on exact FSM transition logic.
//        end
//        $display("[Stall Test] PASS");


        // ------------------------------------------------------------
        // Test 5: Randomized Stress Test (100 vectors)
        // ------------------------------------------------------------
        $display("[Random Test] Starting...");
        stall = 0;
        
        repeat(100) begin
            // Randomize Vectors
            for (int i=0; i<3; i++) begin
                tx[i] = $signed($random);
                ty[i] = $signed($random);
                tz[i] = $signed($random);
            end

            // Randomize Matrix (Range -2.0 to +1.99)
            // 10-bit signed: -512 to 511.
            // We use small numbers to avoid 32-bit overflow in the sum check
            for (int r=0; r<3; r++) begin
                for (int c=0; c<4; c++) begin
                    tm[r][c] = 10'($signed($urandom_range(0, 512)) - 256); 
                end
            end

            drive_inputs(tx, ty, tz, tm);
            check_outputs(tx, ty, tz, tm, "Random");
        end

        $display("---------------------------------------------------");
        $display("     ALL TESTS PASSED");
        $display("---------------------------------------------------");
        $finish;
    end

endmodule
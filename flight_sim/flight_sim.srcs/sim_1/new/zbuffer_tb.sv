`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 08:33:22 PM
// Design Name: 
// Module Name: zbuffer_tb
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

module zbuffer_tb;

    // -------------------------------------------------------------------------
    // Inputs & Outputs
    // -------------------------------------------------------------------------
    logic clk;
    logic rst;
    logic [26:0] mem_addr;
    logic signed [31:0] z0, z1, z2;
    logic signed [31:0] alpha, beta, gamma;
    logic mem_valid;
    logic [15:0] mem_data;
    logic wb_ready;
    logic wb_memwr_active;

    logic ready;
    logic mem_valid_out;
    logic [26:0] mem_addr_out;
    logic [15:0] mem_data_out;

    // -------------------------------------------------------------------------
    // UUT Instantiation
    // -------------------------------------------------------------------------
    zbuffer uut (
        .clk(clk),
        .rst(rst),
        .mem_addr(mem_addr),
        .z0(z0), .z1(z1), .z2(z2),
        .alpha(alpha), .beta(beta), .gamma(gamma),
        .mem_valid(mem_valid),
        .mem_data(mem_data),
        .ready(ready),
        .wb_ready(wb_ready),
        .wb_memwr_active(wb_memwr_active),
        .mem_valid_out(mem_valid_out),
        .mem_addr_out(mem_addr_out),
        .mem_data_out(mem_data_out)
    );
    
    // -------------------------------------------------------------------------
    // Simulation Constants
    // -------------------------------------------------------------------------
    localparam STRIP_START = 76800;
    localparam STRIP_END   = 230400;
    
    // Barycentric 1.0 in Q8.24
    localparam ONE_Q8_24 = 32'h01000000;

    // -------------------------------------------------------------------------
    // Clock Generation
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz equivalent
    end

    // -------------------------------------------------------------------------
    // Helper Tasks
    // -------------------------------------------------------------------------

    // Task: Reset system
    task apply_reset;
    begin
        rst = 1;
        mem_valid = 0;
        wb_ready = 1;
        repeat(5) @(posedge clk);
        rst = 0;
        @(posedge clk);
    end
    endtask

    // Task: Send a single pixel request
    task send_pixel(
        input logic [26:0] addr,
        input logic [15:0] color,
        input logic signed [31:0] z_val
    );
    begin
        wait(ready);
        @(posedge clk);
        #1; // Delay for waveform clarity
        mem_valid = 1;
        mem_addr  = addr;
        mem_data  = color;
        
        // Setup flat Z-plane (Alpha=1, Beta=0, Gamma=0)
        z0 = z_val; z1 = z_val; z2 = z_val;
        alpha = ONE_Q8_24; beta = 0; gamma = 0;
        
        @(posedge clk);
        #1;
        mem_valid = 0;
    end
    endtask

    // Task: Expect output (verify correctness)
    // Rewritten to use linear loops instead of fork/join
    task verify_output(
        input logic should_be_valid,
        input logic [15:0] exp_data,
        input string test_name
    );
        integer timeout_ctr;
        logic detected;
    begin
        timeout_ctr = 0;
        detected = 0;

        if (should_be_valid) begin
            // Wait for valid signal with simple counter timeout
            while (mem_valid_out === 0 && timeout_ctr < 20) begin
                @(posedge clk);
                timeout_ctr = timeout_ctr + 1;
            end

            if (mem_valid_out === 1) begin
                if (mem_data_out !== exp_data) begin
                    $error("[%s] FAIL: Data Mismatch. Expected %h, Got %h", test_name, exp_data, mem_data_out);
                end else begin
                    $display("[%s] PASS: Correct output received.", test_name);
                end
            end else begin
                $error("[%s] FAIL: Timeout waiting for output.", test_name);
            end

        end else begin
            // Occlusion test: Monitor for 15 cycles to ensure NO output
            repeat(15) begin
                @(posedge clk);
                if (mem_valid_out === 1) begin
                    detected = 1;
                end
            end
            
            if (detected) 
                $error("[%s] FAIL: Unexpected output (Should be occluded).", test_name);
            else
                $display("[%s] PASS: Pixel correctly dropped.", test_name);
        end

        // Clear handshake if needed
        if (mem_valid_out && wb_ready) wait(!mem_valid_out);
    end
    endtask

    // -------------------------------------------------------------------------
    // Main Test Sequence
    // -------------------------------------------------------------------------
    initial begin
        $display("=== STARTING HORIZONTAL STRIP Z-BUFFER TEST ===");
        
        apply_reset();

        // ------------------------------------------------------------
        // 1. OUT OF BOUNDS: Top Bar (Address < 76800)
        // ------------------------------------------------------------
        // Should pass through instantly (Passthru state)
        send_pixel(27'd1000, 16'hAAAA, 32'h0); 
        verify_output(1, 16'hAAAA, "Test 1: Top Bar Passthru");
        #20;

        // ------------------------------------------------------------
        // 2. OUT OF BOUNDS: Bottom Bar (Address >= 230400)
        // ------------------------------------------------------------
        // Should pass through instantly
        send_pixel(27'd250000, 16'hBBBB, 32'h0);
        verify_output(1, 16'hBBBB, "Test 2: Bottom Bar Passthru");
        #20;

        // ------------------------------------------------------------
        // 3. IN STRIP: New Write (Address = 100,000)
        // ------------------------------------------------------------
        // This is inside the strip. Address 100,000 maps to BRAM index 23,200.
        // Z-Value logic:
        // Input Z = 0x0000_8000. Alpha = 1<<24.
        // Product = 0x8000_000000. Slice [39:32] = 0x80 (128).
        send_pixel(27'd100000, 16'hC001, 32'h0000_8000);
        verify_output(1, 16'hC001, "Test 3: In-Strip Initial Write");
        #20;

        // ------------------------------------------------------------
        // 4. IN STRIP: Occlusion Test (Same Address)
        // ------------------------------------------------------------
        // Send Z = 0x0000_4000. Slice [39:32] = 0x40 (64).
        // 64 < 128 (Previous). Should fail Z-test (Occluded).
        send_pixel(27'd100000, 16'hDEAD, 32'h0000_4000);
        verify_output(0, 0, "Test 4: In-Strip Occlusion");
        #20;

        // ------------------------------------------------------------
        // 5. IN STRIP: Overwrite Test (Same Address)
        // ------------------------------------------------------------
        // Send Z = 0x0000_C000. Slice [39:32] = 0xC0 (192).
        // 192 > 128 (Previous). Should overwrite.
        send_pixel(27'd100000, 16'hC002, 32'h0000_C000);
        verify_output(1, 16'hC002, "Test 5: In-Strip Overwrite");
        #20;

        // ------------------------------------------------------------
        // 6. PRECISION / SLICING CHECK
        // ------------------------------------------------------------
        // The RTL slices [39:32]. With Alpha=Q8.24, this corresponds to 
        // bits [15:8] of the Z input.
        // Let's test two values that differ only in bit 8.
        // A: 0x0000_0100 (Bit 8=1, Slice=1)
        // B: 0x0000_0200 (Bit 9=1, Slice=2)
        
        // Write A (Slice=1) to new address
        send_pixel(27'd100001, 16'hDDD1, 32'h0000_0100);
        verify_output(1, 16'hDDD1, "Test 6.1: Precision Low");
        
        // Write B (Slice=2) to same address. 2 > 1. Should overwrite.
        send_pixel(27'd100001, 16'hDDD2, 32'h0000_0200);
        verify_output(1, 16'hDDD2, "Test 6.2: Precision High");
        #20;

        // ------------------------------------------------------------
        // 7. BACKPRESSURE TEST
        // ------------------------------------------------------------
        $display("Test 7: Backpressure Handling");
        wait(ready);
        @(posedge clk);
        mem_valid = 1;
        mem_addr = 27'd150000;
        mem_data = 16'hFFFF;
        // Z=Max (Slice=0xFF)
        z0 = 32'h0000_FF00; alpha = ONE_Q8_24;
        @(posedge clk);
        mem_valid = 0;

        // Assert stall immediately
        wb_ready = 0;
        
        repeat(6) @(posedge clk);
        
        if (mem_valid_out !== 1) 
            $error("[Test 7] FAIL: mem_valid_out dropped during stall!");
        else 
            $display("[Test 7] PASS: Output held during stall.");

        // Release stall
        wb_ready = 1;
        @(posedge clk);
        #1;
        if (mem_valid_out !== 0)
            $error("[Test 7] FAIL: mem_valid_out stuck high.");
        else
            $display("[Test 7] PASS: Handshake complete.");

        #100;
        $display("=== TEST COMPLETE ===");
        $finish;
    end

endmodule
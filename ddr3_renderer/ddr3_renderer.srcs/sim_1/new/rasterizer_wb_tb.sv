`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2025 06:29:32 PM
// Design Name: 
// Module Name: rasterizer_wb_tb
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


module rasterizer_wb_tb;
// Parameters for Test Case 1: 2x4 box (8 pixels, two burst)
    localparam X1_T1 = 10;
    localparam X2_T1 = 13; // 10, 11, 12, 13 (4 pixels wide)
    localparam Y1_T1 = 0;
    localparam Y2_T1 = 1;  // 0, 1 (2 pixels high)
    localparam COLOR_T1 = 12'hF00; // Red Color

    // Parameters for Test Case 2: 2x5 box (10 pixels, forces mismatch/flush)
    localparam X1_T2 = 0;
    localparam X2_T2 = 4; // 0, 1, 2, 3, 4 (5 pixels wide)
    localparam Y1_T2 = 2;
    localparam Y2_T2 = 3; // 2, 3 (2 pixels high)
    localparam COLOR_T2 = 12'h00F; // Blue Color

    // Global Signals
    logic clk = 1'b0;
    logic rst = 1'b1;
    logic stall = 1'b0;

    // Rasterizer Inputs
    logic vertex_valid = 1'b0;
    logic [9:0] x1, x2, y1, y2;
    logic [11:0] color;
    logic [26:0] start_addr;
    assign start_addr = dut_r.start_addr;

    // Interface Wires
    logic wb_ready;
    logic mem_valid;
    logic [26:0] mem_addr;
    logic [15:0] mem_data;
    logic rasterizer_done;

    // WB Controller Outputs
    logic mem_wrdy = 1'b0; // Mock DDR3 ready signal
    logic [26:0] dout_burst_addr;
    logic [7:0] dout_wrdm = 8'b0;
    logic [127:0] dout_burst_128 = 128'b0;
    logic dout_burst_valid;

    // Instantiate Modules
    rasterizer dut_r (
        .clk(clk),
        .rst(rst),
        .stall(stall),
        .vertex_valid(vertex_valid),
        .rasterizer_done(rasterizer_done),
        .x1(x1), .x2(x2), .y1(y1), .y2(y2),
        .color(color),
        .wb_ready(wb_ready),
        .mem_valid(mem_valid),
        .mem_addr(mem_addr),
        .mem_data(mem_data)
    );

    gpu_wb_controller dut_wb (
        .clk(clk),
        .rst(rst),
        .stall(stall),
        .din(mem_data),
        .din_addr(mem_addr),
        .din_valid(mem_valid),
        .ready(wb_ready),
        .mem_wrdy(mem_wrdy),
        .dout_burst_addr(dout_burst_addr),
        .dout_wrdm(dout_wrdm),
        .dout_burst_128(dout_burst_128),
        .dout_burst_valid(dout_burst_valid)
    );

    // -------------------------------------------------------------
    // Clock Generator
    // -------------------------------------------------------------
    always #5 clk = ~clk; // 10ns period (100 MHz)

    // -------------------------------------------------------------
    // Test Sequence
    // -------------------------------------------------------------
    initial begin
        // Initial Reset
        rst = 1'b1;
        repeat (2) @(posedge clk);
        rst = 1'b0;
        repeat (20) @(posedge clk);
        $display("-------------------------------------------");
        $display("Initial Reset Complete. Start Test Case 1.");
        $display("-------------------------------------------");

        // --- Test Case 1: Fill a single burst (2x4 box, 8 pixels) ---
        x1 = X1_T1; x2 = X2_T1; y1 = Y1_T1; y2 = Y2_T1; color = COLOR_T1;
        
        @(posedge clk);
        vertex_valid = 1'b1; // Send vertex command
        @(posedge clk);
        vertex_valid = 1'b0;

        // The rasterizer starts drawing. WB controller should stay in StRead, wb_ready=1.
        repeat (8) @(posedge clk); 
        
        $display("T=%0t: Rasterizer finished 8 writes.", $time);
        $display("T=%0t: WB Controller should be full (Tag 0).", $time);
        
        // Check: WB Controller should be in StRead, mask should be 8'hC3
        if (dut_wb.wb_controller_state_q != dut_wb.StRead || dut_wb.din_wrdm_q != 8'hC3) begin
            $error("Test 1 Failed: WB state or mask incorrect after 8 writes.");
        end

        // --- Test Case 1 Continued: Simulate successful flush ---
        $display("T=%0t: Simulating mem_wrdy=1 to flush the burst.", $time);
        mem_wrdy = 1'b1;
        @(posedge clk); 
        
        // Check: Flush should happen on this cycle (dout_burst_valid=1)
        if (dout_burst_valid != 1'b1) begin
            $error("Test 1 Failed: dout_burst_valid not asserted during flush.");
        end
        
        // Assert burst data is correct (8 words of the color)
        // 16'hF00 -> 16'h0F00
        if (dut_wb.dout_burst_128 != {16'h0000, 16'h0000, 16'h0F00, 16'h0F00, 
                                      16'h0F00, 16'h0F00, 16'h0000, 16'h0000}) begin
            $error("Test 1 Failed: Burst data incorrect.");
        end
        
        mem_wrdy = 1'b0;
        @(posedge clk); 

        // Check: WB Controller should be back to StRead (or StIdle if done)
        if (dut_wb.wb_controller_state_q != dut_wb.StRead) begin
            $error("Test 1 Failed: WB state not StRead after flush.");
        end

        // Wait for rasterizer to finish StDone transition
        repeat (20) @(posedge clk); 
        
        $display("-------------------------------------------");
        $display("Test Case 1 Complete. Start Test Case 2.");
        $display("-------------------------------------------");

        // --- Test Case 2: Flush on Mismatch (2x5 box, 10 pixels total) ---
        // This will attempt to write index 8 (Tag 1, Index 0) which forces a flush of Tag 0.
        x1 = X1_T2; x2 = X2_T2; y1 = Y1_T2; y2 = Y2_T2; color = COLOR_T2;
        
        @(posedge clk);
        vertex_valid = 1'b1; // Send vertex command
        @(posedge clk);
        vertex_valid = 1'b0;
        
        // Rasterize 8 pixels (Fill Burst 0: Addr 0-7, Tag 0)
        repeat (8) @(posedge clk); 
        
        // Pixel 9 (Addr 8, Tag 1, Index 0) arrives on the next cycle
        @(posedge clk); 

        // Check 1: WB Controller should detect mismatch and transition to StWriteback
        if (dut_wb.wb_controller_state_q != dut_wb.StWriteback || dut_wb.wb_buffer_q[15:0] == 16'h000F) begin
            $error("Test 2 Failed: WB did not transition to StWriteback on Tag mismatch.");
        end
        
        // Check 2: wb_ready should be low to pause the rasterizer
        if (wb_ready != 1'b0) begin
             $error("Test 2 Failed: wb_ready not low during flush preparation.");
        end

        // --- Test Case 2 Continued: Allow Flush ---
        $display("T=%0t: Mismatch detected. Simulating mem_wrdy=1 to flush Tag 0.", $time);
        mem_wrdy = 1'b1;
        @(posedge clk);
        
        // Check 3: Flush must have happened (valid=1) and the latched data (pixel 9) must be in the buffer
        if (dut_wb.dout_burst_valid != 1'b1 || dut_wb.wb_controller_state_q != dut_wb.StRead) begin
            $error("Test 2 Failed: Flush did not occur or state transition failed.");
        end
        
        // Check 4: Buffer now holds the single pending pixel (Tag 1, Index 0)
        if (dut_wb.wb_buffer_q[15:0] != 16'h000F || dut_wb.din_wrdm_q != 8'h01) begin
             $error("Test 2 Failed: Flush did not correctly load pending pixel (Tag 1).");
        end
        
        repeat (50) @(posedge clk);

        $display("T=%0t: Test Cases Complete.", $time);
        $finish;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 11:46:36 AM
// Design Name: 
// Module Name: cache_tb
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


module cache_tb;
    // =========================================================================
    // 1. Parameters and Signals
    // =========================================================================
    localparam N_CACHE_LINES    = 16;
    localparam CACHE_LINE_WIDTH = 512;
    localparam DRAM_CHUNK_WIDTH = 128;
    localparam TAG_WIDTH        = 18; // Must match the fixed width in cache.sv

    // Clock and Reset
    logic clk;
    logic rst;

    // DRAM Interface Signals
    logic [26:0]    cache_ddr3_addr;
    logic           cache_ddr3_req;
    logic           cache_ddr3_rw_n; // 1=Read, 0=Write
    logic           cache_ddr3_ready;
    logic [127:0]   cache_ddr3_din;
    logic           cache_ddr3_din_valid;
    logic [127:0]   cache_ddr3_dout;
    logic [7:0]     cache_ddr3_wrdm;

    // Z-Buffer Interface Signals
    logic [26:0]    zbuf_addr;
    logic           zbuf_req;
    logic           zbuf_rw_n; // 1=Read, 0=Write
    logic [15:0]    zbuf_din;
    logic [15:0]    zbuf_dout;
    logic           zbuf_dout_valid;
    
    // =========================================================================
    // 2. Instantiation of the Cache Module
    // =========================================================================
    cache #(
        .N_CACHE_LINES(N_CACHE_LINES),
        .CACHE_LINE_WIDTH(CACHE_LINE_WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        
        // DDR3 Interface
        .cache_ddr3_addr(cache_ddr3_addr),
        .cache_ddr3_req(cache_ddr3_req),
        .cache_ddr3_rw_n(cache_ddr3_rw_n),
        .cache_ddr3_ready(cache_ddr3_ready),
        .cache_ddr3_din(cache_ddr3_din),
        .cache_ddr3_din_valid(cache_ddr3_din_valid),
        .cache_ddr3_dout(cache_ddr3_dout),
        .cache_ddr3_wrdm(cache_ddr3_wrdm),
        
        // Z-Buffer Interface
        .zbuf_addr(zbuf_addr),
        .zbuf_req(zbuf_req),
        .zbuf_rw_n(zbuf_rw_n),
        .zbuf_din(zbuf_din),
        .zbuf_dout(zbuf_dout),
        .zbuf_dout_valid(zbuf_dout_valid)
        // .current_state(current_state) // Uncomment if 'current_state' output is added to cache.sv
    );
    
    logic [3:0] curr_state;
    logic [1:0] chunk_counter;
    logic hit;
    assign hit = dut.hit;
    assign curr_state = dut.cache_state_q;
    assign chunk_counter = dut.chunk_count_q;
    // =========================================================================
    // 3. Clock Generation and Initialization
    // =========================================================================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    initial begin
        // Initialize inputs
        zbuf_req = 0;
        zbuf_addr = 0;
        zbuf_rw_n = 1;
        zbuf_din = 0;
        cache_ddr3_ready = 1; // Always ready to receive command
        cache_ddr3_din_valid = 0; // Not sending data yet

        // Apply Reset
        rst = 1;
        #20 rst = 0;
        
        // Start Test Sequence
        run_tests();
        
        #100 $finish;
    end
    
    // =========================================================================
    // 4. DRAM Model Task (REVISED to eliminate 512-bit temporary buffer)
    // =========================================================================
    // Simulates the DDR3 response (4 chunks of 128 bits)
    task automatic ddr3_model();
        logic [26:0] req_addr;
        logic req_is_read;
        
        // Wait for the cache request
        @(posedge clk) begin
            wait(cache_ddr3_req);
            req_addr = cache_ddr3_addr;
            req_is_read = cache_ddr3_rw_n;
        end

        if (req_is_read) begin
            // --- READ OPERATION (Cache Fill) ---
            $display("--- DDR3 READ: Address 0x%h requested. Starting 4x 128-bit transfer.", req_addr);
            
            // Send 4 chunks sequentially (128 bits each)
            for (int chunk = 0; chunk < 4; chunk++) begin
                logic [127:0] chunk_data;
                // Generate data for this specific 128-bit chunk (8 Z-values)
                // The base index for Z-values is (chunk * 8)
                for (int z_idx = 0; z_idx < 8; z_idx++) begin
                    // Global Z-index: chunk * 8 + z_idx
                    // The data pattern is (16'hAAAA + global_z_index)
                    chunk_data[z_idx*16 +: 16] = 16'hAAAA + (chunk * 8) + z_idx; 
                end

                repeat (10) @(posedge clk); // Wait 1 cycle for next chunk transmission
                @(posedge clk) begin
                    cache_ddr3_din = chunk_data;
                    cache_ddr3_din_valid = 1;
                    $display("DDR3 R-CHUNK %0d: Data 0x%h, Valid asserted.", chunk, cache_ddr3_din);
                end
                @(posedge clk) cache_ddr3_din_valid = 0;
            end
            
            $display("--- DDR3 READ: Transfer complete. ---");

        end else begin
            // --- WRITE OPERATION (Eviction Write-back) ---
            $display("--- DDR3 WRITE: Address 0x%h requested. Receiving 4x 128-bit chunks.", req_addr);
            
            // Consume 4 chunks sequentially
            for (int chunk = 0; chunk < 4; chunk++) begin
                #10;
                @(posedge clk) begin
                    $display("DDR3 W-CHUNK %0d received: 0x%h.", chunk, cache_ddr3_dout);
                    // In a real system, you would store cache_ddr3_dout here.
                end
            end
            $display("--- DDR3 WRITE: Transfer complete. ---");
        end
    endtask


    // =========================================================================
    // 5. Test Sequence
    // =========================================================================
    task automatic run_tests();
        
        // Test addresses:
        // A_TAG_0_IDX_0_OFF_1: Index 0, Offset 1 (Z-val 1)
        localparam A_TAG_0_IDX_0_OFF_1 = 27'h0000002; 
        
        // A_TAG_0_IDX_0_OFF_3: Index 0, Offset 3 (Z-val 3)
        localparam A_TAG_0_IDX_0_OFF_3 = 27'h0000003; 
        
        // A_TAG_1_IDX_0_OFF_3: Tag 1, Index 0, Offset 3 (Z-val 3)
        localparam A_TAG_1_IDX_0_OFF_3 = 27'h0010003; 
        
        localparam Z_UPDATE_VAL = 16'hBEEF;

        $display("\n=========================================================");
        $display("STARTING TEST SEQUENCE");
        $display("=========================================================");

        // ---------------------------------------------------------------------
        // TEST 1: Clean Read Miss (A_TAG_0_IDX_0_OFF_1)
        // Expected Z-value (Z-index 1): 0xAAAA + 1 = 0xAAAB
        // ---------------------------------------------------------------------
        $display("\n[T1] Requesting Address 0x%h (Clean Miss, Index 0).", A_TAG_0_IDX_0_OFF_1);
        zbuf_addr = A_TAG_0_IDX_0_OFF_1;
        zbuf_rw_n = 1; // Read
        
        @(posedge clk) zbuf_req = 1;
        @(posedge clk) zbuf_req = 0; // Single cycle request

        // Wait for DRAM request and model the fill
        fork
            ddr3_model();
        join
        
        // Wait for the cache fill and subsequent read access (~11 cycles total after req)
        wait(zbuf_dout_valid) begin
            $display("[T1] SUCCESS: Valid data 0x%h received after Miss.", zbuf_dout);
            if (zbuf_dout == 16'hAAAB) $display("[T1] Verification: PASS (0xAAAB).");
            else $error("[T1] Verification: FAIL. Expected 0xAAAB, Actual 0x%h", zbuf_dout);
        end


        // ---------------------------------------------------------------------
        // TEST 2: Cache Read Hit (A_TAG_0_IDX_0_OFF_3)
        // Expected Z-value (Z-index 3): 0xAAAA + 3 = 0xAAAD
        // ---------------------------------------------------------------------
        #50;
        $display("\n[T2] Requesting Address 0x%h (Read Hit, Index 0).", A_TAG_0_IDX_0_OFF_3);
        zbuf_addr = A_TAG_0_IDX_0_OFF_3;
        zbuf_rw_n = 1; // Read
        
        @(posedge clk) zbuf_req = 1;
        @(posedge clk) zbuf_req = 0;

        wait (zbuf_dout_valid) begin
            $display("[T2] SUCCESS: Valid data 0x%h received on Hit.", zbuf_dout);
            if (zbuf_dout == 16'hAAAD) $display("[T2] Verification: PASS (0xAAAD).");
            else $error("[T2] Verification: FAIL. Expected 0xAAAD, Actual 0x%h", zbuf_dout);
        end


        // ---------------------------------------------------------------------
        // TEST 3: Cache Write Hit (A_TAG_0_IDX_0_OFF_3)
        // Update Z-value 3 to 0xBEEF. Marks line 0 DIRTY.
        // ---------------------------------------------------------------------
        #50;
        $display("\n[T3] Requesting Address 0x%h (Write Hit, Index 0). Data: 0x%h", A_TAG_0_IDX_0_OFF_3, Z_UPDATE_VAL);
        zbuf_addr = A_TAG_0_IDX_0_OFF_3;
        zbuf_rw_n = 0; // Write
        zbuf_din = Z_UPDATE_VAL;
        
        @(posedge clk) zbuf_req = 1;
        @(posedge clk) zbuf_req = 0;
        
        #35;
        @(posedge clk) if (zbuf_dout_valid) $display("[T3] SUCCESS: Write completed (zbuf_dout_valid asserted). Cache Line 0 marked DIRTY.");


        // ---------------------------------------------------------------------
        // TEST 4: Dirty Eviction Miss (A_TAG_1_IDX_0_OFF_3)
        // Request new line (Tag 1, Index 0). Forces eviction of dirty Tag 0 line.
        // 1. Eviction (4 cycles Write-back)
        // 2. Fill (4 cycles Read-fill)
        // 3. Access (3 cycles BRAM latency)
        // ---------------------------------------------------------------------
        #50;
        $display("\n[T4] Requesting Address 0x%h (Dirty Miss, Index 0). Evicting Tag 0.", A_TAG_1_IDX_0_OFF_3);
        zbuf_addr = A_TAG_1_IDX_0_OFF_3;
        zbuf_rw_n = 1; // Read
        
        @(posedge clk) zbuf_req = 1;
        @(posedge clk) zbuf_req = 0;
        
        // Wait for DRAM write and read
        fork
            ddr3_model(); // Model the Write-Back (4 cycles of receiving data)
        join
         
        fork
            ddr3_model(); // Model the Write-Back (4 cycles of receiving data)
        join

        // Wait for the whole transaction to complete (~15 cycles of DRAM + 3 access cycles)
        wait (zbuf_dout_valid) begin
            // Expected Z-value (Z-index 3 for the new line): 0xAAAA + 3 = 0xAAAD
            $display("[T4] SUCCESS: New data 0x%h received after Evict/Fill cycle.", zbuf_dout);
            if (zbuf_dout == 16'hAAAD) $display("[T4] Verification: PASS (0xAAAD).");
            else $error("[T4] Verification: FAIL. Expected 0xAAAD, Actual 0x%h", zbuf_dout);
        end
    endtask
endmodule

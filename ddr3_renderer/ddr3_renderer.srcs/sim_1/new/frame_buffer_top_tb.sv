`timescale 1ns/1ps

module frame_buffer_top_tb();

    // ------------------------------------------------------
    // Clock + Reset
    // ------------------------------------------------------
    logic clk;
    logic reset_ah;
    logic [3:0] BTN;

    logic start_write;
    assign BTN[0] = reset_ah;
    assign BTN[1] = start_write;

    // Clock generation: 200 MHz (5 ns period)
    initial clk = 0;
    always #2.5 clk = ~clk;

    // ------------------------------------------------------
    // DUT-visible signals
    // ------------------------------------------------------
    logic        fbuf_we;
    logic [9:0]  fbuf_addr;
    wire [15:0]  fbuf_dout;
    wire         fbuf_wr_complete;
    logic [127:0] fbuf_dina_burst;

    assign fbuf_dina_burst = 128'hDEAD_BEEF_1234_5678_0000_ABCD_FFFF_AAAA;

    // ------------------------------------------------------
    // Instantiate frame buffer
    // ------------------------------------------------------
    frame_buffer fbuf_inst (
        .clk             (clk),
        .rst_n           (~reset_ah),
        .fbuf_we         (fbuf_we),
        .fbuf_addr       (fbuf_addr),
        .fbuf_dina_burst (fbuf_dina_burst),

        .fbuf_dout       (fbuf_dout),
        .fbuf_wr_complete(fbuf_wr_complete)
    );

    // ------------------------------------------------------
    // Write FSM
    // ------------------------------------------------------
    typedef enum {
        StIdle, StPoll, StWrite0, StWrite1, StWrite2
    } fbuf_wr_state_e;

    fbuf_wr_state_e fbuf_state_q, fbuf_state_d;
    logic [6:0] counter_q, counter_d;

    logic fbuf_we_local;
    logic [9:0] fb_addr_local;

    always_comb begin
        fbuf_we_local = 1'b0;
        fb_addr_local = 10'd0;
        counter_d     = counter_q;
        fbuf_state_d  = fbuf_state_q;

        case (fbuf_state_q)
            StIdle: begin
                counter_d = 0;
                if (start_write)
                    fbuf_state_d = StPoll;
            end

            StPoll: begin
                fbuf_state_d = StWrite0;
            end

            StWrite0: begin
                fbuf_we_local = 1'b1;
                fb_addr_local = {3'b000, counter_q} << 3;
                fbuf_state_d  = StWrite1;
            end

            StWrite1: begin
                counter_d = counter_q + 1;
                if (counter_q == 7'd79)
                    fbuf_state_d = StIdle;
                else
                    fbuf_state_d = StWrite2;
            end

            StWrite2: begin
                if (fbuf_wr_complete)
                    fbuf_state_d = StPoll;
            end
        endcase
    end

    always_ff @(posedge clk) begin
        if (reset_ah) begin
            fbuf_state_q <= StIdle;
            counter_q    <= 0;
        end else begin
            fbuf_state_q <= fbuf_state_d;
            counter_q    <= counter_d;
        end
    end

    // ------------------------------------------------------
    // TB Readback MUX Logic
    // ------------------------------------------------------
    logic tb_drive_en;     // TB takes control of DUT inputs
    logic tb_we;           // TB-driven write-enable (always 0 for readback)
    logic [9:0] tb_addr;   // TB-driven address

    always_comb begin
        if (tb_drive_en) begin
            fbuf_we   = tb_we;
            fbuf_addr = tb_addr;
        end else begin
            fbuf_we   = fbuf_we_local;
            fbuf_addr = fb_addr_local;
        end
    end

    // ------------------------------------------------------
    // Simulation control
    // ------------------------------------------------------
    initial begin
        reset_ah    = 1;
        start_write = 0;
        tb_drive_en = 0;   // FSM controls DUT first
        tb_we       = 0;

        $display("Starting frame buffer test...");

        #50;
        reset_ah = 0;

        #50;

        // Start write
        $display("[TB] Triggering frame buffer write...");
        start_write = 1;
        #20;
        start_write = 0;

        // Let FSM run
        repeat (5000) @(posedge clk);

        // ------------------------------------------------------
        // Begin READBACK
        // ------------------------------------------------------
        $display("[TB] Starting readback of 640 addresses...");

        tb_drive_en = 1;   // TB now controls fbuf_addr & fbuf_we
        tb_we       = 0;

        for (int rd = 0; rd < 640; rd++) begin
            @(posedge clk);

            tb_addr = rd[9:0];

            repeat (2) @(posedge clk); // 2-cycle latency
            $display("READ t=%0t : ADDR=%d --> DATA=%h",
                     $time, tb_addr, fbuf_dout);
        end

        $display("[TB] Readback complete.");
        $display("Test complete.");

        $finish;
    end

    // ------------------------------------------------------
    // Monitor writes
    // ------------------------------------------------------
    always @(posedge clk) begin
        if (!tb_drive_en && fbuf_we)
            $display("t=%0t  WE=1  ADDR=%0d  state=%0d",
                     $time, fbuf_addr, fbuf_state_q);

        if (fbuf_wr_complete)
            $display("t=%0t  fbuf_wr_complete=1", $time);
    end

endmodule
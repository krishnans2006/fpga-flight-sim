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

    // =========================================================================
    // 1. CLOCK & RESET
    // =========================================================================
    logic clk;
    logic rst;
    
    // We modify these to be driven by our chaos generator
    logic stall_in; 
    logic wb_ready_in; 

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz
    end

    // =========================================================================
    // 2. INTERCONNECT SIGNALS
    // =========================================================================
    logic signed [31:0] t_x [3];
    logic signed [31:0] t_y [3];
    logic signed [31:0] t_z [3];
    logic [15:0] color_in;
    logic proj_in_valid;
    logic proj_ready;

    logic signed [31:0] p_x_out [3];
    logic signed [31:0] p_y_out [3];
    logic signed [31:0] p_z_out [3];
    logic [31:0] inv_area_out;
    logic proj_out_valid;
    logic [15:0] color_proj_out;

    logic [15:0] rast_x0, rast_x1, rast_x2;
    logic [15:0] rast_y0, rast_y1, rast_y2;

    logic rast_done;
    logic mem_valid;
    logic [26:0] mem_addr;
    logic [15:0] mem_data;
    logic [31:0] alpha, beta, gamma;
    logic stall_out;

    // =========================================================================
    // 3. CHAOS GENERATOR (Random Stalls)
    // =========================================================================
    // This process simulates a busy DDR3 controller and random system pressure.
    initial begin
        wb_ready_in = 1;
        stall_in = 0;
        
        // Wait for reset to finish
        wait(!rst); 
        
        forever begin
            @(posedge clk);
            
            // 30% chance to stall the Writeback (Memory busy)
            // $urandom returns unsigned 32-bit int.
            if (($urandom % 100) < 30) 
                wb_ready_in <= 0;
            else 
                wb_ready_in <= 1;

            // 10% chance to assert global stall (Pipeline freeze)
            if (($urandom % 100) < 10) 
                stall_in <= 1;
            else 
                stall_in <= 0;
        end
    end

    // =========================================================================
    // 4. MODULES
    // =========================================================================

    projector u_projector (
        .clk(clk),
        .rst(rst),
        .stall(stall_in), // Connected to chaos signal
        
        .t_x(t_x), .t_y(t_y), .t_z(t_z),
        .color(color_in),
        .in_valid(proj_in_valid),
        .ready(proj_ready),
        
        .p_x(p_x_out), .p_y(p_y_out), .p_z(p_z_out),
        .dr(inv_area_out),
        .out_valid(proj_out_valid),
        .color_out(color_proj_out)
    );

    // GLUE LOGIC
    function logic [15:0] q16_to_screen(input logic signed [31:0] val, input int max_val);
        logic signed [31:0] int_val;
        int_val = val >>> 16; 
        if (int_val < 0) return 16'd0;
        if (int_val > max_val) return max_val[15:0];
        return int_val[15:0];
    endfunction

    always_comb begin
        rast_x0 = q16_to_screen(p_x_out[0], 639);
        rast_x1 = q16_to_screen(p_x_out[1], 639);
        rast_x2 = q16_to_screen(p_x_out[2], 639);
        rast_y0 = q16_to_screen(p_y_out[0], 479);
        rast_y1 = q16_to_screen(p_y_out[1], 479);
        rast_y2 = q16_to_screen(p_y_out[2], 479);
    end

    rasterizer u_rasterizer (
        .clk(clk),
        .rst(rst),
        .stall(stall_in), // Connected to chaos signal
        .rasterizer_done(rast_done),
        .vertex_valid(proj_out_valid), 
        
        .x0(rast_x0), .x1(rast_x1), .x2(rast_x2),
        .y0(rast_y0), .y1(rast_y1), .y2(rast_y2),
        .inv_area(inv_area_out),
        .color(color_proj_out),
        
        .wb_ready(wb_ready_in), // Connected to chaos signal
        .mem_valid(mem_valid),
        .mem_addr(mem_addr),
        .mem_data(mem_data),
        
        .alpha(alpha), .beta(beta), .gamma(gamma),
        .stall_out(stall_out)
    );

    // =========================================================================
    // 5. MEMORY
    // =========================================================================
    logic [15:0] framebuffer [0:307199]; 
    integer pixels_drawn;

    always @(posedge clk) begin
        if (rst) begin
            pixels_drawn <= 0;
        end else if (wb_ready_in && mem_valid && !stall_in) begin
            // Write only happens if Ready=1 AND Valid=1 AND not Stalled
            framebuffer[mem_addr] <= mem_data;
            pixels_drawn <= pixels_drawn + 1;
        end
    end

    // =========================================================================
    // 6. TASKS
    // =========================================================================
    task send_triangle_raw(
        input signed [31:0] x0, y0, z0,
        input signed [31:0] x1, y1, z1,
        input signed [31:0] x2, y2, z2,
        input [15:0] col
    );
        // Wait for ready, but also check that we aren't stalling input externally
        wait(proj_ready && !stall_in);
        @(posedge clk);
        
        // Add random input delay to simulate irregular CPU feeding
        repeat($urandom % 5) @(posedge clk);

        t_x[0] <= x0; t_y[0] <= y0; t_z[0] <= z0;
        t_x[1] <= x1; t_y[1] <= y1; t_z[1] <= z1;
        t_x[2] <= x2; t_y[2] <= y2; t_z[2] <= z2;
        color_in <= col;
        proj_in_valid <= 1'b1;

        @(posedge clk);
        proj_in_valid <= 1'b0;

        // Debug Output
        wait(proj_out_valid);
        $display("[TB] Tri Sent. Screen: (%0d,%0d) -> (%0d,%0d) -> (%0d,%0d)", 
             rast_x0, rast_y0, rast_x1, rast_y1, rast_x2, rast_y2);
        
        wait(rast_done);
        @(posedge clk);
    endtask

    task dump_ascii_buffer;
        integer y, x, addr;
        logic [15:0] pixel;
        string line;
        
        $display("\n======== ASCII DUMP (Chaos Mode Enabled) ========");
        for (y = 0; y < 480; y = y + 10) begin
            line = "";
            for (x = 0; x < 640; x = x + 10) begin
                addr = (y * 640) + x; 
                pixel = framebuffer[addr];
                if (pixel != 16'h0000) line = {line, "#"}; 
                else line = {line, "."};                   
            end
            $display(line); 
        end
        $display("=================================================");
    endtask

    // =========================================================================
    // 7. MAIN (Chaos Mode)
    // =========================================================================
    initial begin
        rst = 1;
        proj_in_valid = 0;
        #100;
        rst = 0;
        #100;
        
        $display("Starting Robustness Test (Random Stalls & Memory Pressure)...");
        
        // Cube at Z=15 (Same data as before)
        
        // Front Face
        send_triangle_raw(32'hFFFF0000, 32'hFFFF0000, 32'h000E0000, 32'h00010000, 32'hFFFF0000, 32'h000E0000, 32'h00010000, 32'h00010000, 32'h000E0000, 16'hF00F);
        send_triangle_raw(32'hFFFF0000, 32'hFFFF0000, 32'h000E0000, 32'h00010000, 32'h00010000, 32'h000E0000, 32'hFFFF0000, 32'h00010000, 32'h000E0000, 16'hF00F);

        // Right Face
        send_triangle_raw(32'h00010000, 32'hFFFF0000, 32'h000E0000, 32'h00010000, 32'hFFFF0000, 32'h00100000, 32'h00010000, 32'h00010000, 32'h00100000, 16'h0F00);
        send_triangle_raw(32'h00010000, 32'hFFFF0000, 32'h000E0000, 32'h00010000, 32'h00010000, 32'h00100000, 32'h00010000, 32'h00010000, 32'h000E0000, 16'h0F00);

        // Top Face
        send_triangle_raw(32'hFFFF0000, 32'h00010000, 32'h000E0000, 32'h00010000, 32'h00010000, 32'h000E0000, 32'h00010000, 32'h00010000, 32'h00100000, 16'h00F0);
        send_triangle_raw(32'hFFFF0000, 32'h00010000, 32'h000E0000, 32'h00010000, 32'h00010000, 32'h00100000, 32'hFFFF0000, 32'h00010000, 32'h00100000, 16'h00F0);

        // Allow time to drain (might take longer due to stalls)
        #2000;
        
        $display("Robustness Test Complete. Total Pixels: %0d", pixels_drawn);
        dump_ascii_buffer();
        
        $finish;
    end

endmodule
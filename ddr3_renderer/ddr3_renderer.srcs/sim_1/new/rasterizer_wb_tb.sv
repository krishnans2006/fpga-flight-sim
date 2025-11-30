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
  // Clock and Reset Signals
  localparam real Q24_SCALE = 16777216.0; // 2^24
  logic clk = 1'b0;
  logic rst = 1'b1;
  logic stall = 1'b0;
  
  // -- Test Parameters for Small Triangle (Green Color) --
  // Coordinates (200, 100), (250, 150), (270, 110)
  logic [9:0] x0=10'd200, y0=10'd100, x1=10'd250, y1=10'd150, x2=10'd270, y2=10'd110;
  // Inverse Area for Area = 4.5 (32'h0038E37E)
  logic [31:0] inv_area = calc_inv_area(x0, y0, x1, y1, x2, y2); 
  logic [15:0] color = 16'h07E0; // Green 

  logic vertex_valid = 1'b0;
  logic rasterizer_done;

  // Wires connecting Rasterizer Outputs to WB Controller Inputs
  logic mem_valid;
  logic [26:0] mem_addr;
  logic [15:0] mem_data;
  
  // Wires connecting WB Controller Outputs to Rasterizer Inputs
  logic wb_ready;
  
  // Mock DDR3 Arbiter Interface
  logic mem_wrdy;
  logic [26:0] dout_burst_addr;
  logic [7:0] dout_wrdm;
  logic [127:0] dout_burst_128;
  logic dout_burst_valid;

  // Clock Generation
  always #5 clk = ~clk; // 10ns period, 100MHz

  // 1. Instantiate the Writeback Controller (Top-level)
  gpu_wb_controller wb_controller_inst (
    .clk(clk),
    .stall(stall),
    .rst(rst),
    // Rasterizer Connection
    .din(mem_data),
    .din_addr(mem_addr),
    .din_valid(mem_valid),
    .ready(wb_ready), // Backpressure signal to rasterizer
    // DDR3 Arbiter Connection (Mocked)
    .mem_wrdy(mem_wrdy),
    .dout_burst_addr(dout_burst_addr),
    .dout_wrdm(dout_wrdm),
    .dout_burst_128(dout_burst_128),
    .dout_burst_valid(dout_burst_valid)
  );

  // 2. Instantiate the Rasterizer
  rasterizer rasterizer_inst (
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .vertex_valid(vertex_valid),
    .rasterizer_done(rasterizer_done),
    // Triangle Vertices
    .x0(x0), .y0(y0),
    .x1(x1), .y1(y1),
    .x2(x2), .y2(y2),
    .inv_area(inv_area),
    .color(color),
    // Writeback Interface
    .wb_ready(wb_ready), // Connected to controller ready
    .mem_valid(mem_valid),
    .mem_addr(mem_addr),
    .mem_data(mem_data)
  );
  function logic [31:0] calc_inv_area(int x0, int y0, int x1, int y1, int x2, int y2);
        real area;
        // Area calc based on edge functions (standard 2D cross product)
        // Area = (x1 - x2) * (y0 - y2) - (y1 - y2) * (x0 - x2)
        // Note: The DUT calculates unnormalized weights. The sum of weights = Area.
        // The specific winding formula adapted from Alchitry/standard rasterizers:
        area = (y1 - y2) * (x0 - x2) + (x2 - x1) * (y0 - y2);
        
        // If area is 0, return 0 to avoid div by zero (degenerate triangle)
        if (area == 0) return 0;
        
        // Return 1.0 / Area in Q8.24 format
        return $rtoi((1.0 / area) * Q24_SCALE);
  endfunction
  // 3. Mock DDR3 Arbiter (Simulates a slow memory)
  // mem_wrdy will be high for 1 cycle every 5 cycles
  localparam MEM_WRDY_PERIOD = 5;
  logic [3:0] wrdy_ctr = 4'd0;
  
  always @(posedge clk) begin
      if (rst) begin
          wrdy_ctr <= 4'd0;
          mem_wrdy <= 1'b0;
      end else if (!stall) begin
          wrdy_ctr <= wrdy_ctr + 1;
          if (wrdy_ctr == MEM_WRDY_PERIOD - 1) begin
              mem_wrdy <= 1'b1;
              wrdy_ctr <= 4'd0;
          end else begin
              mem_wrdy <= 1'b0;
          end
      end
  end

  // 4. Test Scenario
  initial begin
    // Initial reset
    @(posedge clk) rst = 1'b1;
    @(posedge clk) rst = 1'b0;

    $display("--- Starting Rasterizer Test ---");
    // Assert vertex_valid to start the rasterizer
    @(posedge clk) vertex_valid = 1'b1;
    
    // Hold vertex_valid high for one cycle (StIdle -> StSetup)
    //@(posedge clk) vertex_valid = 1'b0; 
    
    // Wait until rasterization is complete
    wait(rasterizer_done) @(posedge clk);

    $display("--- Rasterization Complete ---");
    $display("Total simulation time: %0t ns", $time);
    
    // Final check for a clean state
    repeat (100) @(posedge clk);
    
    $finish;
  end
  
  // Monitor key activity
  always @(posedge clk) begin
      if (mem_valid) begin
          $display("[%0t] Rasterizer sending data: Addr=0x%h, Data=0x%h. WB Ready: %b", 
                   $time, mem_addr, mem_data, wb_ready);
      end
      if (dout_burst_valid) begin
          $display("[%0t] WB Controller writing burst: Addr=0x%h, Data=0x%h. WRDM=0x%h", 
                   $time, dout_burst_addr, dout_burst_128, dout_wrdm);
      end
      if (rasterizer_done) begin
          $display("[%0t] Rasterizer FSM reached StDone.", $time);
      end
  end

endmodule
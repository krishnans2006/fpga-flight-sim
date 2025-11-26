`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2025 03:22:48 PM
// Design Name: 
// Module Name: graphics_top
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

/*
This will be flushed out later

I envision this module to basically define the AXI interface between GPU and MicroBlaze
I haven't created the BD for MicroBlaze yet, whether we want to package GPU as a custom IP is up to you. 
On one hand it may be easier to do the block design with GPU as an IP, on the other hand you have to deal with IP Packager and all of its shenanigans. 

Temporarily, because I'm not using microblaze to test ddr3 renderer, I don't really need AXI atm
*/

module graphics_top(
  input logic           clk,
  input logic           rst,

  // DDR3 connections
  input logic           mem_wrdy,
  output logic          burst_valid,
  output logic [26:0]   burst_mem_addr,
  output logic [7:0]    burst_mem_wrdm,
  output logic [127:0]  burst_mem_128,
  
  // cool graphics test :)
  input logic [7:0]     vsync_cntr
);
/* DEFINE AXI Behavior ~ it should be similar to lab 7.1/7.2 where we just write pitch/yaw/roll data to some internal BRAM/registers */

// Rasterizer Inputs
logic [15:0] color;

assign color = {4'b0, vsync_cntr, 4'b0}; // cycle through several colors :)

// Interface Wires
logic wb_ready;
logic mem_valid;
logic [26:0] mem_addr;
logic [15:0] mem_data;
logic rasterizer_done;

// WB Controller Outputs
logic [26:0] dout_burst_addr;
logic [7:0] dout_wrdm;
logic [127:0] dout_burst_128;
logic dout_burst_valid;

assign burst_valid = dout_burst_valid;
assign burst_mem_addr = dout_burst_addr;
assign burst_mem_128 = dout_burst_128;
assign burst_mem_wrdn = dout_wrdm;


// Instantiate Modules
rasterizer rasterizer_inst (
  .clk(clk),
  .rst(rst),
  .stall(1'b0),
  
  .vertex_valid(1'b1),
  .rasterizer_done(rasterizer_done),
  
  .x0(10'd240), 
  .y0(10'd320),
  .x1(10'd250), 
  .y1(10'd340),
  .x2(10'd260), 
  .y2(10'd330),
  
  // note "area" isnt actually the area of the triangle. rather its the magnitude of the cross product of the vectors defined by the triangle
  .inv_area(32'hFFFF258C),
  .color(color), // changes color :D
  .wb_ready(wb_ready),
  .mem_valid(mem_valid),
  .mem_addr(mem_addr),
  .mem_data(mem_data)
);

gpu_wb_controller wb_controller_inst (
  .clk(clk),
  .rst(rst),
  .stall(1'b0),
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

endmodule

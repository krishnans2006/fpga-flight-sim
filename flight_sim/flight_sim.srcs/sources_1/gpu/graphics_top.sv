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
  input logic           trigger,

  // DDR3 connections
  input logic           mem_wrdy,
  output logic          burst_valid,
  output logic [26:0]   burst_mem_addr,
  output logic [7:0]    burst_mem_wrdm,
  output logic [127:0]  burst_mem_128,
  output logic          wb_active,
  output logic          init,

  // Z-bufer <-> Cache
  output logic [26:0]   zbuf_cache_addr,
  output logic          zbuf_cache_req,
  output logic          zbuf_cache_rw_n, // 1 = Read, 0 = Write
  output logic [15:0]   zbuf_cache_dout,
  input  logic [15:0]   zbuf_cache_din,
  input  logic          zbuf_cache_valid,
  
  // cool graphics test :)
  input logic [7:0]     vsync_cntr,
  input logic           swap
);

localparam VRAM_BACKGROUND = 16'h0133; // skibidi color
localparam VRAM_UBOUND = 27'h004B000;

typedef enum {
  StIdle, StWait0, StDrawBackground, StDrawGraphics
} graphics_state_e;

graphics_state_e graphics_state_d, graphics_state_q;
logic [26:0] addr_curr_d, addr_curr_q;

logic [26:0]  background_burst_addr;
logic [7:0]   background_wrdm;
logic [127:0] background_burst_128;
logic         background_burst_valid;

logic         model_engine_start;

logic int_graphics_stall; // asserted when we're drawing background and we need to stall graphics pipeline

always_ff @(posedge clk) begin
  if (rst) begin
    graphics_state_q <= StIdle;
    addr_curr_q <= 27'b0;
  end else begin
    graphics_state_q <= graphics_state_d;
    addr_curr_q <= addr_curr_d;
  end
end

always_comb begin
  graphics_state_d = graphics_state_q;
  addr_curr_d = addr_curr_q;
  model_engine_start = 1'b0;
  int_graphics_stall = 1'b0;

  // output data
  background_burst_128 = {8{VRAM_BACKGROUND}};
  background_wrdm = 8'h0;
  background_burst_valid = 1'b0;
  background_burst_addr = addr_curr_q;

  unique case (graphics_state_q)
    StIdle: begin
      int_graphics_stall = 1'b1;

      if (swap) begin
        graphics_state_d = StWait0;
      end
    end
    StWait0: begin
      // redundant state in order to ensure staging & output buffer are swapped
      int_graphics_stall = 1'b1;
      graphics_state_d = StDrawBackground;
    end
    StDrawBackground: begin
      int_graphics_stall = 1'b1;

      if (mem_wrdy) begin
        background_burst_valid = 1'b1;
        addr_curr_d = addr_curr_q + 8;
      end

      if (addr_curr_d >= VRAM_UBOUND) begin
        model_engine_start = 1'b1;
        graphics_state_d = StDrawGraphics;
      end
    end
    StDrawGraphics: begin
      // unstall graphics pipeline--draw object(s)
      int_graphics_stall = 1'b0;
      addr_curr_d = 27'b0;

      // on vsync, return to StWait0 to begin this process over again
      if (swap) begin
        graphics_state_d = StWait0;
      end
    end
    default: graphics_state_d = StIdle;
  endcase
end

// Projector Signals
logic signed [31:0] proj_p_x [3];
logic signed [31:0] proj_p_y [3];
logic signed [31:0] proj_p_z [3];
logic [31:0]        proj_dr;      // again, in Q8.24 format. NOT Q16.16
logic               proj_out_valid;
logic               model_data_valid;
logic               proj_ready;

// test inputs
logic signed [31:0] test_t_x [3];
logic signed [31:0] test_t_y [3];
logic signed [31:0] test_t_z [3];

logic model_done;
logic [15:0] model_face_color, proj_face_color;
    
// small helper function, shouldnt get synthesized to anything substantial
 function logic [31:0] f2q(input real v); return $rtoi(v * 65536.0); endfunction

 // should be relatively small on the screen
 assign test_t_x[0] = f2q(-1.0); assign test_t_y[0] = f2q(-1.0); assign test_t_z[0] = f2q(20.0);
 assign test_t_x[1] = f2q( 1.0); assign test_t_y[1] = f2q(-1.0); assign test_t_z[1] = f2q(20.0);
 assign test_t_x[2] = f2q( 0.0); assign test_t_y[2] = f2q( 1.0); assign test_t_z[2] = f2q(20.0);

// Rasterizer I/O
logic [15:0] color;
logic [31:0] alpha, beta, gamma;

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
logic mem_wb_active;

assign wb_active = (int_graphics_stall || mem_wb_active || init_active);

// Initialization Outputs
logic [26:0] init_dout_burst_addr;
logic [7:0] init_dout_wrdm;
logic [127:0] init_dout_burst_128;
logic init_dout_burst_valid;

logic rasterizer_stall;

logic init_active;

// Z Buffer I/O
logic        zbuf_dvalid;
logic [15:0] zbuf_dout;
logic [26:0] zbuf_addrout;
logic        zbuf_ready;

logic [26:0] zbuf_addr;
logic        zbuf_req; // cache request
logic        zbuf_rw_n; // 1 = Read, 0 = Write
logic [15:0] zbuf_mem_dout;

assign zbuf_cache_addr = zbuf_addr;
assign zbuf_cache_req  = zbuf_req;
assign zbuf_cache_rw_n = zbuf_rw_n;
assign zbuf_cache_dout = zbuf_mem_dout;

assign burst_valid =    (init_active) ? init_dout_burst_valid : ((int_graphics_stall) ? background_burst_valid : dout_burst_valid);
assign burst_mem_addr = (init_active) ? init_dout_burst_addr :  ((int_graphics_stall) ? background_burst_addr : dout_burst_addr);
assign burst_mem_128 =  (init_active) ? init_dout_burst_128 :   ((int_graphics_stall) ? background_burst_128 : dout_burst_128);
assign burst_mem_wrdm = (init_active) ? init_dout_wrdm :        ((int_graphics_stall) ? background_wrdm : dout_wrdm);
assign init = init_active;


// Instantiate Modules
rasterizer rasterizer_inst (
  .clk(clk),
  .rst(rst),
  .stall(1'b0),
  
  .vertex_valid(proj_out_valid),
  .rasterizer_done(rasterizer_done),
  
  .x0(proj_p_x[0][25:16]), // 320
  .y0(proj_p_y[0][25:16]), // 240
  .x1(proj_p_x[1][25:16]), // 330 
  .y1(proj_p_y[1][25:16]), // 260 
  .x2(proj_p_x[2][25:16]), // 340
  .y2(proj_p_y[2][25:16]), // 250
  
  // note "area" isnt actually the area of the triangle. rather its the magnitude of the cross product of the vectors defined by the triangle
  .inv_area(proj_dr),
  .color(proj_face_color), // changes color :D
  .wb_ready(zbuf_ready), // memory has to be write-w
  .mem_valid(mem_valid),
  .mem_addr(mem_addr),
  .mem_data(mem_data),

  .alpha(alpha),
  .beta(beta),
  .gamma(gamma),
  .stall_out(rasterizer_stall)
);

zbuffer zbuffer_inst (
  .clk(clk),
  .rst(rst),
  /* Interface with rasterizer */
  .z0(32'h01000000), // I think this is +1 in Q8.24
  .z1(32'h01000000), 
  .z2(32'h01000000), 
  .alpha(alpha), .beta(beta), .gamma(gamma), // barycentric coords in Q8.24
  .mem_valid(mem_valid),
  .mem_addr(mem_addr),
  .mem_data(mem_data),
  .ready(zbuf_ready),

  /* BEGIN interface with memory (cache) */
  .zbuf_addr(zbuf_addr),
  .zbuf_req(zbuf_req), // cache request
  .zbuf_rw_n(zbuf_rw_n), // 1 = Read, 0 = Write
  .zbuf_dout(zbuf_mem_dout),
  .zbuf_din(zbuf_cache_din),
  .zbuf_valid(zbuf_cache_valid), 

  /* Interface with Writeback Controller */
  .wb_ready(wb_ready),
  .wb_memwr_active(mem_wb_active),
  .mem_valid_out(zbuf_dvalid),
  .mem_addr_out(zbuf_addrout),
  .mem_data_out(zbuf_dout)
);

gpu_wb_controller wb_controller_inst (
  .clk(clk),
  .rst(rst),
  .stall(1'b0),
  .din(zbuf_dout),
  .din_addr(zbuf_addrout),
  .din_valid(zbuf_dvalid),
  .ready(wb_ready),
  .mem_wrdy((mem_wrdy && ~int_graphics_stall)), // this should propagate up through all stages of graphics pipeline
  .dout_burst_addr(dout_burst_addr),
  .dout_wrdm(dout_wrdm),
  .dout_burst_128(dout_burst_128),
  .dout_burst_valid(dout_burst_valid),
  .mem_write_active(mem_wb_active)
);

zbuffer_initializer init_inst (
  .clk(clk),
  .rst(rst),
  .trigger(trigger),
// connection to DDR3 arbiter
  .mem_wrdy(mem_wrdy),
  .init_active(init_active),
  .dout_burst_addr(init_dout_burst_addr),
  .dout_wrdm(init_dout_wrdm),
  .dout_burst_128(init_dout_burst_128),
  .dout_burst_valid(init_dout_burst_valid)
);

projector projector_inst (
  .clk(clk),
  .rst(rst),

  // should be in Q16.16 format
  .t_x(test_t_x),
  .t_y(test_t_y),
  .t_z(test_t_z),
  .color(color), //  should be model_face_color
    
  .in_valid(1'b1),
  .ready(proj_ready),

  // projected vertices
  .p_x(proj_p_x),
  .p_y(proj_p_y),
  .p_z(proj_p_z),
    
  // 32-bit reciprocal determinant in Q8.24
  .dr(proj_dr),
  .out_valid(proj_out_valid),
  .color_out(proj_face_color),
    
  .stall(rasterizer_stall)
);

//model_engine model_engine_inst (
//  .clk(clk), 
//  .rst(rst),
//  .start_frame(model_engine_start),
//  .model_done(model_done),

//  // projector interface
//  .proj_ready(proj_ready),
//  .proj_valid(model_data_valid),
//  .t_x(test_t_x),
//  .t_y(test_t_y),
//  .t_z(test_t_z),
//  .face_color(model_face_color)
//);

endmodule

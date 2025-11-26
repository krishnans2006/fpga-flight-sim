`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2025 03:57:04 PM
// Design Name: 
// Module Name: rasterizer
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
// Note: this module repeatedly sends memory address/value pairs until the rasterizer_done signal is asserted high.
// When interfacing with DDR3, use an intermediate 128-bit buffer (such as in gpu_wb_controller.sv) to best utilize DDR3 bandwidth.
//////////////////////////////////////////////////////////////////////////////////


module rasterizer(
  input logic         clk,
  input logic         rst,
  input logic         stall, // pipeline signal
  // signal to prev. stage to indicate current inputs have been fully rasterized
  output logic        rasterizer_done,
  // currently we're working with a "box" rasterizer ~ this will be updated to do triangles
  input logic         vertex_valid,
  input logic [9:0]   x0, x1, x2, y0, y1, y2,
  input logic [31:0]  inv_area, // 1/Area in Q8.24 format
  input logic [15:0]  color,
  // interface with writeback controller
  input logic         wb_ready,
  output logic        mem_valid,
  output logic [26:0] mem_addr,
  output logic [15:0] mem_data
); 

localparam lp_HORIZ_PIXEL_WIDTH = 27'h0000280;

typedef enum {
  StIdle, StSetup, StDraw, StFlush, StDone
} rasterizer_state_e;

rasterizer_state_e rasterizer_state_d, rasterizer_state_q;

// we will latch these
logic [9:0] curr_x_d, curr_x_q, curr_y_d, curr_y_q; 
logic [9:0] start_x_d, start_x_q, end_x_d, end_x_q, start_y_d, start_y_q, end_y_d, end_y_q;

logic [26:0] curr_addr_d, curr_addr_q;

// instantiate barycentric_calc module, wires
logic within_triangle;
logic [31:0] alpha, beta, gamma; // unused for now, but will be when we do Z-buffering

// hold address of each element being processed in the pipeline. addr_pipe_q[6] holds the "curr" mem_addr
logic [26:0] addr_pipe_d [0:6];
logic [26:0] addr_pipe_q [0:6];
logic [2:0] ctr_d, ctr_q;
logic internal_stall;
logic [6:0] v_pipe_d, v_pipe_q;
 
barycentric_calc barycentric_calc_inst (
  .clk(clk),
  .stall((stall || !wb_ready || internal_stall)),

  // three triangle vertices, padded to 16-bit
  .t0_x({6'b0, x0}), 
  .t0_y({6'b0, y0}),
  .t1_x({6'b0, x1}), 
  .t1_y({6'b0, y1}),
  .t2_x({6'b0, x2}), 
  .t2_y({6'b0, y2}),

  // inverse triangle area in Q8.24
  .inv_area(inv_area),
  .point_x({6'b0, curr_x_q}), 
  .point_y({6'b0, curr_y_q}),

  // output to rasterizer
  .within_tri(within_triangle),
  .alpha(alpha), 
  .beta(beta), 
  .gamma(gamma)
);

// register states
always_ff @(posedge clk) begin
  if (rst) begin
    rasterizer_state_q <= StIdle;
    curr_addr_q <= 'b0;
    curr_x_q <= 'b0;
    curr_y_q <= 'b0;

    for (integer i = 0; i < 7; i = i + 1) begin
      addr_pipe_q[i] <= 27'b0;
      v_pipe_q[i] <= 1'b0; 
    end

    start_x_q <= 10'b0;
    start_y_q <= 10'b0;
    end_x_q <= 10'b0;
    end_y_q <= 10'b0;

    ctr_q <= 3'b0;

  end else begin
    if (!stall) begin
      rasterizer_state_q <= rasterizer_state_d;
      curr_addr_q <= curr_addr_d;
      curr_x_q <= curr_x_d;
      curr_y_q <= curr_y_d;

      addr_pipe_q <= addr_pipe_d;
      v_pipe_q <= v_pipe_d;

      start_x_q <= start_x_d;
      start_y_q <= start_y_d;
      end_x_q <= end_x_d;
      end_y_q <= end_y_d;

      ctr_q <= ctr_d;
    end
  end
end

// combinational decode of states
always_comb begin
  rasterizer_state_d = rasterizer_state_q;
  curr_addr_d = curr_addr_q;
  curr_x_d = curr_x_q;
  curr_y_d = curr_y_q;
  addr_pipe_d = addr_pipe_q;
  v_pipe_d = v_pipe_q;

  start_x_d = start_x_q;
  start_y_d = start_y_q;
  end_x_d = end_x_q;
  end_y_d = end_y_q;

  rasterizer_done = 1'b0;
  mem_data = color;
  mem_addr = addr_pipe_q[6]; // 7th value in pipeline
  internal_stall = 1'b0;
  ctr_d = ctr_q;

  if (v_pipe_q[6] && within_triangle)
    mem_valid = 1'b1;
  else
    mem_valid = 1'b0;

  unique case (rasterizer_state_q)
    StIdle: begin
      internal_stall = 1'b1;
      if (vertex_valid) 
        rasterizer_state_d = StSetup;
      else
        rasterizer_state_d = StIdle;
    end
    StSetup: begin
      // start x
      if (x0 <= x1 && x0 <= x2) begin 
        start_x_d = x0;
        curr_x_d = x0;
      end else if (x1 <= x0 && x1 <= x2) begin 
        start_x_d = x1;
        curr_x_d = x1;
      end else begin 
        start_x_d = x2;
        curr_x_d = x2;
      end

      // end x
      if (x0 >= x1 && x0 >= x2) end_x_d = x0;
      else if (x1 >= x0 && x1 >= x2) end_x_d = x1;
      else end_x_d = x2;

      // start y
      if (y0 <= y1 && y0 <= y2) begin 
        start_y_d = y0;
        curr_y_d = y0;
      end else if (y1 <= y0 && y1 <= y2) begin
        start_y_d = y1;
        curr_y_d = y1;
      end else begin 
        start_y_d = y2;
        curr_y_d = y2;
      end

      // end y
      if (y0 >= y1 && y0 >= y2) end_y_d = y0;
      else if (y1 >= y0 && y1 >= y2) end_y_d = y1;
      else end_y_d = y2;

      internal_stall = 1'b1;
      rasterizer_state_d = StDraw;

/* 640 * curr_y = (512 * curr_y) + (128 * curr_y) = curr_y << 9 + curr_y << 7
  doing this to avoid inferring a DSP unit ~ we want to preserve as many as possible
*/
      curr_addr_d = (({17'b0, start_y_d} << 9) + ({17'b0, start_y_d} << 7)) + start_x_d;
    end
    StDraw: begin
      // writes values into the pipeline
      if (wb_ready) begin
        // propagate new values within local address/valid pipeline
        for (integer i = 1; i < 7; i = i + 1) begin
          addr_pipe_d[i] = addr_pipe_q[i - 1];
          v_pipe_d[i] = v_pipe_q[i - 1];
        end

        addr_pipe_d[0] = curr_addr_q;
        v_pipe_d[0] = 1'b1;

        if (curr_x_q == end_x_q) begin
          if (curr_y_q == end_y_q) begin
            // finished
            ctr_d = 3'b001;
            rasterizer_state_d = StFlush;
          end else begin
            curr_x_d = start_x_q;
            curr_y_d = curr_y_d + 1;
            curr_addr_d = curr_addr_d + lp_HORIZ_PIXEL_WIDTH - (end_x_q - start_x_q);
            rasterizer_state_d = StDraw;
          end
        end else begin
          curr_x_d = curr_x_d + 1;
          curr_addr_d = curr_addr_d + 1;
          rasterizer_state_d = StDraw;
        end
      end else
        rasterizer_state_d = StDraw;
    end
    StFlush: begin
      if (wb_ready) begin
        // clear out pipelines
        for (integer j = 1; j < 7; j = j + 1) begin
          addr_pipe_d[j] = addr_pipe_q[j - 1];
          v_pipe_d[j] = v_pipe_q[j - 1];
        end

        addr_pipe_d[0] = 26'b0;
        v_pipe_d[0] = 1'b0;

        if (ctr_q == 3'b111)
          rasterizer_state_d = StDone;
        else 
          ctr_d = ctr_q + 1;
      end
    end
    StDone: begin
      rasterizer_state_d = StIdle;
      ctr_d = 3'b0;
      rasterizer_done = 1'b1;
    end
    // catch parasitic states
    default: rasterizer_state_d = StIdle;
  endcase
end


endmodule

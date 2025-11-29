`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 12:00:16 PM
// Design Name: 
// Module Name: background_initializer
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
// This module initializes the background of both VRAMs, and sets Z-buffer to initial value
// with some modification, this module could be adapted to generate/draw terrain as well
//////////////////////////////////////////////////////////////////////////////////


module background_initializer(
  input logic             clk,
  input logic             rst,
  input logic             trigger,
// connection to DDR3 arbiter
  input logic             mem_wrdy,
  output logic            init_active,
  output logic [26:0]     dout_burst_addr,
  output logic [7:0]      dout_wrdm,
  output logic [127:0]    dout_burst_128,
  output logic            dout_burst_valid
);

  localparam ZMIN = 16'h0000; // zero for now
  localparam VRAM_BACKGROUND = 16'hF00F; // all red
  localparam VRAM_BOUND = 27'h0096000;

  logic [26:0] addr_curr_d, addr_curr_q;
  logic trigger_latched;

  typedef enum {
    StIdle, StWriteVRAM //, StWriteZBuffer
  } initializer_state_e;

  initializer_state_e initializer_state_q, initializer_state_d;

  always_ff @(posedge clk) begin
    if (rst) begin
      initializer_state_q <= StIdle;
      trigger_latched <= 1'b0;
      addr_curr_q <= 27'b0;
    end else begin
      initializer_state_q <= initializer_state_d;
      addr_curr_q <= addr_curr_d;
      trigger_latched <= trigger;
    end
  end

  always_comb begin
    initializer_state_d = initializer_state_q;
    addr_curr_d = addr_curr_q;
    init_active = 1'b0;

    dout_burst_addr = addr_curr_q;
    dout_burst_128 = {8{VRAM_BACKGROUND}}; // 128b burst of all white
    dout_burst_valid = 1'b0;
    dout_wrdm = 8'b0;

    unique case (initializer_state_q)
      StIdle: begin
        // only transition on posedge of triggr
        if (trigger && ~trigger_latched) begin
          initializer_state_d = StWriteVRAM;
          init_active = 1'b1;
        end
      end
      StWriteVRAM: begin
        init_active = 1'b1;

        if (mem_wrdy) begin
          dout_burst_valid = 1'b1;
          addr_curr_d = addr_curr_q + 8;
        end

        if (addr_curr_d >= VRAM_BOUND) begin
          initializer_state_d = StIdle;
        end
      end
      // StWriteZBuffer: begin
      // end
    default: initializer_state_d = StIdle;
    endcase
  end

endmodule

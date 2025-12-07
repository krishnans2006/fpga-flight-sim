`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2025 12:08:27 AM
// Design Name: 
// Module Name: frame_buffer
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


module frame_buffer(
  input logic         clk,
  input logic         rst_n,
  input logic         fbuf_we,
  input logic [9:0]   fbuf_addr,
  input logic [9:0]   fbuf_raddr,
  input logic [127:0] fbuf_dina_burst,

  output logic [15:0] fbuf_dout,
  output logic        fbuf_wr_complete
  );
    
  logic [15:0] bram_dina;
  logic [9:0] bram_waddr, bram_addr, bram_addr_base;
  logic [1:0] wea;  // byte-write enable, but practically this is always 2'b11 or 2'b00
  logic [2:0] bram_wr_dbyte_index_d, bram_wr_dbyte_index_q;
  logic wr_in_progress, wr_complete;
  
  logic [127:0] bram_dina_burst;

  typedef enum {
    StIdle, StActive, StWait0
  } bram_state_e;

  bram_state_e bram_state_w_d, bram_state_w_q, bram_state_r_d, bram_state_r_q;
  
  assign fbuf_wr_complete = wr_complete;

  // Instantiation of BRAM
  /* 
  Memory Type: True Dual Port Memory, one side writes, other side reads
  BRAM resources (18K): 1
  BRAM resources (36K): 0
  Port A Read Latency: 2 clk cycles
  Address Width A: 10
  */
  blk_mem_gen_0 bram0 (
    .addra(bram_waddr),
    .clka (clk),
    .dina (bram_dina),
    .ena  (1'b1),
    .wea  (wea),
    .douta(),
    .addrb(fbuf_raddr),
    .clkb (clk),
    .dinb (),
    .enb  (1'b1),
    .web  (2'b00),
    .doutb (fbuf_dout)
  );

  // combinational decode of write state machine
  always_comb begin
    bram_state_w_d = bram_state_w_q;
    bram_wr_dbyte_index_d = bram_wr_dbyte_index_q;
    bram_waddr = 10'b0;
    bram_dina = 16'b0;
    wr_complete = 1'b0;
    wr_in_progress = 1'b0;
    wea = 2'b00;

    unique case (bram_state_w_q)
      StIdle: begin
        if (fbuf_we) begin
          bram_state_w_d = StActive;
          wr_in_progress = 1'b1;
        end else begin
          bram_state_w_d = StIdle;
        end
      end
      StActive: begin
        wea = 2'b11;
        bram_state_w_d = StWait0;
        wr_in_progress = 1'b1;
        bram_waddr = bram_addr_base + {7'b0, bram_wr_dbyte_index_q};

        for (integer i = 0; i < 8; i = i + 1) begin
          if (bram_wr_dbyte_index_q == i) begin
            bram_dina = bram_dina_burst[i*16 +: 16];
          end
        end
      end
      StWait0: begin
        bram_wr_dbyte_index_d = bram_wr_dbyte_index_d + 1;

        if (bram_wr_dbyte_index_q == 3'b111) begin
          bram_state_w_d = StIdle;
          wr_complete = 1'b1;
        end else begin
          bram_state_w_d = StActive;
          wr_in_progress = 1'b1;
          wr_complete = 1'b0;
        end
      end
      // parasitic states
      default: bram_state_w_d = StIdle;
    endcase
  end

  // register the write state machine
  always_ff @(posedge clk) begin : write_fsm
    if (!rst_n) begin
      bram_state_w_q <= StIdle;
      bram_wr_dbyte_index_q <= 3'b000;
    end else begin
      bram_state_w_q <= bram_state_w_d;
      bram_wr_dbyte_index_q <= bram_wr_dbyte_index_d;
      
      // latch wr_data, wr_addr
      if (fbuf_we) begin
        bram_addr_base <= fbuf_addr;
        bram_dina_burst <= fbuf_dina_burst;
      end
    end
  end


endmodule

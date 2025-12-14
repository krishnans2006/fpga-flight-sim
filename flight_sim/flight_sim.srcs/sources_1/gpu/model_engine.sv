`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2025 03:15:49 AM
// Design Name: 
// Module Name: model_engine
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

module model_engine(
  input  logic clk, 
  input  logic rst,
  input  logic start_frame,
  output logic model_done,

  // projector interface
  input  logic proj_ready,
  output logic proj_valid,
  output logic signed [31:0] t_x [3],
  output logic signed [31:0] t_y [3],
  output logic signed [31:0] t_z [3],
  output logic [15:0] face_color,
  input logic [3:0] sel
);

  localparam NUM_VERTICES = 5; 
  localparam NUM_FACES    = 12;

  logic [3:0] face_rom_addr;
  logic [31:0] face_rom_dout;

  // 96-bit vertex data
  logic [4:0]  vertex_rom_addr;
  logic [95:0] vertex_rom_dout;

  /* outputs */
  logic signed [31:0] tx_q[3], tx_d[3];
  logic signed [31:0] ty_q[3], ty_d[3];
  logic signed [31:0] tz_q[3], tz_d[3];

  typedef enum {
    StIdle, 
    StReqFace, StWait0, StWait1, // face fetch
    StReqVertex, StWait2, StWait3, StWait4, // vertex fetch states
    StPropagate, 
    StDone
  } model_engine_state_e;

  model_engine_state_e model_engine_state_q, model_engine_state_d;

  logic [3:0] vertex_ctr_d, vertex_ctr_q;
  logic [3:0] face_ctr_d, face_ctr_q;
  logic [15:0] color;

  logic [3:0] idx0, idx1, idx2;
  logic [3:0] sel_idx;

  // Instantiate ROMs
  faces_rom faces_rom_inst(
    .addra(face_rom_addr),
    .clka (clk),
    .dina (),
    .ena  (1'b1),
    .wea  (1'b0),
    .douta(face_rom_dout)
  );

  vertices_rom vertices_rom_inst(
    .addra(vertex_rom_addr),
    .clka (clk),
    .dina (),
    .ena  (1'b1),
    .wea  (1'b0),
    .douta(vertex_rom_dout)
  );

  // Register the states
  always_ff @(posedge clk) begin
    if (rst) begin
      model_engine_state_q <= StIdle;
      face_ctr_q   <= 'b0;
      vertex_ctr_q <= 'b0;

      for(integer i = 0; i < 3; i++) begin
        tx_q[i] <= 32'b0; 
        ty_q[i] <= 32'b0; 
        tz_q[i] <= 32'b0;
      end

      idx0  <= 'b0;
      idx1  <= 'b0;
      idx2  <= 'b0;
      color <= 'b0;

    end else begin
      model_engine_state_q <= model_engine_state_d;
      face_ctr_q   <= face_ctr_d;
      vertex_ctr_q <= vertex_ctr_d;

      // latch vertices
      if (model_engine_state_q == StWait3) begin
        tx_q[vertex_ctr_q] <= vertex_rom_dout[95:64];
        ty_q[vertex_ctr_q] <= vertex_rom_dout[63:32];
        tz_q[vertex_ctr_q] <= vertex_rom_dout[31:0];
      end

      // latch vertex addresses & color
      if (model_engine_state_q == StWait1) begin
        color <= face_rom_dout[31:16];
        idx2  <= face_rom_dout[11:8];
        idx1  <= face_rom_dout[7:4];
        idx0  <= face_rom_dout[3:0];
      end
    end
  end

  // Combinational State Logic
  always_comb begin
    model_engine_state_d = model_engine_state_q;
    face_ctr_d   = face_ctr_q;
    vertex_ctr_d = vertex_ctr_q;

    // Face Address valid whenever we are tracking faces
    face_rom_addr = face_ctr_q;

    model_done = 1'b0;
    proj_valid = 1'b0;

    // Select Vertex Index
    case (vertex_ctr_q)
      4'd0:    sel_idx = idx0;
      4'd1:    sel_idx = idx1;
      4'd2:    sel_idx = idx2;
      default: sel_idx = idx0;
    endcase

    vertex_rom_addr = {1'b0, sel_idx}; 

    unique case (model_engine_state_q)
      StIdle: begin
        face_ctr_d = 'b0;
        if (start_frame) begin
          model_engine_state_d = StReqFace;
        end
      end

      // faces
      StReqFace: begin
        model_engine_state_d = StWait0;
      end
      StWait0: begin
        model_engine_state_d = StWait1;
      end
      StWait1: begin
        model_engine_state_d = StReqVertex;
      end

      // vertices
      StReqVertex: begin
        model_engine_state_d = StWait2;
      end
      StWait2: begin
        model_engine_state_d = StWait3;
      end
      StWait3: begin
        if (vertex_ctr_q == 2) begin
          model_engine_state_d = StWait4;
        end else begin
          model_engine_state_d = StReqVertex;
          vertex_ctr_d = vertex_ctr_q + 1;
        end
      end
      StWait4: begin
        // redundant state to allow third vertex to load
        model_engine_state_d = StPropagate;
      end
      StPropagate: begin
        proj_valid = 1'b1;
        
        if (proj_ready) begin
          if (face_ctr_q == (NUM_FACES - 1)) begin
            model_engine_state_d = StDone;
          end else begin
            model_engine_state_d = StReqFace;
            face_ctr_d = face_ctr_q + 1;
            vertex_ctr_d = 'b0; 
          end
        end
      end

      StDone: begin
        model_done = 1'b1;
        face_ctr_d = 'b0;
        
        if (start_frame)
          model_engine_state_d = StReqFace;
      end
      
      default: model_engine_state_d = StIdle;
    endcase
  end

  assign t_x = tx_q;
  assign t_y = ty_q;
  assign t_z = tz_q;
  assign face_color = color;

endmodule
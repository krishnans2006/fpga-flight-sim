`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2025 12:42:22 PM
// Design Name: 
// Module Name: projector
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


module projector(
  input logic         clk,
  input logic         rst,

  // should be in Q16.16 format
  input logic signed [31:0]  t_x [3],
  input logic signed [31:0]  t_y [3], 
  input logic signed [31:0]  t_z [3],
    
  input  logic        in_valid,
  output logic        ready,

  // projected vertices
  output logic signed [31:0] p_x [3],
  output logic signed [31:0] p_y [3],
  output logic signed [31:0] p_z [3],
    
  // 32-bit reciprocal determinant
  output logic [31:0] dr,
  output logic        out_valid,
    
  input  logic        stall
);

localparam signed [31:0] FIXED_1_0  = 32'h00010000;
localparam signed [31:0] SCALE_X = 32'd320;
localparam signed [31:0] SCALE_Y = 32'd240;

// yoinked this projection matrix off of some other project, it should be good enough for our purposes
localparam signed [31:0] PROJ_MAT [0:3][0:3] = '{
  '{32'h06000000, 32'd0, 32'd0, 32'd0},
  '{32'd0, 32'h06000000, 32'd0, 32'd0},
  '{32'd0, 32'd0, 32'd80100, -32'd14563556}, 
  '{32'd0, 32'd0, 32'h00010000, 32'd0}  
};

typedef struct packed {
  logic signed [31:0] x, y, z, w;
} p4d_t;

typedef enum logic [3:0] {
  IDLE, X, Y, Z, R1, R2, R3, R4
} state_t;

state_t state_q, state_d;

// Intermediate Clip Space Points
p4d_t dp_q [3];
p4d_t dp_d [3];

logic signed [31:0] op_x_q [3], op_x_d [3];
logic signed [31:0] op_y_q [3], op_y_d [3];
logic signed [31:0] op_z_q [3], op_z_d [3];
logic signed [31:0] odr_q, odr_d;
logic               out_ready_q, out_ready_d;

// tmp registers
logic signed [31:0] a_q, a_d;
logic signed [31:0] b_q, b_d;
logic signed [31:0] c_q, c_d;
logic signed [31:0] d_q, d_d;
logic signed [63:0] mul_q, mul_d;
logic [1:0] pt_ct_q, pt_ct_d;

/* Xilinx Divide IP*/
logic        div_s_valid;
logic [31:0] div_dividend;
logic [31:0] div_divisor;
logic [3:0]  div_s_user; // tracks which operation is which
logic        div_s_ready;

// Outputs
logic        div_m_valid;
logic [55:0] div_m_data;
logic [3:0]  div_m_user;

/* Instantiate Xilinx Divider IP
High-Level Specs:
COnfigured in high-radix mode as opposed to radix-2--uses DSP units, but less LUTs
Input divisor/dividend width: 32 bits
Output width 56 bits, lower 19 bits are fractional
iirc, latency is around 50 cycles
*/
div_gen_0 divider (
  .aclk                   (clk),
  .s_axis_divisor_tvalid  (div_s_valid),
  .s_axis_divisor_tready  (div_s_ready),
  .s_axis_divisor_tdata   (div_divisor),
  .s_axis_divisor_tuser   (div_s_user), 
        
  .s_axis_dividend_tvalid (div_s_valid),
  .s_axis_dividend_tready (),
  .s_axis_dividend_tdata  (div_dividend),
  .s_axis_dividend_tuser (div_s_user),
        
  .m_axis_dout_tvalid     (div_m_valid),
  .m_axis_dout_tdata      (div_m_data),
  .m_axis_dout_tuser      (div_m_user)
);

// AXI-4 Handshake Helper
logic div_ready_handshake;
assign div_ready_handshake = div_s_ready;

logic signed [31:0] quotient;
logic signed [18:0] fractional;
logic signed [31:0] result_q16; // Assuming 32-bit output target
logic signed [63:0] tmp;

always_comb begin
  // defaults
  state_d     = state_q;
  pt_ct_d     = pt_ct_q;
  dp_d        = dp_q;
  op_x_d      = op_x_q;
  op_y_d      = op_y_q;
  op_z_d      = op_z_q;
  odr_d       = odr_q;
  out_ready_d = out_ready_q;
        
  a_d = a_q; b_d = b_q; c_d = c_q; d_d = d_q; mul_d = mul_q;

  if (!stall) out_ready_d = 1'b0;

  div_s_valid  = 1'b0;
  div_dividend = 32'b0;
  div_divisor  = 32'b1;
  div_s_user   = 4'b0;

  if (div_m_valid) begin
    quotient   = div_m_data[50:19];
    fractional = div_m_data[18:0];

    // reconstruct strictly to Q16.16
    result_q16 = {quotient[15:0], fractional[18:3]};

    // decode tuser
    case (div_m_user[1:0]) 
      2'd0: begin // X Component
        op_x_d[div_m_user[3:2]] = (result_q16 + FIXED_1_0) * SCALE_X; 
      end
      2'd1: begin // Y Component
        op_y_d[div_m_user[3:2]] = (FIXED_1_0 - result_q16) * SCALE_Y;
      end
      2'd2: begin // Z Component
        op_z_d[div_m_user[3:2]] = result_q16;
      end
      2'd3: begin // inverse area
        odr_d = $signed(div_m_data[36:5]); 
        out_ready_d = 1'b1;
      end
    endcase
  end

  case (state_q)
    IDLE: begin
      pt_ct_d = 2'b00;
                
      if (in_valid) begin
        // matrix multiplication by projection matrix
        for (int i = 0; i < 3; i++) begin
          // X
          tmp = $signed(t_x[i]) * $signed(PROJ_MAT[0][0]);
          dp_d[i].x = tmp[55:24];

          // Y
          tmp = $signed(t_y[i]) * $signed(PROJ_MAT[1][1]);
          dp_d[i].y = tmp[55:24];

          // Z
          tmp = $signed(t_z[i]) * $signed(PROJ_MAT[2][2]);
          dp_d[i].z = tmp[55:24] + ($signed(PROJ_MAT[2][3] >>> 8)); 

          // W
          dp_d[i].w = t_z[i];
        end
                    
        state_d = X;
      end
    end

    X: begin
      // X/W
      div_s_user   = {pt_ct_q, 2'd0};
      div_dividend = dp_q[pt_ct_q].x;
      div_divisor  = dp_q[pt_ct_q].w;

      if (div_ready_handshake) begin
        div_s_valid = 1'b1;
        state_d = Y;
      end
    end

    Y: begin
      // Y/W
      div_s_user   = {pt_ct_q, 2'd1};
      div_dividend = dp_q[pt_ct_q].y;
      div_divisor  = dp_q[pt_ct_q].w;

      if (div_ready_handshake) begin
        div_s_valid = 1'b1;
        state_d = Z;
      end
    end

    Z: begin
      // Z/W
      div_s_user   = {pt_ct_q, 2'd2};
      div_dividend = dp_q[pt_ct_q].z;
      div_divisor  = dp_q[pt_ct_q].w;

      if (div_ready_handshake) begin
        div_s_valid = 1'b1;
                    
        if (pt_ct_q == 2) begin
          state_d = R1; // finished all vertices
        end else begin
          pt_ct_d = pt_ct_q + 1;
          state_d = X;  // next vertex
        end
      end
    end

    R1: begin
      // start computing inv area
      if (div_m_valid && div_m_user == 4'b1010) begin
        state_d = R2;
      end
    end

    R2: begin
      // breaking this into two steps for timing purposes
      a_d = op_y_q[1] - op_y_q[2];
      b_d = op_x_q[0] - op_x_q[2];
      c_d = op_x_q[2] - op_x_q[1];
      d_d = op_y_q[0] - op_y_q[2];
      state_d = R3;
    end

    R3: begin
      mul_d = ($signed(a_q) * $signed(b_q)) + ($signed(c_q) * $signed(d_q));
      state_d = R4;
    end

    R4: begin
      // Calculate 1/Area
      div_s_user   = 4'b1111;
      div_dividend = 32'h01000000; // 1.0 in Q8.24
      div_divisor  = mul_q[49:18];
                
      if (div_ready_handshake) begin
        div_s_valid = 1'b1;
        state_d     = IDLE;
      end
    end
  endcase
end

// register the fsm
always_ff @(posedge clk) begin
  if (rst) begin
    state_q     <= IDLE;
    out_ready_q <= 1'b0;
    pt_ct_q     <= 2'b0;
  end else begin
    state_q     <= state_d;
    out_ready_q <= out_ready_d;
    pt_ct_q     <= pt_ct_d;
            
    dp_q   <= dp_d;
    op_x_q <= op_x_d;
    op_y_q <= op_y_d;
    op_z_q <= op_z_d;
    odr_q  <= odr_d;
            
    a_q <= a_d; b_q <= b_d; c_q <= c_d; d_q <= d_d;
    mul_q <= mul_d;
  end
end

// assign outputs
assign ready     = (state_q == IDLE);
assign out_valid = out_ready_q;
assign p_x       = op_x_q;
assign p_y       = op_y_q;
assign p_z       = op_z_q;
assign dr        = odr_q;


endmodule

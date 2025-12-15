`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2025 10:24:31 AM
// Design Name: 
// Module Name: transformation
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

module transformation (
    input  logic               clk,
    input  logic               rst,

    input  logic signed [31:0] t_x [3], t_y [3], t_z [3],
    input  logic        [15:0] color,
    input  logic               in_valid,
    input  logic               data_read,
    input  logic signed [9:0]  model_matrix[3][4],
    input  logic               stall,

    output logic signed [31:0] out_x [3], out_y [3], out_z [3],
    output logic        [15:0] color_out,
    output logic               valid
);

typedef enum {IDLE, StWAIT, P1, P2, P3, P4, P5, P6} state_e;
state_e state_d, state_q;

logic signed [31:0] model_r_x[3], model_r_y[3], model_r_z[3];
logic        [15:0] color_r;
logic signed [9:0]  matrix[3][4];

logic signed [31:0] pt_x, pt_y, pt_z;
logic signed [31:0] opt_x, opt_y, opt_z;
logic signed [31:0] tri_r_x[3], tri_r_y[3], tri_r_z[3];
    
// tmp
logic signed [31:0] products[3][3], next_products[3][3];
logic signed [31:0] next_opt_x, next_opt_y, next_opt_z;

always_comb begin
  logic signed [47:0] tmp_x, tmp_y, tmp_z;

  for (int i = 0; i < 3; i++) begin
    tmp_x = $signed(matrix[i][0]) * pt_x;
    tmp_y = $signed(matrix[i][1]) * pt_y;
    tmp_z = $signed(matrix[i][2]) * pt_z;

    next_products[i][0] = tmp_x[39:8];
    next_products[i][1] = tmp_y[39:8];
    next_products[i][2] = tmp_z[39:8];
  end

    next_opt_x = products[0][0] + products[0][1] + products[0][2] + $signed({matrix[0][3], 16'b0});
    next_opt_y = products[1][0] + products[1][1] + products[1][2] + $signed({matrix[1][3], 16'b0});
    next_opt_z = products[2][0] + products[2][1] + products[2][2] + $signed({matrix[2][3], 16'b0});
end

always_comb begin
  state_d = state_q;
  valid = 1'b0;

  unique case (state_q)
    IDLE:   begin 
      if (in_valid && !stall) 
        state_d = StWAIT;
    end
    StWAIT: state_d = P1;
    P1:     state_d = P2;
    P2:     state_d = P3;
    P3:     state_d = P4; 
    P4:     state_d = P5; 
    P5:     state_d = P6; 
    P6: begin
      valid = 1'b1;
      
      if (data_read && !stall) 
        state_d = IDLE;
    end
    default: state_d = IDLE;
  endcase
end

always_ff @(posedge clk) begin
  if (rst) begin
    state_q <= IDLE;
  end else begin
    state_q <= state_d;
            
    products <= next_products;
    opt_x <= next_opt_x;
    opt_y <= next_opt_y;
    opt_z <= next_opt_z;

    case (state_q)
      IDLE: begin
        if (in_valid && !stall) begin
          matrix <= model_matrix;
          model_r_x <= t_x; 
          model_r_y <= t_y; 
          model_r_z <= t_z;
          color_r <= color;

          pt_x <= t_x[0]; 
          pt_y <= t_y[0]; 
          pt_z <= t_z[0];
        end
      end
                
      P1: begin
        pt_x <= model_r_x[1]; 
        pt_y <= model_r_y[1]; 
        pt_z <= model_r_z[1];
      end

      P2: begin
        pt_x <= model_r_x[2]; 
        pt_y <= model_r_y[2]; 
        pt_z <= model_r_z[2];
      end

      P3: begin
        tri_r_x[0] <= opt_x; 
        tri_r_y[0] <= opt_y; 
        tri_r_z[0] <= opt_z;
      end

      P4: begin
        tri_r_x[1] <= opt_x; 
        tri_r_y[1] <= opt_y; 
        tri_r_z[1] <= opt_z;
      end

      P5: begin
        tri_r_x[2] <= opt_x; 
        tri_r_y[2] <= opt_y; 
        tri_r_z[2] <= opt_z;
      end            
    endcase
  end
end

assign out_x = tri_r_x;
assign out_y = tri_r_y;
assign out_z = tri_r_z;
assign color_out = color_r;

endmodule

module gpio (
    input logic clk,
    input logic rst,
    input logic [255:0] mb_data,
    input logic         mb_data_valid,

    input logic signed [31:0] initial_t_x [3],
    input logic signed [31:0] initial_t_y [3],
    input logic signed [31:0] initial_t_z [3],

    output logic signed [31:0] transformed_t_x [3],
    output logic signed [31:0] transformed_t_y [3],
    output logic signed [31:0] transformed_t_z [3],
    input logic                 proj_ready,
    output logic               proj_out_valid
);
    logic [9:0] sin;
    logic [9:0] cos;
    logic [15:0] color_out;
    logic in_valid;
    logic data_read, transform_valid;
    logic out_valid;
    logic [31:0] cordic_out;

    logic [31:0] mb_altitude;
    logic [15:0] mb_airspeed;
    logic [15:0] mb_pitch;
    logic [15:0] mb_roll;
    logic [15:0] mb_yaw;
    logic [15:0] mb_throttle;
    logic [15:0] mb_climb_rate;

    assign mb_altitude = mb_data[31:0];
    assign mb_airspeed = mb_data[47:32];
    assign mb_pitch    = mb_data[63:48];
    assign mb_roll     = mb_data[79:64];
    assign mb_yaw      = mb_data[95:80];
    assign mb_throttle = mb_data[111:96];
    assign mb_climb_rate = mb_data[127:112];

    cordic_0 cordic_inst (
        .aclk(clk),
        .s_axis_phase_tdata(16'h6000),
        .s_axis_phase_tvalid(in_valid),
        .m_axis_dout_tdata(cordic_out),
        .m_axis_dout_tvalid(out_valid)
    );

    assign sin = cordic_out[9:0];
    assign cos = cordic_out[25:16];

    transformation transformation_inst (
        .clk(clk),
        .rst(1'b0),
        .t_x(initial_t_x),
        .t_y(initial_t_y),
        .t_z(initial_t_z),
        .color(16'hFFFF),
        .in_valid(out_valid),
        .data_read(data_read),
        .model_matrix('{
            '{ cos, -sin, 10'b0, 10'b0 },
            '{ sin,  cos, 10'b0, 10'b0 },
            '{ 10'b0, 10'b0, 10'h100, 10'b0 }
        }),
        .stall(1'b0),
        .out_x(transformed_t_x),
        .out_y(transformed_t_y),
        .out_z(transformed_t_z),
        .color_out(color_out),
        .valid(transform_valid)
    );

    typedef enum {
      StIdle, StWaitTransformation, StWait, StReqCordic, StGetCordic
    } gpio_state_e;

    gpio_state_e state_d, state_q;

    always_ff @(posedge clk) begin
      if (rst) begin
        state_q <= StIdle;
      end else begin
        state_q <= state_d;
      end
    end

    always_comb begin
      state_d = state_q;
      in_valid = 1'b0;

      unique case (state_q)
        StIdle: begin
          if (mb_data_valid) begin
            state_d = StReqCordic;
          end
        end
        StReqCordic: begin
          in_valid = 1'b1;
          state_d = StWaitTransformation;
        end
        StWaitTransformation: begin
          if (transform_valid) begin
            proj_out_valid = 1'b1;
            state_d = StWait;
          end
        end
        StWait: begin
          proj_out_valid = 1'b1;

          if (proj_ready) begin
            state_d = StIdle;
          end
        end
      endcase
    end  

endmodule

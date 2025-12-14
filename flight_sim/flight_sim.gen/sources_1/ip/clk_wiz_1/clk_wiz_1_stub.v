// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 20:24:16 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.v
// Design      : clk_wiz_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(clk_out1_ddr, clk_out1_ddr_n, 
  clk_out2_ddr_90, clk_out3_ref, clk_out4_div, clk_out4_div_n, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1_ddr,clk_out1_ddr_n,clk_out2_ddr_90,clk_out3_ref,clk_out4_div,clk_out4_div_n,reset,locked,clk_in1" */;
  output clk_out1_ddr;
  output clk_out1_ddr_n;
  output clk_out2_ddr_90;
  output clk_out3_ref;
  output clk_out4_div;
  output clk_out4_div_n;
  input reset;
  output locked;
  input clk_in1;
endmodule

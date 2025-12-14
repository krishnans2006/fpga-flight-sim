// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
<<<<<<< HEAD
// Date        : Sat Dec 13 20:36:13 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
=======
// Date        : Sun Dec 14 08:53:07 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
>>>>>>> 0284568 (add transformation matrix module)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/vertices_rom_1/vertices_rom_stub.v
// Design      : vertices_rom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *)
module vertices_rom(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[3:0],dina[95:0],douta[95:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [3:0]addra;
  input [95:0]dina;
  output [95:0]douta;
endmodule

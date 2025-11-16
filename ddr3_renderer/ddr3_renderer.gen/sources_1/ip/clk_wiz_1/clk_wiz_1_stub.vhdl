-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Sat Nov 15 17:24:03 2025
-- Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/anike/class-ECE385/Final_Project/s_ddr3_urbana/ddr3_renderer/ddr3_renderer.gen/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.vhdl
-- Design      : clk_wiz_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_1 is
  Port ( 
    clk_out1_ddr : out STD_LOGIC;
    clk_out1_ddr_n : out STD_LOGIC;
    clk_out2_ddr_90 : out STD_LOGIC;
    clk_out3_ref : out STD_LOGIC;
    clk_out4_div : out STD_LOGIC;
    clk_out4_div_n : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_1;

architecture stub of clk_wiz_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1_ddr,clk_out1_ddr_n,clk_out2_ddr_90,clk_out3_ref,clk_out4_div,clk_out4_div_n,reset,locked,clk_in1";
begin
end;

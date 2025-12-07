//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Sun Dec  7 14:17:49 2025
//Host        : Krishnan-Win running 64-bit major release  (build 9200)
//Command     : generate_target mb_block_wrapper.bd
//Design      : mb_block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mb_block_wrapper
   (clk_100MHz,
    gpio_highway_to_hw_tri_o,
    gpio_highway_to_mb_tri_i,
    gpio_usb_int_tri_i,
    gpio_usb_rst_tri_o,
    reset_rtl_0,
    spi_usb_miso,
    spi_usb_mosi,
    spi_usb_sclk,
    spi_usb_ss,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  input clk_100MHz;
  output [31:0]gpio_highway_to_hw_tri_o;
  input [31:0]gpio_highway_to_mb_tri_i;
  input [0:0]gpio_usb_int_tri_i;
  output [0:0]gpio_usb_rst_tri_o;
  input reset_rtl_0;
  input spi_usb_miso;
  output spi_usb_mosi;
  output spi_usb_sclk;
  output [0:0]spi_usb_ss;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire clk_100MHz;
  wire [31:0]gpio_highway_to_hw_tri_o;
  wire [31:0]gpio_highway_to_mb_tri_i;
  wire [0:0]gpio_usb_int_tri_i;
  wire [0:0]gpio_usb_rst_tri_o;
  wire reset_rtl_0;
  wire spi_usb_miso;
  wire spi_usb_mosi;
  wire spi_usb_sclk;
  wire [0:0]spi_usb_ss;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  mb_block mb_block_i
       (.clk_100MHz(clk_100MHz),
        .gpio_highway_to_hw_tri_o(gpio_highway_to_hw_tri_o),
        .gpio_highway_to_mb_tri_i(gpio_highway_to_mb_tri_i),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(reset_rtl_0),
        .spi_usb_miso(spi_usb_miso),
        .spi_usb_mosi(spi_usb_mosi),
        .spi_usb_sclk(spi_usb_sclk),
        .spi_usb_ss(spi_usb_ss),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule

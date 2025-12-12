//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Fri Dec 12 16:00:12 2025
//Host        : Krishnan-Win running 64-bit major release  (build 9200)
//Command     : generate_target mb_block_wrapper.bd
//Design      : mb_block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mb_block_wrapper
   (clk_100MHz,
    gpio_usb_int_tri_i,
    gpio_usb_rst_tri_o,
    reset_rtl_0,
    spi_usb_miso,
    spi_usb_mosi,
    spi_usb_sclk,
    spi_usb_ss,
    uartlite_rxd,
    uartlite_txd);
  input clk_100MHz;
  input [0:0]gpio_usb_int_tri_i;
  output [0:0]gpio_usb_rst_tri_o;
  input reset_rtl_0;
  input spi_usb_miso;
  output spi_usb_mosi;
  output spi_usb_sclk;
  output [0:0]spi_usb_ss;
  input uartlite_rxd;
  output uartlite_txd;

  wire clk_100MHz;
  wire [0:0]gpio_usb_int_tri_i;
  wire [0:0]gpio_usb_rst_tri_o;
  wire reset_rtl_0;
  wire spi_usb_miso;
  wire spi_usb_mosi;
  wire spi_usb_sclk;
  wire [0:0]spi_usb_ss;
  wire uartlite_rxd;
  wire uartlite_txd;

  mb_block mb_block_i
       (.clk_100MHz(clk_100MHz),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(reset_rtl_0),
        .spi_usb_miso(spi_usb_miso),
        .spi_usb_mosi(spi_usb_mosi),
        .spi_usb_sclk(spi_usb_sclk),
        .spi_usb_ss(spi_usb_ss),
        .uartlite_rxd(uartlite_rxd),
        .uartlite_txd(uartlite_txd));
endmodule

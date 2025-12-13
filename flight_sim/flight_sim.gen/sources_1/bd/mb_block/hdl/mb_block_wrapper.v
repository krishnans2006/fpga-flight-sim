//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Fri Dec 12 20:37:04 2025
//Host        : Krishnan-Win running 64-bit major release  (build 9200)
//Command     : generate_target mb_block_wrapper.bd
//Design      : mb_block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mb_block_wrapper
   (ah_y_disp_0,
    airspeed_0,
    altitude_0,
    climb_rate_0,
    clk_100MHz,
    gpio_usb_int_tri_i,
    gpio_usb_rst_tri_o,
    latitude_0,
    longitude_0,
    pitch_0,
    ready_0,
    reset_rtl_0,
    roll_0,
    spi_usb_miso,
    spi_usb_mosi,
    spi_usb_sclk,
    spi_usb_ss,
    throttle_0,
    uartlite_rxd,
    uartlite_txd,
    yaw_0);
  output [7:0]ah_y_disp_0;
  output [15:0]airspeed_0;
  output [31:0]altitude_0;
  output [15:0]climb_rate_0;
  input clk_100MHz;
  input [0:0]gpio_usb_int_tri_i;
  output [0:0]gpio_usb_rst_tri_o;
  output [31:0]latitude_0;
  output [31:0]longitude_0;
  output [15:0]pitch_0;
  output ready_0;
  input reset_rtl_0;
  output [15:0]roll_0;
  input spi_usb_miso;
  output spi_usb_mosi;
  output spi_usb_sclk;
  output [0:0]spi_usb_ss;
  output [15:0]throttle_0;
  input uartlite_rxd;
  output uartlite_txd;
  output [15:0]yaw_0;

  wire [7:0]ah_y_disp_0;
  wire [15:0]airspeed_0;
  wire [31:0]altitude_0;
  wire [15:0]climb_rate_0;
  wire clk_100MHz;
  wire [0:0]gpio_usb_int_tri_i;
  wire [0:0]gpio_usb_rst_tri_o;
  wire [31:0]latitude_0;
  wire [31:0]longitude_0;
  wire [15:0]pitch_0;
  wire ready_0;
  wire reset_rtl_0;
  wire [15:0]roll_0;
  wire spi_usb_miso;
  wire spi_usb_mosi;
  wire spi_usb_sclk;
  wire [0:0]spi_usb_ss;
  wire [15:0]throttle_0;
  wire uartlite_rxd;
  wire uartlite_txd;
  wire [15:0]yaw_0;

  mb_block mb_block_i
       (.ah_y_disp_0(ah_y_disp_0),
        .airspeed_0(airspeed_0),
        .altitude_0(altitude_0),
        .climb_rate_0(climb_rate_0),
        .clk_100MHz(clk_100MHz),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .latitude_0(latitude_0),
        .longitude_0(longitude_0),
        .pitch_0(pitch_0),
        .ready_0(ready_0),
        .reset_rtl_0(reset_rtl_0),
        .roll_0(roll_0),
        .spi_usb_miso(spi_usb_miso),
        .spi_usb_mosi(spi_usb_mosi),
        .spi_usb_sclk(spi_usb_sclk),
        .spi_usb_ss(spi_usb_ss),
        .throttle_0(throttle_0),
        .uartlite_rxd(uartlite_rxd),
        .uartlite_txd(uartlite_txd),
        .yaw_0(yaw_0));
endmodule

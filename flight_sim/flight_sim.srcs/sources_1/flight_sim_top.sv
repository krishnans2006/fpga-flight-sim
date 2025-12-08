module flight_sim_top (
    input clk,
    // input reset_ah,  // instead provided by btn[0]

    // I/O
    input  [3:0] sw,
    input  [3:0] btn,
    output [15:0] led,
    output [2:0] rgbled0,
    output [2:0] rgbled1,

    // UART
    input  uart_rtl_0_rxd,
    output uart_rtl_0_txd,
    
    // USB
    input gpio_usb_int_tri_i,
    output gpio_usb_rst_tri_o,
    input spi_usb_miso,
    output spi_usb_mosi,
    output spi_usb_sclk,
    output spi_usb_ss,

    // HDMI
    output       hdmi_tmds_clk_n,
    output       hdmi_tmds_clk_p,
    output [2:0] hdmi_tmds_data_n,
    output [2:0] hdmi_tmds_data_p,

    // DDR3
    // Inouts
    inout  [15:0] ddr3_dq,
    inout  [ 1:0] ddr3_dqs_n,
    inout  [ 1:0] ddr3_dqs_p,
    // Outputs
    output [13:0] ddr3_addr,  // ddr3_addr[13] is N/C on Urbana board
    output [ 2:0] ddr3_ba,
    output        ddr3_ras_n,
    output        ddr3_cas_n,
    output        ddr3_we_n,
    output        ddr3_reset_n,
    output [ 0:0] ddr3_ck_p,
    output [ 0:0] ddr3_ck_n,
    output [ 0:0] ddr3_cke,
    //output	[0:0]	ddr3_cs_n,  // removed in Urbana board
    output [ 1:0] ddr3_dm,
    output [ 0:0] ddr3_odt
);

  // Parse btn[3:0] into specific signals
  // The rest of the I/O can be handled by ddr_renderer_top directly
  logic reset_ah, initialize;
  assign reset_ah = btn[0];
  assign initialize = btn[1];

  // If this line is commented out, everything breaks lol
  // I have no idea why or how
  // Have fun!
  assign led[15] = gpio_usb_int_tri_i;

  // MicroBlaze to HW communication (GPIO highway)
  logic [31:0] highway_mb_to_hw;
  logic [31:0] highway_hw_to_mb;

  mb_block mb_block_inst (
      .clk_100MHz(clk),
      .reset_rtl_0(~reset_ah),  // block design needs active low

      .uart_rtl_0_rxd(uart_rtl_0_rxd),
      .uart_rtl_0_txd(uart_rtl_0_txd),
      
      .gpio_highway_to_hw_tri_o(highway_mb_to_hw),
      .gpio_highway_to_mb_tri_i(highway_hw_to_mb),

      .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
      .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
      .spi_usb_miso(spi_usb_miso),
      .spi_usb_mosi(spi_usb_mosi),
      .spi_usb_sclk(spi_usb_sclk),
      .spi_usb_ss(spi_usb_ss)
  );

  ddr_renderer_top ddr_renderer_top_inst (
      .DDR3_CLK100(clk),
      .reset_ah(reset_ah),
      .initialize(initialize),

      .SW(sw),
      .LED(led[3:0]),
      .RGBLED0(rgbled0),
      .RGBLED1(rgbled1),

      .ddr3_dq(ddr3_dq),
      .ddr3_dqs_n(ddr3_dqs_n),
      .ddr3_dqs_p(ddr3_dqs_p),
      .ddr3_addr(ddr3_addr),
      .ddr3_ba(ddr3_ba),
      .ddr3_ras_n(ddr3_ras_n),
      .ddr3_cas_n(ddr3_cas_n),
      .ddr3_we_n(ddr3_we_n),
      .ddr3_reset_n(ddr3_reset_n),
      .ddr3_ck_p(ddr3_ck_p),
      .ddr3_ck_n(ddr3_ck_n),
      .ddr3_cke(ddr3_cke),
      .ddr3_dm(ddr3_dm),
      .ddr3_odt(ddr3_odt),

      .hdmi_tmds_clk_n(hdmi_tmds_clk_n),
      .hdmi_tmds_clk_p(hdmi_tmds_clk_p),
      .hdmi_tmds_data_n(hdmi_tmds_data_n),
      .hdmi_tmds_data_p(hdmi_tmds_data_p)
  );

endmodule

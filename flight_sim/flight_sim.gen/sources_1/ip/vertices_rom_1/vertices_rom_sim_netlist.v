// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Dec 14 17:28:39 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/vertices_rom_1/vertices_rom_sim_netlist.v
// Design      : vertices_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "vertices_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module vertices_rom
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [95:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [95:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [95:0]dina;
  wire [95:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [95:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [95:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.2646 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "vertices_rom.mem" *) 
  (* C_INIT_FILE_NAME = "vertices_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "96" *) 
  (* C_READ_WIDTH_B = "96" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "96" *) 
  (* C_WRITE_WIDTH_B = "96" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  vertices_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[95:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[95:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 41664)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

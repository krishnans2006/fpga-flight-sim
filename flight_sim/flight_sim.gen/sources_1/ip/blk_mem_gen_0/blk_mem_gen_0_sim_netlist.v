// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Dec  7 10:00:13 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/krishnan/Documents/fpga-flight-sim/ddr3_renderer/ddr3_renderer.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [1:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [1:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [15:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]dinb;
  wire [15:0]douta;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [1:0]wea;
  wire [1:0]web;
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
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.0617 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "640" *) 
  (* C_READ_DEPTH_B = "640" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "2" *) 
  (* C_WEB_WIDTH = "2" *) 
  (* C_WRITE_DEPTH_A = "640" *) 
  (* C_WRITE_DEPTH_B = "640" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20288)
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

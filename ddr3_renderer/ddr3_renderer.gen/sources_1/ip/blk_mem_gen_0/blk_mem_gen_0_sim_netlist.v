// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Nov 19 00:35:27 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/anike/class-ECE385/Final_Project/ddr3_renderer/ddr3_renderer.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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

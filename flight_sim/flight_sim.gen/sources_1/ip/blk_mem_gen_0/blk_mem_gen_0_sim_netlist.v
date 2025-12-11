// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Dec 10 03:03:29 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/anike/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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

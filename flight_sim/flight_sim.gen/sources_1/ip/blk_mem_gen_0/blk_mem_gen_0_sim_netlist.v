// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 20:29:00 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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

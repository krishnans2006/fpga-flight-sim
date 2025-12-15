// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Dec 14 17:26:24 2025
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

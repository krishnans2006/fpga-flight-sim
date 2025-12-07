// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Dec  7 12:46:18 2025
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

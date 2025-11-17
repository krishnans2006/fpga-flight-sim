// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Nov 17 00:08:38 2025
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
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [1:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [1:0]wea;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.53085 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
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
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
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
        .web({1'b0,1'b0}));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18912)
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

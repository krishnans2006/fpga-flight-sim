// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 11 19:46:32 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top faces_rom -prefix
//               faces_rom_ faces_rom_sim_netlist.v
// Design      : faces_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "faces_rom,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module faces_rom
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
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
  (* C_INIT_FILE = "faces_rom.mem" *) 
  (* C_INIT_FILE_NAME = "faces_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  faces_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19136)
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

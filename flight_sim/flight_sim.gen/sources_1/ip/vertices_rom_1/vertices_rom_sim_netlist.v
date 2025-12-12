// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 11 19:47:42 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top vertices_rom -prefix
//               vertices_rom_ vertices_rom_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [4:0]addra;
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
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "5" *) 
  (* C_ADDRB_WIDTH = "5" *) 
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
  (* C_INIT_FILE = "vertices_rom.mem" *) 
  (* C_INIT_FILE_NAME = "vertices_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "32" *) 
  (* C_READ_DEPTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "32" *) 
  (* C_WRITE_DEPTH_B = "32" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  vertices_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19232)
`pragma protect data_block
1qRUtVJnfhIeK5H2RILCmWpX2oW8vOaNuFsyBU9SOn+aU7cYJjgcaXkXdA0aEB37wdWMfVKZ5qX0
TWFkIPSjnmk5nXxFM3SgLIZrJDdquYXDE9brTKUzqoIwcImEate5xnMtW3pHVWBBG44+T/Kb14wV
+3QkPm1ZiYLr0YZnxQ8BQY4KgUVwdxNX09lOCwlw0R5yFEvb2dkuNwwbQPWEksdsIOp7F1OLAkqT
3Qz0AsdMka7EVmC2IGZtQASlTCrv/SiU1Kyo1JXoLNYx9N5+LK938GLzX57mILA0iu8qk8Ud/JeH
04OQIb+38Oo3Gc61Cx83wxtsANZR90ZgM/YjV+ZS7UE8urmYV2yBfBzeEWiqwPd+nC4CoBl/iVgA
wdhOi4Cwg05RaatSC6LYGAnRZLaow4IwWPj3e3+wn50h8AbyDI5CV6gSaoXyO5ejsRejCKIsymN+
owOpo5JJaBvjeqbe3qfAzN8jF1MDZXK0gSN8Qi53V8yF8KXphV+YEcC1fAMeggmiH5T+MsDzny9Q
OXfrYwrynp0ezXCePo4V6NLffdQU1Z8aWwXYLlw/cAV/mL2stvMODXDQcOgpxbEC17J+aMhIMnYG
HWtnCbCXB2qEUpArjWF7dujlSnEHWgV3unbGYSApKCqEvy7g38dXV9DTzm4JR1Q4IpNifZVhp034
CUJZC6TaAc3IPcKglf0nOmOmlzpz46SNp3lqX2lXFIN/GyqrX9wVjP4o6BDcLpifW9AbojrO+cOa
YmP28mY4lwA4R97Mkh2BSA0MxfuJ3KoAmDXyPjBiLWpZrLywGctbWEgf2DM+Mn7H+WgepUBDk5Gn
pEuxBgQe8lHqbyc9SRZx1I6Go27Lls2Gs9qLVrsTzIWWm2Y03IrpE3fyV2Rye6EydNuHQTm6QU+N
vba1vGs+Fb2XL6rm8gcPynxz+AGJAZ0fhnJfKDIkWLlv1Hw4MY4Lsps5+UcmtrBw+OVrnaToePUm
qFCJUKcWSWOb/SbNgwjY0s4LXo7z/OiuQL2Bv76IiROAdU+Sap2nVqSahS4DyNcfu/xGC3JUUzx/
52HjREpWf3U6McGosE94jeW51irn02BA9IOExSW2xNUQVZ5lRN4O8nXJsBVvnHH7wz4CAp8x913w
icSQrZvrCXjXWXbByXqUvmFus/5Rl0lDqnNgLykl8IgwNJYU8kBJUtnZqyHb6vje/O1KKF8knpts
qfFIDdtmQlHoht5EpSUnCCbq8R9hi1G3Ixu19vZryiWjRjTOX//V/UmAowx6WukkhPD/aqGaGjcv
vRw/Q6WJKBSrpJJHP6imj+QOAC4wVfDxz98ucaIjH5oSZjg99Zl62GN7NyjRwY5sumn+2ncVjC7q
Rd923gTkXsCwXKStj7TPN1jbyRH+tO3vVzp9ovdXY1yZQbJCl/kFYjhb2mkzUEGq9yoMFHVEQaMz
fSa2pluF2P3CMX/2aedy4x01C0PzEyc4ppHHOa85vx2DJagMz+aMcB/t+6D/jPHmo0ubVsfyv0L5
VEXSMWBcedMAI60krqsP5bxeqlkn6H9H17pWRExGYpYf5+SnnHaeg03BOKadTZMg9gWydnOvyPCP
tVGLSa77ZYysr4ifyrF1qvR1Xg0t1u0v5B/dQZf3IZlEOOoifWx3CZs85U1xu01eLjTfwb7wa7Yj
MsEsh+rwCRT/Q1koXA4Ly5ZCfi9Yivx0FHlnmGZrgq+7QLU4Og3FsTMyhGKu1Hb9pjc4kb0RdB3P
R0deH+cLbsVoVwoO4xF01rhl3LF0hfKDjpDTlt76zK5LDsPff49L23JIzQozcHFY6H9Banzg3Pwm
w9c5/N36f6uu/BYlBmmaYgq2PqMCOrqEDlLdewhgIdcACO6lnZz/lx6DSFkz6QuIz3RpvLU4XFlC
XhFG++0a6g2b0yaJoI+tn16JLZVGifmZdMM5j+KR3teBf22ka1xtP8XAiBu1mc7OtbIWeyLkjy5O
rwRYNmjuIzf/4UUbCggjQFfpd+zMrKj5BzSW0W4LvMFDsNXnC9q261iLovBTbZPXdAgf5W2WxQZS
JuAz51hupI41khBznSiEOzj+4vzMEm5UM2gFb2abQpO0cr5HExrS73cfjayHIzFJdzPKMIB1FSkP
ZBuNOe54AH/49Ii9iWPWjdccd81kDO14xikbppG9e578Bu7oPkyFfb7AvfO52jVygyOG75uHHsIe
O/B7nhcCVnwUt6Kb62KSV+Hw0GysHV7gHnsvtpaSZ0/435EB1IxvLPO60bIpLEsOuyKWS8urvHMu
A/haf7nGLmra+KxU36hpJDpvFrOYiuaB8PEawJBRBJKoFmunByJ2DEj/IivW2KkI8qwATu9z8s2M
JccLTowd8zu6y0B1n5kERhyOaScWdyt4xltqGVhvsom4+hPnKk4wMDk08f6GdCh8P3k5hD1KEnCk
CDPYS5SthzTyogoMFJpPILnV7L43cUUEBcmIqVbb+botnsziRPzRahdwlKCCFY1TZlDWN8QyDnmB
HaUw+DsUtKXtbgx0e0nM+thzlvPMVAvppYNgcHzeSmQ8Px8fm83hlyAtdocv/7xND15qit8Ui2sx
AW5qvIPQYWHF/za1xpqpJzeiOY4BUM3CovBZyTA8WS/47RKHQz1YG+5/7Ren12LmI1ogJ7DwleTo
xSnwoYE6CRhKDzg0tBtR2kOezqYpqurNviVvShhYhXRz9zFdYFHj1QkdRwEPfv8gj3G5Tjnd1ebI
Aw8690bBxkYQyF9eJP2dUhVLiEJ2XGEwsuiUapQtQ3l8ha8NSO51tPdQ/E/YT2jSTBL6dW7NRNjq
aS6pdSegcOV3bU5pm8nwTcJHMSO257+4oO37Cf1yIQr7aTe8b7fwVhRm02lPJ/Md0DCk6MgAy570
t4C24C6fTT2+3oRZr+1GIamBBKSCkcULNmNNQaSPaWluq+bSq6KqxvoCIAg/QPNo1fNyUCKAOmij
ZXOQC3sdmJoqv6Glkl9yYGBoiTLmDbmckkrO28OJbRJDH+P4t9OajvnEe6fBsZLLFQvEpQUa+GYD
RA1hQVwjAXMmBJfPLkwvGqQL0mJXCpnGhDUWM93OsIDBShoJ+3KBa/XjAu4E73eKBgmv3eIB8+d/
cQKO75YsbR4kytzEtRxo/KL7hrm/2Gyy3cfWcM8L2vyrKoWG8z2TUYUTbO18WklJ4xnmAffRVxX2
INP8H+zaAmSi/mJDcCjbjWCnMgrgWNXDCtQDzfNUElf0Zz9gzXw5UnSEeOVofuqgatyNllTkIU23
bKXFuNbHNZmf7UblS0/tPHuZTUIPcaRjD6+Ldbpqnia3KbVSHc8r5f9/kDAuOCzEGubnngJzAkW9
e8b49j1X6Vfhbjfwl5+anYRk6q9m2x0YcZucRkA1VJW/YvUAYoMAn/CDV+hHfh/WFp0laE3d0igM
Z+ex6UTTkrfAzModHzUoGoFemVjVVwRSXf/XPcQeqkmJbHeb3e9n/nbm0pNXqh9KJMd48V+h7yFQ
lfkUxBp/PQQrKJIVYzCsrFAbLOo2aPnV60I/2ZpIgvDjCMfkya5ypyTtSPFl5/O9DPw2nVfN3gaa
sBsMZltqTg/wjrC+C1JVNE/h6M0h2o3E7G15q8/i6MSIe/jH8iustERVZOuk47PEZIpAXC8htxNR
DoZXE8MLMoauidSN2C4azWoojsJ4u+m2yoxmiMM52ypXweFjmK4Fh2iSRbJjm2+AIvlNv7L1nm6V
L7Kk1Shk9xhGOPv/OwnJln8cgqY/Z1wWDxMRKs7mGL6g6ayYXranU2WyMBwdcrRslQwGsOZiayhH
zfXR7d4ibzyCm64E7T5cevO5+8n1Qk6cpfEUbnaoNVLel8C/mjnhmHWA2QvTIkbw9YM29gzbx9XX
PFxBV5RWCFPCwfHEkPqwxcIA9SR5ge99r3xV+MCzTG5Mqn05kQ4txPbvGwhzWwYG94ckrt82F50u
Jz6tI77qJnYIcfbtondEb+IMJkyqtFj22Z/mnRCjKij4yUhQKH9qhAWd1uW5QI4p901keNwDeMyW
kTELwHqfWzIGt4qZrpSjRVCiyWvTVKglfMCxN1rhDk1bzra9slwGmH/Ml2aIi3iY9SNcPrU33pY3
32pZYeR+bx4lxybIXofAkWZ/W7+r9vRZ0r8yTgvgXC5EM7VhfkPGirI2kClMjHMMXeS7mGpCAHYz
W5YRKdVNxCt9a4DrQRxfHX3ogxAkTKXZJGAv4Dg2VP2bOFlIJcxB+dNNMOTEItdsLCpZ4jlpnqUw
NY+MvkgM3incZpOtMsVdQIJEAJ5KIyISlGsO9W0fsb+tQ50TRFpzdraxmDrypeJZRYMPgIXPL59+
jzs3s6PunZgFRP2xOOi6VMTG8xqlFgPKhS+BZMKANlacpFskhNoifb4WlVn/BqDVmrr/zJl7pe7c
XWUnx3eB5az2eCO2VIYxxlVmj82btKvfDL17BODGXSyeXwVm/9yVbjADcioYfuPoPNvfcOuXBPFH
lAIiBjjmOJgXltgPMl6L/nwgLJV4WZm02pV5bY0Br4SRtC0rGYut2MtriYKgd9O3Ta7i3S7rcJRP
GDtl560wBaHBPjVyeu58tPCJ21Aj73aa5RaLmgLan07JpA0lhmz1lsbS/phXb1uezXzkEZf9/662
B4LbhbFpScwCt0eoe2dZQ8aMKdFp5+z4CDOxRY/V9vABvJYEGGaYJmukpk5dyd2fVG1xHlM262W/
pMddFbdesmBI/XyC5kzTWCYRED31G17w4/Pj1E4RPgtwEj8e1IPZiNiz0wMJ26A+k6dhd6/EwPiJ
XoTDih3XpZ+9BQP8kkdlknViY8CK0yIusfXDEdjn5ph4b2AgAfAtAvdCvC0XGINjEpQTS15K5sFW
K+fLgHdEdJQkSyLNmtnMoZZv7e2RNVMzaHLAIcnUN+76hnMwpYA+CEGZnt2Duu+xK8J9Y2GpeRq8
rLL87oZO8mZxTN9oo+HjnTLn1zqwALoGaonthcpF6cXD+jJzn6B7fRPsjoBv9kEM6+p52B+JQlCJ
zmx+lV70p3L1ZrlRXJ+Ifw+g24pABLy/bJzfbzLtbdi2puF3c+DTmcjnkT9JFugQSpGEyvRNNzUB
gZB8wnf/VHiU1oOzJ1byFekfLQLWjPJCBZjpvKDfHDpFaNkiE9Rs69Mh1LnJ2i2G3GWGEDDkYR61
kDEm0N4XQNQ6UCNB5wI55q6DA3+VQuujI/YAHXvTpPItsMdkVpUvgxf6Pz7M6bIMxXO5RgSeFi90
U2xLw8FOI6Mc5zECQq2VAtNI4cQ3n3bpeXv+PCaCsyhut0WiHLUqEaaYs2R11R9xd73UoppCj+FP
HFtMdqMmDz5uM7lijlTPL0dUBdlKigtQNVgqfjp3j+4tKvi4+43iV/6EluSBc37xi1PeeOzE30EG
gmkeq3xDHNWMhHV0e9oi8mgUIy8MI5ZS86sz3RfWnG106ZZIK3Lf10lH0vqZx/qTJn/oD5b7ysai
msnBtjSN/tpDQFsE8WEvdwNL0q20DAslLfjx0vMHTd1gYJO1lK+8gLurzDPxeqm6VqEmPjixtlFw
mZbnbbgfDeaF/5zJr2FV8jpIJoZOKMzSLxN28t2qRaL06x8txRMPR+6Tzkq4XpWIueBx94+dDBvq
W5uurZQPPtZAGmVzcXI9Tk+J+xMH1iCP6ftRf0KOsJ1fEhNo5kI4t/C/Y7cWIFg7hQKM8H52uxzV
XRGuqZhUa7azb7p0kST+kGvZwWk0sw4Rz0jT9lEIlUCbBsolXVlCG8c5jUv383GXjY6BnVYgcpxY
/+lQrHOstk3nMX8yNBFjpfqQBIscrfV93Yc9nLVEcPw8wWxCtfEkL2q7Y3qyHa0V0vL+9nt8cnLO
9AxiFYEA32XqD4X8WTV+54aXh8YdAhHv6DikaMdEHKu/qMR2q5jJDculyy8KkHH6S5Q5ONnl3HXZ
4CX8+BnO90ez/r82NxK7hJ/zXgS97fuT4ZW0R5wGquj/yRi3aM5mykXx2g4ot/OwqyjU2Snt08eg
hZ3snyHW6UJ9XYuvO3XN8ZLNovEzDCLkYzVsSnbBhJBUF9NIQR3lT922rGtpAEeXO5Co7X+gwXQV
sn6JIyOSZ/2Kle6y9CstcVwBsEhdzXphavSz1eLrrd8kBA0JqWEGHhavSGKLBfJ5Bkak/G0sH+n7
/8uqvg/nDyhbYvpUWshY8L4c6NYOTYkQEuXKg8hUJQif6zXK5DznSbkG0kVIhKrS1kJiAR7zfEm5
6hUJ1CczeX7aBxhKU7T+6X1HxLUjdGmvWU50Z4mtiwhHkrSH7Ycb7OCmJh03Fn8c8wxGFFdSZvuc
VCeaYJvF30UGkRDSjmfL5R6uKTTN3lWhnqIJWSzAV+ZBRpI01jfpgymq8RcgP/woVPfO7YCQI8M0
sOwvsYxuH5aKC9p8UpBctTv9pZMJ7fyVuXJh8nFeYbj9iAnYvIiJBv1YnrMRFUj15csWMP0RTvkq
g5Ye7X/OR+sR+4Db9LSZKKerGixtlui4UQ2f0ZSCbFDpf5CQ7C0Ou0+ekVhFhbUXtRLxNHQTT1GY
bvN7andWUxCa+pxPvR+vvZo36iCeY7dcG0Sl7laNGxFBQuSNJedmBPwvJceV3Gv1TWx1e88zhEiv
UDT8ZHmFCbThjtKNkN3BNGJU/4DrLtF53sP1SnkWuLS93jqVaiZQ7RGT3LrcF/UoZ3f17O7CFXY6
Dd+DN/7mWJtPWK2chFctHPE6RrKVhF8jIa9VBvWA0tnTit/5/gs5ZWS5NPcOypKlRgiQUM8ioeAd
1Pi0yziCWJoviT/l5zeiT08heyUZMuv3B4/8j57gZ6yLoTnLXA7IJiKwa88i6aGGFCksEn8Y72iE
A0SUJzRu21zOEg2C6R5Yo9m1GxXE86p0yapENx02LRMZyr3GqczKRuIDZKa1969wxxXcfQhm21xN
n/V44SforM6sNLNbMUmbHD0XlZdV5UGWTx3hjVZdutK4G/bmnoLeh9tVFyYIa83YbhpMlzI96tdj
TiqMZfGTJWC7SkQ/6mVkOwggqZKGH/c7yXKMnNF3Er0wT64+gVydk9S6rIRAChdLHhnu6GjgPOhE
FT2696h0kHyIY3E0bmqTgM6BJNXHKBuEveWl5LVlQUysrnzAmk0ZqGhZd7NxISK3m1op+/KQ9TtA
TKKwX29zhXJ3tsVVyI9taGcVt7i3I8PjFrhkpWv/HlrvSCwqLWCgqhqLY7M7itwATP4scQJDAaQc
t+zPbi7FHHDhP9MtrWRmVp2VeGRzqfYy1SZy2Zrn7c+dbA80Sh9z0zpPH9Y9xL1Hdt1vZuDFtTVj
ZRLl8cOXKqvlcL+KZ6sx+oDiwzhAwig5Vfr5+Jdg4VaplFML5bZ7cuQNDJ7Khz0DjH0t5F2c/z8m
7KuWfTNOinU3w/L2s66mMD0pjjeKi+YdePuh81cRKT/Yy+G+9wq1EdChKqMdRMHjOnnck5jOvC+6
MvWCU6LFr7L+X9cmnrYW78G++Npl+c2XYBg5FvkbGAcVBfHe+79ouOaTozs8mBeAP+stqtViXH1v
Lxmqp0+2QoyrD+H3Hh9WG/7mI3E59Y1+zdRn38aDZwcKTUAT+qy7L4Xnw4Cts+aWILtFW3xLpEUH
mBCG/LftKeQfN8s1m6tG6d95IKSLknBspcfVY1k/Utzi+FOJlo8G3i+Fzwqzip6oJjidgkGGPLDF
yD75A0FypIiyAXCvkDTYSveMFBT/zq7mnUb4RgW97T/u34bsqSfYKMh4dLuT6LRWqOMRPEBcnk5G
aFRMV7o5dPBht7d6oOQp8lbxv+FtseNIV3zUmi2rxgYWuD74rJvwHW3U3sGNS44cnIpYhxUAl3dM
T9bJixrRrKuXHtYyCTmO40Ca9RCLAejoEtxzqgndypj3li27yTEe8h3idIEqTewUUgWtd1vDYRaO
RT2bww926/hhQDrNHzdEbNDHVlawux4+4UQFpPzjZvd1pQb84Vn8t1XrNt9p0q8DWJLSDIP7wssJ
vsZbaAb9C9S9EWILiYsz1qzUY7WHlFoyA5zVPnv3RWTIak7ELlJFE4aMZHzJkp63wnSSmdMLtZ58
xup4qn67bpj9u5+TCXI79RrU6EzF7I2F1STeVcLoviV+fP1dp+z7AKb/pTDaMnMo6FNcsIc55FYl
DSyCjcMbUv2dndEnEardnpM/9CMH1zc1aOdE+943fncRd4aWlcdxT7sOHkwg7QTjoOM5hvw54x4j
KUEkQW0pLu5P81JiwL93c29JmLh5M+0XGTPKcgj8olxIaYiL+c/CzMATXhUdpjNo/o7NUc81a6UN
kBrOtppqnazaPgaHpkodOCTXmSXpjIhNp32Iyu23JXo48S8R+WAb2Fay8BemNNdXj0HmwJ1hYmmB
7F0kA7c8xG29PCpMFI2iI7W+pvpkSRny5NSNbWRd9hBqDHuPUDDE6fjKz9FLJh/1l8iEtxnseTRL
k6OeY9gcyHO6zlmFGh6ZCwGiH4E1ogYLFwrQ8W3BQ5LwJJ09XuWXYvRKElOoB2HJQoOUzpdbQen8
0gsD+L3hEgeYApfKrYFP4z4RK8iSSk0P2uYwMRmzw3grpxt8GukP1maAzxKJX7k+MSEBUXEW0hGz
3nJALpKU/6iiJUQEjCUc5decpN+S6d6Z0gL/f4Cq8fltCwcUh1ASu4Qoi3qrDqJw0DqnKhWJUeI9
hvow8CiVjE5Hncx9mh69PvuOjU4/tCgGGMDL5WQ429QJXerwydFjXisBvhLbIc4NfruwDVUrN1FR
3pBBBfOEZocz4vQH5xjukemnbmxvwB5S/OaOTDcAIcJP6cKsz4JHSsSZiyIRn1yvU++QS7mv+KPy
zu9nG3fKdOJrnlmNRFGKRLjlCuX2YMVc6l+dwpyeNpTDu5yAHiABH9Ex2XiEJUqLW5LIPmoMjtsM
AzwBykyHdpXn+z63b4IYiv1JqcBkhnUn3QFKrb0l4DcY48vkeF4JdIRSyph/neytGQzAPkvPiYJj
UX9yXSgRtQITFPPw2HwNo/gHMe2FUYn/qmuyetg6PjsnftTXdpFZOICfyYPCFhD6PEeRY0Wbrm9L
lL2Tr8Mv87sWDGQsZldr28bfTqpA0BrZKjFEA2g4CRdiRn5fFClWuvUDHBqQ3qBiGo8tqhIf6WL8
XlmTE1I+rZcHwhhMfhJ/RAXUExCP2bBGaWZH0zAakYdSZSGA7wp43cuhGhCKUNRRjdv9lCzpc08D
DoWWQoaffkgvKFSIkcb22zOb9GoUPsf1KNIIPge98kRmp3JnAg/30bIfdj1AHWJlVXLPhLU3XMRp
NshAmlBTVrBRkvgm88VLq/xmo5zpAvIDTEjfRGxKkNcUl+/EMYvDU+HepMtd8IAbzc0xEDMHniNE
vX/Tcnyaamc7PCJXj7og73oINUqldLDPrtG3EZz+ZFxTi6ktawSnz0PKSvRjfCev+H2p8CwfZTNz
HCzAoaWbgU5WCiZ01DVA6/6X5pTydkFu/AUlS6e0HxHuQrtDKVv02/A2+9upnimaK/HNZm2ANIIc
pzdK1JAXVGI6f9nNa1PeBxJJDWqY5jHIWMFykpwoO5F1v6prUTsojIMphX1AIyjbj0EWcDy9MHXX
TpUDDBkErKwUnKuJ+NHr7Sk4gK2GfEW3V91dDfJb8Sx0g+Emm/Is0B02Kii2dZVVq/KMPS2GbZI8
Hfmbgm3Vo7Sgx4+0uvah5F2jq/wjgpmraXK+qVaZ1oh0TioIIvX+vCeam8kTLRtjyQNyqXeaQ8hq
EqWhJjxNgmWauQHiFMXg2GOqtuPeeNvDP8PuPDhumMlRffQ+0hXjKIBBRs1XqCrDvj5KI2x3tuuG
C6KGsLyM8hD3Ntn0e5r/VaXKh7GVuJd26AnjAn0uYfPni4eR4IFLxkpy8jRYZnw9qlSqnlw0ScyX
rSy1CJM0kYJFBIejpTdWI6LiWV83t3zvRYchFVa1BOIwr2rAj50Rg+3PoGSGeL3Ni28gxIR7ieT+
h4KBemYMW61DK6FwOtC2Ty0EhpCGHy9l3k1s38cPq0lhmQqmXLt0iROHVip0oOe424+ZH3uk/uvd
WQFPsxvpkh4xKN57bN55EellCHCIhKNrwt1CCnKFo3qbRcsPomhm1mToIdIyd4vJv+WP2moVo0kv
I9cqItaIptBOTeM42UkbsWes9+iEcOktRDd5/JDYDPcwD1K4Ajv/Q/b00swHYHIMFidTi2DVmuZI
upTtaazZ5CnF8qQcf6a7Ka99fHMtZJNEmF1VTvMkxctRJvTY1K0F5ixPabI80V43o9PAcLs0xmrE
zUekr6kr5DQVGz4RfaWjlCIKY6jGcAwIFUw8XKvgOKEAPQC+AZzf37dCOqVFaIA8T4OW5Tb+DC4/
1qokEm3T+VPyVSZNASCiy2P8YeGbODB7AzLDxyVHmxEiluY0bwO7hOSy6bw22QPhLqizkiRt9GJ4
FbPsOGbA9hR0K3tdTZ6Qh0VFOjmgyvz/AhPHiIqCjqXFtM+Ml1e9SN1AjYD3ZtpDjI3/UqbkCteS
yDwb/E+xKjCWoMYyUWCmHfNw9OwYHisdrSFie3nIGPICW8cXxC/JYanIWAFxDkhEuaB2YfkxI82T
9dTJB/24MvQrdfUD5qAS4HyS+Z0Lx4fPutJ/pRATPD5vcpJk0B58vXHwttpc442Qv2PwS4yDnLGA
JHr55aZ67iXqt9kLAurC7urL0nescJpBu90GDJbk8SibWriyXNI2YUFt5EcCqQTfi5CtMIapHfGE
SFcyETxPaVHMRjYQjKEYIMeLnVbc/FCqzA6J+yIWav/I1TArbRolfjYT8ZaDb+uAb05NhqTBNEDc
xTkhDZjEkFO+o2u4p1z65SgqhNvO5man29J3YuSrZFsvQXssgKqEI+k2ikYFndCJhFgmn7IOQ/Qd
4mT3O7Qmcpok9ZqZYDZloWKJ2OetYmXjKGdNxhXbev8A+dAriK8WolafUDEj/ojv1skxLGzyRfiD
QhpXQ3xFLrddZ1RCI46z1ZBna8irxCLYIdnOII/SjhVDvnuxRB4um2wUEjyeIpCy/7nHCMcQz0/B
l1GI1ZjlsRaC98PUhXIHtNbG5xFHh3O9VAPSPlFTlIJajduguIRcpEsqjkOBmrKPt55LcKxmKZXV
s+t0l+E22mJMgUrVs3Fff31dNaXcFKHKtO8nbB0vPSE6PByX7LPIYKNRracSqc3gEz21W2QxTdp0
kpjpGm7pHvKctJk8+LamIw10aQj0yZ+tm5RX3I6fuwBMJ0LGDZ0aK+CYkXU1BQXnrksqtx+2rEAQ
6tgYxl1gKwc8QINZifW2PP3XTNDhc9lpYkwLEsIuNrzcmHFTEyMV0F4sUfbR/sjOjCMNnk058TtS
CNkyOIb6rzL2+n6qNEIoZGz9ro/AEORIx5/SLxomXRZnoSSoWEh2nwYlebtXWOd1wZbBL/6X6oxy
QLmIpm7WaAljXc5ghNd2V1sydOTJjnWVzD5vLvgjXpOOPoSoX/JLHNfuDF8pBtBqDWSy6fJQCzvf
FO/BRNbb5XKNPD+O8N8Zucg7T5YOoPIgWNYMgxHsYkRzSOD69octNSUV6Se4dMqqEpoH5P9RwpV8
xpg1Qocjp7jUCI1buM3aV39gu90e+cPotMJqmw4CSBuiiv9sFgoAPd03ANoQeXLDdasWZXRdir8I
bxLfY+tUqYbKBaScuwat1kh12gNHP91Uc4Rv85Jpt1HrrNgcdrCFzxP360KKYaw/gA9p0c6TKF6E
AkS9miAhHYs6P7Mkdi7xQ95Pc/GbFhqpk2uGSvya6FJzySlVtKpFKFlkZ2w7gzJMnVkEmpcHrMvU
lWw1HERUY2rLbQlKMWc/eEM0rcNpTk8Rl6noY6lwRrF4s1uStFsPBSmFOaR4AIma+m3R4lCHcCcR
BuIlOObF1wFEHoPWdtl/XV/cMHCskFJlk3aYDGO3ure9mHAQ404cIr8m7xzKKr5E/oFc2PGsY0u6
Kga20LXJx5dEw4cQvTAXAQonQ1/CoeuKp7KfUx2M0uQYYFAlA2+4m/hVIc8FfdCJNa3C/ucF0xPh
Gm4lzleBbaJJsAHMELjyesuwZLKUJc7Wbi4WCbfv9uoKn15wqgo5YHi4AeOsYZtmEEXPa/ebQ9/w
/M5r8glPPzn/bPm37Cs3lDU6sNaXT2i2HmUFvCyzhRAPP8nnuYX7eh818sttR70pbrML6mQer0qW
ywbRuMS2eP0kWpQABd3ZYchlaeabzRtUHBmIwRKK0WcerUMca/3Ov1FR+tB5q0IdbN6U4Lxz0sIK
mUrbHecC4J5xTP/xP3lAXQTJ4BhVNzndb4Y0GhbTsyoFybfzsmCR5p4rxI6i1GmPBbN5Dyo7PUDU
vgTPdHXejvSNLrSpezf5KwkvAjU+CujYqPKr6tYtelWcHx/Xl12EPhJDhJqj2km+VD10bpG5Y88O
kjuSubyfcn6VF6y4TvvAyd2L7l4RnDWnqC+GvDRV+978yHRhzC0g7AmEhSUJHEr7ZJNvUbucqAX8
dgkaJl8EAuTisk8x2diR7FYGqHe7taYx1CMqCHX3PHP2XwVq10o1O17Hwgp39G+GjwNF3OHTrRfl
mSK9UG5zVaE+Wu590tKP8+O9kshV/IvXtaphwXG3pDdrnz3ZBD0ipto6vxw0rMH62gGO/jdQyN9L
a4GRVyFK1brNNqDHA+A4ofrlySDdE0zJZDWhwaPzfyC+ulHSI9G7gkrSPyHmq1Tt9iP0B8Oo2lcY
NKEIwLx91GELns06RG6ScK3f1DkB+qSZxWCHuOjOJAPQIHW8p/2n+rkuVBHZbcOOPf2if5wl1B6j
JfWBwaS6WP5cKmcCwrPdBX7lW1E52EyjSO7zE/1eKpgGElXNFcjvsLVVQXL54wVv7khToV1YZzjs
QlqWVRjswUyodouAHTcUw145JM83E6d+rduJ2bUKv6/Dr0DfREqpDQdq8Kezd/0wA5+3zqNERQ8B
h4agiJpjO8o0WiLNlyWUMBbewv1j/wHWWAQp6wjCpQVefKhbF45TEVoJvTpL/wnS1y5SFl0rpEnZ
AqoKqiB1ViLA086vNYExBewgefO1a6cWs/FmOLhLYR+W2AsLFW/++dePWfQfRU7kQvVnJi5k+/da
xixb4fai48VcYtpqqiOQjGr5JnQaNctm0kTx+VqnMfQxfbRizzeDPxN0uTb1NJb7rI1yhthk5Lb3
Beu5EbEp+bXE7f+OJjz73aXXLyAFWhaLTYPG04FX7LQRP8Om0w7n07Ii1V7QgZbgJ0isl/RIumIF
oaIup+wIO3LMOPzn1g6eiLchzFJ8dmRbvwoFcBOg4wZnDN+dA9HcZRCfImf5LYB8aRZ8pKOVmRBP
3o7AX8nSOeSFTa9FS5ltoNpmio9zaFhnWp5PA2qk/acohnyggVVJJD3E6mpnXbprB0BErQhBsMGF
unLLntzIBV3R6qi7o5iqG4lktrxL1UNRO9O4HK0PgOQkKB2NalaynhB7Kyf/DBKdMTbnTFnkLXWP
yQVHD3yzZJwEAEw4KtfivNNQAflik2mmar+NhAAAReDQG32Qw2xTT6adROZt7+/niwVSj+Ntpp0c
DXo86sWNXfeVqOX5hjWCiduR0+sPGhlbvEo46bjMNAY61xMhco7t8nAsGRczsWmoxSInpbhld1Vj
KpowATg7HwKSkoxOFtckR/07N3s6NMAPaBCMwa0diA9sDLL13QNFd8zmbYVlkQWwAH4D3wb1DhGE
esRoxVgrZfDbWV5OS94Xm//bX3FJbemUEoWrVaxtIfkKGkmeu5U545vcd1x2kRLIZw+4ubRouq+A
7vfJQzjoaEEJWrln9JBHQHcOyxThdNDR15lp8B4ugamLLglzwNAnLlFSudfJyFu99E2005xRg90g
t9rdArytOKWlqKJmkU4tPgwDS9ScjmaJbEcbn+rramSM6QUuisooF6Xo6UZ+EnydLcNA9ET0q+98
Hvm6NwxEHHk0zNmCMPyoG4eNjSeVZpA2pZHmI/YUgzHQgGl0VgLFtngFdPbLgpVHu+Ea3DoxjKSz
e90MaWWQeCk56p+Ovjp4eq/idRuQviqPgLi07x+tJzT9PAzmEI7TR+9YmlPQHqMRpQb+O88qZJa5
lDzHRLvTHoq/hnArB1VwITGQGpOcTwVuz+S9aucbVt4ElWBG/wJr6jA+Uo1wwuJpV4A6bPlnCJ/w
A8gMPYuiJJCxATsImgTHKULseSa3uA7HpjtVHkPBBHmWWM9KWC8rEuBjkR5j1PaYF0BDIhB3a9bt
WzFQa36m5Wyl47AImLP6dAC7xSSYxUMcJ+9IzM9uTE6BStmsgDhdFhQdva4lAJd5g63ZaT9RxkYh
9VA4ozeca7kkN84wb8lQzTHJS6aYkrbJnOTdoWijQ3QSNvwS38Rpe0u8ye9i87KcjfON4cLiGrOb
aHDfxAusLNR9g9cpelfOXDHlwSeGLADPy5+7L7svchsrYHC7smdqhk08wza8kl52Q3GpQ0d0UOUy
jgQe839EgdpVGw/xvu8IhkHbedJGGiR5ZwL66UEl/E2y7swxufMCsTKYIyvuwC4ngjZJ0NEjm9bW
tYfI6zUo/0PrVfuKJewQqpSHGkzUyH8kaky5BvrwsA4PlSCCww7lv2b1PPRbhRWwRGEO5O6CVmiy
aCiqkgexQIH3XZV/rmElrTwpmqc2/RKOB0t28iRPuTRaUKibYHbFOGgNU2r/VnMgKvooKKSMinmF
JoOooGMrEASvE3oqhBrSfnMnZRHzUh6C8Lv1PJ5Bmlg7zUknZFC0yHxOctwoqUORpIyvSqrp/Lr6
0XzBqRrHySWVTs7hQfC1jpD99Mf8gUYjlv7YzbaK6GVr2NWpVOlWJ595Anv0GvdlPa7edrTVH6dw
mAiXqPGdGkRRpxmXKqXArpziwll95M/zF1cgyt41WRWCMJWN0ZW52hj3uIcyeByz8SjnK4efDobI
6cB7/HrSQBLJGC7sStZu0Ntl+S0IMY9TqAbcqkBs7TmmOMYFZV/JHJt1phXaqvj9p4qWrnEpJmaK
Mu/Mc+dLndNDEUxPmViftpY0u2jBc7QTrkYxPLyE8rdKcVsmJgqLN12BUR84fvRwbO3qlvy7rHHY
uJ7gDJOzxDrmnVUxeGswTydMQTV1e3pLbZNGZTzUZsen3uqWKP5KTSqhRB9mHissoqFwqq1On91O
FrF6SSCuPjaF5Ef77iIzPJR7kq8hoa7S8XBAwp3pSqE/tXyfcBHlKZDWwTSc2iCM/cgVoCMaHCHs
tgpF2xGRxTaQC9NCw3BC+MkQcwk5TEufityNjdHlMPsvEvBNPOQIMeL8vM3uEQWZoy+ynJ82gzqt
6dDoH28gjjRPiciBe/sXUwcExZKCZEYaxBxEj2eJISe9PEyxPrt5R4GrBccqwTUXmz3jjwj+LGQ9
aWx8pn2pdc29AUWGa8oNKLcPQNl4VD0CKKcu+P+ae8U4am6cwECPi+icWodiDWad149dKty1dvIA
rzCE2DmtuXViN7mDSz8GIbh96+AQeDx2RnYNkUODwiL8P8eWEO0+uKz2dg1KbEwLoSe2/tqf/zvx
JJQWUbxMofJlG5XCXfesj1RbKe5RbNZsJt9xZsJqGZwC0SMfSuWujeU+vbxc2xwGLTxBmzCzyMel
sKLizKbVrs18lcWTwIMetHfhXxKZRPtJCucsp4OLiQLd3voyyNvVzxVDgmcKmJhMKBPoK3XPF946
sIeTN+h93+zAZfnUuic/qlGDYYylwyq5HhWHI0kNiZ3nPtvRrDZGN3sreSO3ZvN7cNIoqgko/Igr
aRYah+J1tASPyqRIkVnyzWpQu/eE5LAT4bBwdNvguCmOzlJOhbZhqc470TCei8x4hc2+Lsw+K4LV
02YHywAS9bAoN961vGgmulD5MgUUFiANeNoqiSn8pGcftCf2i8B2H7+Ld7yMvcFX5JqyGUWvLOLi
ebDx9fJ0MW5lLcR4ncoc3Y6b7IG+oly+oAQNzWcf6TrIl/JaXF6CVP/TR1Q3XibAMjhBtBSFMHJ5
R5zQICEv4Uc1iECOVkjjBcpjc7wV0Mshzm0yUmCG6ZWHJ1Ic/bagJFIZlD23+ayou4hGx2pR8k7B
EKlrCTgD9Bsw2p0LJQrA1MFC66Y86+4ynke6QgLVDv7qsEk95xj+2BB3jjbEc4OGF2fCuyAA/S81
/5kJS3TG0VHPu3Nr9CeziOXMQvY6TX+G+kFtguzElEFrerfSHPXpbtwg3KeQmvM9NwWNaH15OKew
RC6qRG4UJQQvbNeh0+jgsGzLFHTizd9soPpOvWiDJuQYrug1eHi/dHC+RPiyydtLxif3nd5xo7Py
npD4B9jTqIlzeqW3GvlZ+n4Vcsg7NXzmuitxAmqzOZ/9fK8JpSnqqVTO7ODzON/61hCoW10tnKq5
P79DpS1PZAl0sTS8cCLDYd4RyRoEt3SRnCUBX5BoH1IQKHBIiu3nweBWB3Kq4vWqJHTFpnCM8xUX
KRajB5tOLn0NmiI3QqK7y75p2RNlbOoRI96NaVvSf538moL2qIAp5zGavHYV9gFyBzrTqusiNLLa
CrGZ4zwRxTbrRupWrBakmojhXBla1azfIsdH3r8ECBAfXUoOvdjVXWq1G9vzBWkIDH8W/0FxCv+B
1KiGQ0MYcc9g52X3JgXcPb+O5mILwzzRsTwQknySFxz/+XIcQ1oEtlDrBtvLtSsIFbH6pbyt5s/G
y6slY9yveDdEDpbhGTrdBuACY4Ro2wJh8RLCpDf/IO6JWaW1zXBTPoAvsGcM44nXatSzUe0UPL/X
ywkWyMM9DCmjHhKwuJXSBQPzbv97dK8lRrxvKpzkTcY+CEa8zGbm05JUjnkEoRkb1nOUKXWmfkTY
31tmdDZoR0LMqa+xP30OShsDfTaH8MB/S9SeqYlmpm9RXVEP7yXNLUhQlrAxq5pkXuDQQ1QveiCN
EA2F5VTU3p7Z0++jVC3foWksRoIGRtreLWBwgs4ET2QZIis9x/8mKA4tjO/CHZI6sCyv5k5SVc/2
8GXCfEa99xnni6q9gssGFOkc3XOBjlhxCqlrRepJAb+jpqcHYjEjzGsRs9x4xwF6pZ3kpcS9wD60
4wWP9/Ks6ARrclf2QazbYTYilYuiXTqNLdkVauNMCAXJo0H9c34pjh6P2S5ZYGh10JSvveTW4ltW
R1yW/bdAKGpyABx43qj48M/U8mWFMtdZnYqiiDNCGWvyLG2WY7ofMrdZsfmDqRzX54+RQISYauSH
ec3zmAp1W96HcJ//tOkclq9wIGtXIsXXWiHOQrjuzJzGJ+LNmnjtXkzYOThO1giS40u3/DRhWybR
wS4ugJV1+2TejRMGpIK0fgcSgnDQ2IAaAlFBBBDHt/cwhs6lAQfwC8EEBvFsjB4JBCA6mYqL7J+U
HCGQnAIHk0XkU6QN+7wjNoP2fReWfoTuFOM2yyx5XJhQW/GLMOdNuIbQob3vPe2Y8jA9eU6YokJO
kFdGVNRGvFXhTazFjOLGKotelX/XXwcz6yB9Wm30MPCL0Xrj+0F3XR2XWUuKpKU9gDbcz5NjFtO2
KbFdsWpHEADMHDFVSm6+ot1jfJ39ZKu57jxkrNR2dL+ZGbRii2wsYJJl0wxZ3eBc7aWRbaeQdX5J
oYrnaImeblBDBwYhCwa52B+TTVnLsIXvurh0hWNuvRVOIYVC8bv8o3i0Sk8lZ3hjqnqBo6GDn03V
C13s+gJQ1ciqEB6X0AXDwVVMo0DacRgHn7nKygemAJVEr3QnyZw+KGQY9lyeu4RhhudUuL/nA4vi
jCRXjRJfrogW6fn2irVPlAhMQuHe7RvttWY4GyF87DC3iVeGBSQomk5R0azfIogO5Q2ZkUW6ViS/
TkqbpVmbAAdSeeXdIwNFFsjtsISeaBcqONop61cYt1vZBtcTu64cRM7n7X8OxPnnn6UJLxXpM3J0
r4YADxHdSh6SfthWifRlwmJHzLsNOORemzERnJxG1W7sTdo7Yidpyva/Corvlu8K8ASAe3/6vUUL
gbe7enr93PQHG0QX+Ady3gcoOtVaSit6gKvBva9t84HbuUTBSPbC88T3+qEBi64Vc7ef7IbFhX1O
D+ZUnYNp2jM3mDkTGPERkvQqoc191s9Um4rMasKcP2NAn0DHwYWdFObvTaBYJVSZArZPKJ2u/kDE
ADTHtraBJShB0F31Uz4c3qHGtRb5mkKMJv2Ye/nS7SWqjBEjEH/IFA3YQJ7nK7GlveRU5+Bnps3K
jYqrZiPW339t6EyTeWWKLPzrt4ROuRhvkU9yu/ZRhmi9Mmw4afzWGPZ0e72zuWY42Yufaef4OoOJ
RWElOK3e6a7TlQZzlusLWdeidLNp2lb73aTPErXgX8kueEcHuwSyjloqpLaEd6WfF6KuggTaHYau
GqXly9JSmh2hayG/AWDCWH7GTJHy13vOv/DOnL8ttlslwLHHsrIa2PBrp+rVfWt5+yRRce5iY3ou
rl9VdgJZhQJnzsWZBZ4x2G7aCkjnuKBTSpEuKFRWY4MNSEIa3N+iR2eRaKxeAyMyqQSBQ5KKh/Za
wR48aWGIGbmm7qs2vdq2ezFt8zyVS19O3Z1P2tD3exq0vhtgU8fpVyzTcRWWg0U7sk1oylGbUOTV
prGZ0bIYJuoscdK7Z7AyYIVsPUqHY0ZS95RM1ZKo1/LSszinJl+TQ/VIrpG4/OAUPVHXDspM7g2x
Aa3PGhlSpGsI4yzriNMQLcDFigK2wJT36BWhxhSru/OtKBL9rmRygfEq2V4z6o87u7oP6atDUX8+
QiHCE47B6T7YcawlwEIWI65Muuy0w9IW79GlWf2XFjwhl1a84jbE7tjY8GGQd3PEb+r4kePFhQNn
7V3Oqm5sSbUNv6x4n8gCpHp8C8gS1KfsHcPP0CPy6qd3+R+9k1tdvcFKMdTkZ4P+QD6Kh1kQ1wE7
HhPFN09FU4F+Q0uqrANRGL5gS0QAfBe6O2huW8kPSq+0dDrPXCSMekRYT/Ru+2i73zQvgbcYfzfc
cuXWcIg8NHlNAmbwLK2hVRdgVbpCoaHs9BlV8m49O52piL/9KgRSEUMr1XP7hzVXyZO9qwJbNAc+
Ya1a9jIryIlF+C70KSmIDn7NwjFk8Yl6oNi8yWtN2alIZ5iEcvbIrs9cZWe4wGiXl32h/ZA+DNcS
PPTfirIsIizPo73P1pg9p82jHEhhXTfYH5YOeKeoWuYBadpVxhmlolmjeK8HXghSeIevWBUiunmX
qtsY0lFosGgB6yaL3Mdrbv1lkBnDhQlEjFzaSoYO1NP5txzZci/3NEGvl5Ritr413HSNfNmRlyHy
0ArifiQHdiSAqSAULp4fV3WmQWzGoZ2PMU5PTBZG2kaIa984WjoULDSStgS5tlkgGYzE5JdEqLRi
tjK7N+Sl7PvxXDhzQjlSrVffyfkSzqvDfIPzq+mhw6WReya1BsV+K6aTW+U7zCbZcNz4dKdonpr6
55KZ2dOfKNcfiqtFMqNQSwQGaWUTZT+iYqLBGUg5kF/foUQjcUNOodfAxBUHiJZQruwY1w1JfaBs
Rq5WLHPK2P8hRr4QnTPnG9ue6A2WI7smM8GcIlsCXKiorE+LsV8Rf2CGxtUqCddgq/pYB6cVyuL9
c+ZHgfFGQH/MdxBmcelYcZRB9a2wddPcsGPBbcLBQ65hZIb9XzHgnXrP+DuGncuAB24XCYwcmDbg
AporqCM38BDj9kZVZmcTLg9bDhuO6c1pBBzqKKAY35ONbm/pGfJk296fHFBxh+KN/uza/ynq/JLl
iTeVnwwbpMBwJtjz3iXA2Jzpb4770HgL4MHsXoRI+mIiOtRG1c0gQ42fsDDdhSi4IjhceOIHFEL6
zFoI89Jo3k4lIYTYgRNC0eFmqofmPuazOJToxu8YS1dT/S80gSWByHbKPGrdmpMpsIw49PlnOVN5
7fB6PXOHgF4esXKJlzMLK6IlZC2nGYRKDrEIk3Frgln3W9HEKcR4y2/F1eu9uJsPC8bPJGERG0K0
Dq0kz9mfLpDSspY6r4XxO4nEH6IUpCnYpsqBywGOjl2TBZzD4yMhuO1tZrbPyv6YK3ZIEE0VgSlf
hCx91LGOyZy1FNhkqhKpJ40Et+lW7RvejywxmqzwuTw4RHsQ8HrHeN0XYWF40ec7kz5uPx92NsLH
AIU3TnPpFckKUHJaNsZ3yHDgxyrhEb7ESIYfQ8jaMO7GyvjVnIto0o6UclB17COWlTUGMF9Cmhms
eT1erjf7eQFiCTIbTAFegKIH9ddK6AwWWojIZMwkMYxAmiMBjC4XEKxl/6t3SWYzBzv2j/Graudn
WBXnf8lNrUyyGQA+7jw6Mu0M4xH6pvczvJ2Q5MYDQNqsRE70vBc/3u85gPYCojVmSWGUS2nbdyVU
9tVuJRPl/zFGdTzSOjE5NhQHkzPu1etat9AFwiE0rPA+oM1cUEiOP8wrKoqbXalc9+LFY+4H/rf/
qjQmpY4X7BFFu5WL8feQ4gXVMI7ywLvod5OVcwBjZvSkyzsiWOiLBOQpSn3tB8GydEiBx7WqCpbf
5iqreC/HHB+cztnmZT2zUcUp4EVqpr976BpSZq4TmMraB1DBkeOM2hAljiykxqCDGrSiU99d9WLZ
TUO09dOTerEhRQQ/R7u1TanQKl9HNfzw6g7yJwdXrBq8489HE0B4Dn75nIWfF2RO2lLBD5CXyfwi
i3LD+eDpowlSatrMDPxpHlEi+rUXarr0s/FE9XJg6W1UL7+KUbh6YiWbXTniiiUEjEDGLeI8uSwc
H4b6jDtv8ooGWNzHUAYbqgIBPGHTTpA8kAE927gw7K1HHeQuenxoPGXSbOCNJouYta8Q/+VUqKdD
5cGxZp9HyTr0ShR6j8Gz3cpkXO1i441UTv7dr/cfxTvRuGyvcx/cK8eAR2iH/2T0aZzUlgmFpSFn
X9MHubYg/RTt6R22s1T9C07b12+7UVWpGF37oo2PtOVkQ5ENmwv0Yd4LSP5oaSbA2tMu1JYJJxIh
rAW87tbpEK94ZIO5R8HEsx/RE+eCtDZWsFTc4qB/RJfm33ArpKUMnoKqTYEeCsbrc78Y9frmWcQv
AaQKQWeU/jZkqzGr4jmW1DFaIBAJ0w8aO3OE7HJxqcHSFU/HoI2sZV+erkWlNPVdD0J+fCxzLFO7
RrHusyxI3scIdfkZzx0v0zUfA8UyduOtXRschJtTvIWlPP4px1iyw3doAjIaos+vafFJ9t/Y/QoQ
WH1Lw/SQpshu8cS7T3Rh6Xbk1+cbeDvNzVs+Z0+Vq+OlOiGO+KfcxONgMNZovVdPvoXyZythokJj
WKe30/izB0/AhWhg0gqx3va+bpdbcrES5WVAEZ04pHO9G1Mz9XfFPATTC+UwMf8TprrGpHfQO79m
QOhcDi4AB9n1VlnhGxcmMjViLnk8VnE1S3zPF0UAbUvzJMzzKuXBYPjDnbRM9LBUYVGCH4gt54n7
ph3xmlS/Q74CcZM+BQgtO5pQ15dZlGLY4fkT09NDhhYpOBMDlnhzKXn/fGT7RktbA2ChH1WHCVPh
e+eDEW/gg5b1XYUfZELB7aHmZNSOMxYE7hGvgU/pL+CdA82ASJnwFDI90XRkoiD7iXUM6ZbGLkzo
N8JWcPWIgw6vbUop+MtPRMujyGAbdS/i4Ekp4ocrAaZmEbdBZTjXh82GEPa3JR961jaB2UTuROwj
KpGwFwHSJR/QidrZ1o4z1OTclsc5Qb8BTTz9XCVwETojb7/o499xLb+hw4zhEzdxyKs+djeZC7cY
ZzkgSV4/vtQ3AyEWG6ubdF9HS21YdlWKlvrIC4LVrzShAqaSTfIx2ldexMkNVCDNq4WEgt4dECiP
d1QbV+f4EHhldRFYMPwhs0L1qcn2bdPz1lMEu7ScCYqNono+fcvNGb08BLlImDduCm8x2WGtEfAE
EhJj09KcIXg72Fk9iCuwn33PdfUgi/gYPEEpUZnDJ9jzH7MRMTWLvEitArNghxfGhkYMql+pWdvF
jlbGh+V5ccDE+y76mC3JHFU553KSuAI+NZfKmrYm4ve6HNJWETqbmuLOHnvReMuWMLE5Dk6MAIG+
dt5RRpakj9w3SZSz6fLC7+Rpg7lb7yE3nMTs2puMlfYVTfKN9jQ4XYndYS+HayxkWso87pPbtGAF
P8tJ2afo2RoZxl4ICi147IYlqgZDTiTL2vFvE+9FnKYYp5hJY9aXSacQEy4DA1ZV9hHanPWBEP1e
HedZ06q31vkIni6A21B6nviUtXqu18DILiHn1XfZFp7fBfPcDBlM4Uyjml9d6QXNpZ8gJyYp9jSo
ImMNMlKrZdibcOwlptXY0fM8R8tKX+8ktppVLodJ/b1mtn8FZOm+tk+NI9pVg6MsNTDFFkYU9VFP
CaIloJJ0JueZwWGQXqUJ8Husij23GH1dd4RALxiG7IMDe3LVaoVUCZiP1Wc7VknUxJEZh43U/ZZt
fyFuD2I5tCh9DlKI9P/Zp62+Gf2LSFn7ghy3SuL1/f8wtjx1yPFF8wgPzDaJpbTGoaernozibMae
/jUGiqwo7idNmlTaujIJC1BqQs8tGyIkG1JsAEYnXyvcoZxUMDFXM3G5LX1M1VTNwMqBjI/mTM8d
TRpBO6fiylxKnnFVskOIBtKuy8Zlle7a5cAS/+cNR2jsiYL077pF1kUiqGXUzJX6gF0xgL22xR0U
pUq1f+HG+cjGVCj67nrVjHH16ZalJg+HSGKVcKkSDSsIQa1Vmf2OMYWuOUoZwbCAUNgzgJbiSe9F
hBvqXL9bXae2ZB7TX05XR2DWbfPHtNp8Koal0HDIZyA1jkGCdCFc5D12NuBWlcJ/qVpel/6Z+AvF
1iXQK4Y0mVcQLjojuM3yEUGCz8NMUT240igv9ZxCi2qZFQ38P9ue3jqVi4iOtwVgSVJ7AGmlcf/o
4UmeQ5EohhQ1idxps8f9K4HDp3Y9v7qJgoBvjJ66qbb7hjLmI5FBZieZImIrEkM6HgmEGCDiuVxI
4QyMsG8AYpX500IYCn9urYhVrtWBgqASoVAoCgbJl6G6oRdbGqJmnpK9TthcHBmLyfSdxpLY7GAO
FFAVCAXRpxXRR5aq5fzYXm6hAbcmOs/yP8+SCkY4Up9EuFF22eNh2EdwFNjZXIe+K/Z+J6Tmkubm
zT6kEHMzURBozJjIpiZ0u9RiWGAAT+SdfdpUrvScnM/ubBenzHEkoEHjyp+h3VueMtWdf5+ULllV
V2TYlwN9vhn7GFuvO5vxLzhHUNTHiCv18NUwV5S1GCfd27SfQDj3cwB/XHg8KdsoTA0Z4ye7f5im
kd2NWYKY/jKcv3FalvrqpI56cifvEbH7XQd+yGD6e7ZmwugWDKAk1DNs0nzOFywChMVEAvbJXYXT
qLh7piBLrsvfDOYscaI3f7FH5y05TGLa0GOsuwYirqFYMkQeP+D32ZH/809SGoUEAiSoIvApuBAv
wBj3byp3NYjvVJnGtfD1zar+FtgrTOq4SSJZhEUtFwWjUgyQ2+sT+xaDnxwyaaU3ERjuVA4So1qt
igreBEfEkQBCJTtGVRQa7jkwvhRDfUlsWTgYswX9TwkgSrVmF+m1BlljWXxkI3A4TmkKzR8QW1XG
VYQXfIroTV40uxSBZ6v1aKjS2G5z1LlAWrKMenoUeuyFKclBSbBJ8ar5CPacS4Xuz8YeTAgkDFvC
WnNa9TQCh9aGoaJza5BCrHidJ2W2TQ7tSiKpAvogaDKrkQAh19uHQG9D3mT6rhRkQIUvpQS6Ii09
cfxE0+a1Nd49VytRCh9Ng8fRkQihhVki+rKiLBdJZInlK0Sp8BNqC3niWCbAo0x1PizFWGwzxvfu
wkIrdrfSRO48fMceR78bbnT9H7KU6LqMVTp+I0+kchdco68Xo0crDXoBtpeey/LH5sUGk4nhOfsu
cPWeAa06R3w8WoCS16CbmF+p178VZSxti8K5fcdElfr3NXiftHOCMv0cu+N9gikQbtB6B5bXsUZl
3EktT7Kt5ut9vJC7GIi/EIMHoEJnQLN5jCIoL9Zmxe+4aszORZBgsWolzBqtIEzTe36CKXupFmXS
6dl3kfEpKou2uxRW1btZ0xyXfI3zPQcnPs7LA5Z1+w43CgzRlO5eLK3xionNgd3szXpBvRgGziSq
M4xVQWzozAgECVAaJS2rfcTujs0/1lC5iFoZxloKIVxWALi8fZ+2s1IDAyObB714VMK5MSzHYBmz
Svb+Ul0Pz6nagOVG5Y+1m4TuQpsJc7QFiw/scULL8bifHy+IVXovZujP1KCp6u9Tk3Hj2uF5CCG2
ulFlV7WczV1yifrSqjHnfoM3BTuPG8OKmrzRFqZNP/sfX5uNXrgHiRbWHTSlQh4wAhTaWfEoKFg0
juRFEjFOI2ntPL4EO0rbRYP4iaxtS0YkUVKqI1gBUNHQ5MsTSV9SnICx0gS/duW9nF/g91V9n8Fk
IYby2jMDNXF+8LcPNJtAuyAsAC5++W1bue0nXU+T44JhzWxjANtJVkK9eIyn7NhPzv1rQ5rmcxGk
aNuHQN2fjajK8JmokjVsQOkYDxcbZRc07POFGra5awXGW84KLi5uxIZg8idt3Du1AuyGeTT2svKw
uO1lkp6zVw8R6JPnfzTCgYbRadEIVyMrgqaXPrC5nU7wHqxtBLeXoxEIS4KqAyiM5kMH4ZxyE5TZ
bjWJdBahPta49/PVjF7YAJYEFbQdLTboXhgNcJ+A9j6c5SzF35AlastxGUDF6yw0T0gc+hHKvCyJ
3bF6MpzX7EcdyIf7Pn9Yq95pPewV4RE9CvoGKJ9JoDt9kx7IjQb0ea/eF1HXE1o1E4sNgs01vxX/
QDHwqvK4bR7Z9xFu5xbkn62Y0xtecnRtG2QZU9zHBUDIaBc5FbGhI9wVCVOQ9x88sJCvm560c+re
H2bHEQIP/rq8pOjdgYA7OSd6mRmZeyY3tbNdebV09qptTiFUuUyOFLo5xdi76cU+V8U7r/TYormt
xeXu9pwf76exdg/XMkPBwSPteivD18W6TxPLTyRRL924fIyk1Fcqfhf30wbiQPkRgsiRTXokYQ1F
XJsm0ECjumn0T/pM/sUqLqbDSqZ8ObJW0+Fv4CSAngaFjDv7Sv4RjBmQn0tFdc8INlDRjhMPqANE
X9F83AjVuVKOe/7Q1VjVfnsK1DHmbk8j0TfyUaMzHNMeYGekfhIPVovDVW5kJIzd+oRqwoEACR01
mlVUjW99C7X3OB0gcTFyC/I6YD4F2ycpMCtRdYXwZFOcXim39Ffy5cOrH5tYsELDAPtj4c6mxiO+
xK2xePRsID3JLchJLEDqC3grojESBr5C2UnQL7DdM/nrlhvlXCArSf8DHcOT2BsKl9nco3x/7bxk
dzpF/hNOoyW1oVI+f/EF/AsEWipt4UsVuQCopwyBS9fen95qfhQ2Fn7eKRTC+3tlvh1kHvDIv1Qe
HZE7BQ1DJjXr9ME1vBY5TLfsg5VagjiZxugZcpQPdbDNEqAIjWaayirmXewyAMgRMh9AO9WF3qJn
RfHgWX3RO8Jr//kWcatjAPFpePeHuC3clfryNP9RzDYxoR1/AJz1VkCsUHya4Rv+53fFXzKVtjnE
bLl+jLgfJCVeSFvoWWYAG9ymfR6yxgFbw1gsBjhCqQvhRNkaNh7000zPgrwp/oQf6MQnsDl3ci4g
aOnUX34IHLijgDX98UQkTYMElFNezv0PRA4/v4nCYfgPJcLsBPtGqMxAaoGQQfHb5vuFU03Zo5MY
/yah5e8zRAgTB5JoHoYTNElJu9YEqO0=
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

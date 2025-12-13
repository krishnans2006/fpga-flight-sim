// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 14:10:51 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/anike/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/faces_rom_1/faces_rom_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19424)
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

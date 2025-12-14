// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 20:37:07 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/faces_rom_1/faces_rom_sim_netlist.v
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

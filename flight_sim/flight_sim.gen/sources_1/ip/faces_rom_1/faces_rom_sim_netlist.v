// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Dec 14 17:28:13 2025
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

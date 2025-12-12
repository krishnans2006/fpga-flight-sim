// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 11 19:46:33 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/anike/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/faces_rom/faces_rom_sim_netlist.v
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

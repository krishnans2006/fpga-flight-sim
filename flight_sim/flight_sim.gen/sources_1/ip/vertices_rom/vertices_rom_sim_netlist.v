// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 11 19:47:43 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/anike/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/vertices_rom/vertices_rom_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19520)
`pragma protect data_block
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
4/YSOA44SNznZayoZjINCIsddYV4dHv1BPc=
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

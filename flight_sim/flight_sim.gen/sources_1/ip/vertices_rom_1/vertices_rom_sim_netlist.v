// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 11:54:48 2025
// Host        : Aniketh_x86-64 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/anike/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/vertices_rom_1/vertices_rom_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [95:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [95:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [95:0]dina;
  wire [95:0]douta;
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
  wire [95:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [95:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.2646 mW" *) 
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
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "96" *) 
  (* C_READ_WIDTH_B = "96" *) 
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
  (* C_WRITE_WIDTH_A = "96" *) 
  (* C_WRITE_WIDTH_B = "96" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  vertices_rom_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[95:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[95:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 41664)
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

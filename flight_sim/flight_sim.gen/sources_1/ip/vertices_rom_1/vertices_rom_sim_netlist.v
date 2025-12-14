// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 20:36:13 2025
// Host        : Krishnan-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/krishnan/Documents/fpga-flight-sim/flight_sim/flight_sim.gen/sources_1/ip/vertices_rom_1/vertices_rom_sim_netlist.v
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

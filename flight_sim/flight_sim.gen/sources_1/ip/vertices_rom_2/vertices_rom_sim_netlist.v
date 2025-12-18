// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Dec 13 11:54:47 2025
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 41376)
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

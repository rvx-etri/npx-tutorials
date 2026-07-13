// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "dca_matrix_lsu_inst.vh"



module DCA_MATRIX_LSU_CACHE_XMI1P
(
  clk,
  rstnn,
  clear,
  enable,
  busy,

  inst_wvalid,
  inst_wdata,
  inst_wready,
  inst_decode_finish,
  inst_execute_finish,

  cache_flush,

  load_tensor_row_wvalid,
  load_tensor_row_wlast,
  load_tensor_row_wdata,
  load_tensor_row_wready,

  store_tensor_row_rvalid,
  store_tensor_row_rlast,
  store_tensor_row_rready,
  store_tensor_row_rdata,

  slxqdready,
  slxqvalid,
  slxqlast,
  slxqwrite,
  slxqlen,
  slxqsize,
  slxqburst,
  slxqwstrb,
  slxqwdata,
  slxqaddr,
  slxqburden,
  slxydready,
  slxyvalid,
  slxylast,
  slxywreply,
  slxyresp,
  slxyrdata,
  slxyburden
);



parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter BW_LPI_BURDEN = 1;
parameter MATRIX_SIZE_PARA = 4;
parameter TENSOR_PARA = 0;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

localparam  DCA_LPARA_0 = `BW_DCA_MATRIX_LSU_INST;

input wire inst_wvalid;
input wire [DCA_LPARA_0-1:0] inst_wdata;
output wire inst_wready;
output wire inst_decode_finish;
output wire inst_execute_finish;

input wire cache_flush;

`include "dca_tensor_scalar_lpara.vb"
`include "dca_tensor_dim_lpara.vb"

output wire load_tensor_row_wvalid;
output wire load_tensor_row_wlast;
output wire [BW_TENSOR_ROW-1:0] load_tensor_row_wdata;
input wire load_tensor_row_wready;

output wire store_tensor_row_rvalid;
output wire store_tensor_row_rlast;
input wire store_tensor_row_rready;
input wire [BW_TENSOR_ROW-1:0] store_tensor_row_rdata;

input wire [(2)-1:0] slxqdready;
output wire slxqvalid;
output wire slxqlast;
output wire slxqwrite;
output wire [`BW_AXI_ALEN-1:0] slxqlen;
output wire [`BW_AXI_ASIZE-1:0] slxqsize;
output wire [`BW_AXI_ABURST-1:0] slxqburst;
output wire [(BW_AXI_DATA/8)-1:0] slxqwstrb;
output wire [BW_AXI_DATA-1:0] slxqwdata;
output wire [BW_AXI_ADDR-1:0] slxqaddr;
output wire [BW_LPI_BURDEN-1:0] slxqburden;

output wire [(2)-1:0] slxydready;
input wire slxyvalid;
input wire slxylast;
input wire slxywreply;
input wire [`BW_AXI_RESP-1:0] slxyresp;
input wire [BW_AXI_DATA-1:0] slxyrdata;
input wire [BW_LPI_BURDEN-1:0] slxyburden;

wire dca_signal_10;

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = BW_AXI_ADDR;
localparam  BW_LPIXM_DATA = BW_AXI_DATA;

`include "lpixm_lpara.vb"

wire [2-1:0] dca_signal_00;
wire dca_signal_18;
wire dca_signal_28;
wire dca_signal_19;
wire dca_signal_21;
wire [BW_LPI_QDATA-1:0] dca_signal_24;
wire [2-1:0] dca_signal_20;
wire dca_signal_03;
wire dca_signal_04;
wire dca_signal_15;
wire [BW_LPI_YDATA-1:0] dca_signal_14;

wire [2-1:0] dca_signal_11;
wire dca_signal_09;
wire dca_signal_12;
wire dca_signal_26;
wire dca_signal_17;
wire [BW_LPI_QDATA-1:0] dca_signal_02;
wire [2-1:0] dca_signal_05;
wire dca_signal_01;
wire dca_signal_30;
wire dca_signal_07;
wire [BW_LPI_YDATA-1:0] dca_signal_25;

wire dca_signal_23;
wire dca_signal_27;
wire dca_signal_29;
wire dca_signal_16;
wire [BW_LPI_QDATA-1:0] dca_signal_06;

wire [BW_LPI_QPARCEL-1:0] dca_signal_22;

wire dca_signal_08;

wire [BW_LPI_YPARCEL-1:0] dca_signal_13;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"
`include "motype_lpara.vb"

DCA_MATRIX_LSU_CACHE_LPI2P
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_0
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .busy(busy),

  .inst_wvalid(inst_wvalid),
  .inst_wdata(inst_wdata),
  .inst_wready(inst_wready),
  .inst_is_write(dca_signal_10),
  .inst_decode_finish(inst_decode_finish),
  .inst_execute_finish(inst_execute_finish),

  .cache_flush(cache_flush),

  .load_tensor_row_wvalid(load_tensor_row_wvalid),
  .load_tensor_row_wlast(load_tensor_row_wlast),
  .load_tensor_row_wdata(load_tensor_row_wdata),
  .load_tensor_row_wready(load_tensor_row_wready),

  .store_tensor_row_rvalid(store_tensor_row_rvalid),
  .store_tensor_row_rlast(store_tensor_row_rlast),
  .store_tensor_row_rready(store_tensor_row_rready),
  .store_tensor_row_rdata(store_tensor_row_rdata),

  .read_slqdready(dca_signal_00),
  .read_slqvalid(dca_signal_18),
  .read_slqhint(dca_signal_28),
  .read_slqlast(dca_signal_19),
  .read_slqafy(dca_signal_21),
  .read_slqdata(dca_signal_24),
  .read_slydready(dca_signal_20),
  .read_slyvalid(dca_signal_03),
  .read_slyhint(dca_signal_04),
  .read_slylast(dca_signal_15),
  .read_slydata(dca_signal_14),

  .write_slqdready(dca_signal_11),
  .write_slqvalid(dca_signal_09),
  .write_slqhint(dca_signal_12),
  .write_slqlast(dca_signal_26),
  .write_slqafy(dca_signal_17),
  .write_slqdata(dca_signal_02),
  .write_slydready(dca_signal_05),
  .write_slyvalid(dca_signal_01),
  .write_slyhint(dca_signal_30),
  .write_slylast(dca_signal_07),
  .write_slydata(dca_signal_25)
);

assign dca_signal_00 = (WRITE_SUPPORTED&dca_signal_10)? 0 : slxqdready;
assign dca_signal_11 = (WRITE_SUPPORTED&dca_signal_10)? slxqdready : 0;

assign dca_signal_23 = (WRITE_SUPPORTED&dca_signal_10)? dca_signal_09 : dca_signal_18;
assign dca_signal_27 = (WRITE_SUPPORTED&dca_signal_10)? dca_signal_12 : dca_signal_28;
assign dca_signal_29 = (WRITE_SUPPORTED&dca_signal_10)? dca_signal_26 : dca_signal_19;
assign dca_signal_16 = (WRITE_SUPPORTED&dca_signal_10)? dca_signal_17 : dca_signal_21;
assign dca_signal_06 = (WRITE_SUPPORTED&dca_signal_10)? dca_signal_02 : dca_signal_24;

assign slxqvalid = dca_signal_23;
assign slxqlast = dca_signal_29;
assign {slxqburden,dca_signal_22} = dca_signal_06;

assign {slxqwrite,slxqlen,slxqsize,slxqburst,slxqwstrb,slxqwdata,slxqaddr} = dca_signal_22;

assign dca_signal_08 = WRITE_SUPPORTED & slxywreply;

assign slxydready = dca_signal_08? dca_signal_05 : dca_signal_20;

assign dca_signal_03 = (~dca_signal_08) & slxyvalid;
assign dca_signal_04 = 0;
assign dca_signal_15 = slxylast;
assign dca_signal_14 = {slxyburden,dca_signal_13};

assign dca_signal_01 = (dca_signal_08) & slxyvalid;
assign dca_signal_30 = 0;
assign dca_signal_07 = slxylast;
assign dca_signal_25 = {slxyburden,dca_signal_13};

assign dca_signal_13 = {slxylast,slxywreply,slxyresp,slxyrdata};

endmodule

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



module DCA_MATRIX_LSU_CACHE_LPI2P
(
  clk,
  rstnn,
  clear,
  enable,
  busy,

  inst_wvalid,
  inst_wdata,
  inst_wready,
  inst_is_write,
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

  read_slqdready,
  read_slqvalid,
  read_slqhint,
  read_slqlast,
  read_slqafy,
  read_slqdata,
  read_slydready,
  read_slyvalid,
  read_slyhint,
  read_slylast,
  read_slydata,

  write_slqdready,
  write_slqvalid,
  write_slqhint,
  write_slqlast,
  write_slqafy,
  write_slqdata,
  write_slydready,
  write_slyvalid,
  write_slyhint,
  write_slylast,
  write_slydata
);



parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter BW_LPI_BURDEN = 1;
parameter MATRIX_SIZE_PARA = 4;
parameter TENSOR_PARA = 0;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_tensor_scalar_lpara.vb"
`include "dca_tensor_dim_lpara.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = BW_AXI_ADDR;
localparam  BW_LPIXM_DATA = BW_AXI_DATA;

`include "lpixm_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

localparam  DCA_LPARA_0 = `BW_DCA_MATRIX_LSU_INST;

input wire inst_wvalid;
input wire [DCA_LPARA_0-1:0] inst_wdata;
output wire inst_wready;
output wire inst_is_write;
output wire inst_decode_finish;
output wire inst_execute_finish;

input wire cache_flush;

output wire load_tensor_row_wvalid;
output wire load_tensor_row_wlast;
output wire [BW_TENSOR_ROW-1:0] load_tensor_row_wdata;
input wire load_tensor_row_wready;

output wire store_tensor_row_rvalid;
output wire store_tensor_row_rlast;
input wire store_tensor_row_rready;
input wire [BW_TENSOR_ROW-1:0] store_tensor_row_rdata;

input wire [2-1:0] read_slqdready;
output wire read_slqvalid;
output wire read_slqhint;
output wire read_slqlast;
output wire read_slqafy;
output wire [BW_LPI_QDATA-1:0] read_slqdata;
output wire [2-1:0] read_slydready;
input wire read_slyvalid;
input wire read_slyhint;
input wire read_slylast;
input wire [BW_LPI_YDATA-1:0] read_slydata;

input wire [2-1:0] write_slqdready;
output wire write_slqvalid;
output wire write_slqhint;
output wire write_slqlast;
output wire write_slqafy;
output wire [BW_LPI_QDATA-1:0] write_slqdata;
output wire [2-1:0] write_slydready;
input wire write_slyvalid;
input wire write_slyhint;
input wire write_slylast;
input wire [BW_LPI_YDATA-1:0] write_slydata;

wire [2-1:0] dca_signal_00;
wire dca_signal_06;
wire dca_signal_10;
wire dca_signal_02;
wire dca_signal_04;
wire [BW_LPI_QDATA-1:0] dca_signal_07;

wire [2-1:0] dca_signal_01;
wire dca_signal_05;
wire dca_signal_08;
wire dca_signal_09;
wire [BW_LPI_YDATA-1:0] dca_signal_03;

DCA_MATRIX_LSU_LPI2P
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
  .inst_is_write(inst_is_write),
  .inst_decode_finish(inst_decode_finish),
  .inst_execute_finish(inst_execute_finish),

  .load_tensor_row_wvalid(load_tensor_row_wvalid),
  .load_tensor_row_wlast(load_tensor_row_wlast),
  .load_tensor_row_wdata(load_tensor_row_wdata),
  .load_tensor_row_wready(load_tensor_row_wready),

  .store_tensor_row_rvalid(store_tensor_row_rvalid),
  .store_tensor_row_rlast(store_tensor_row_rlast),
  .store_tensor_row_rready(store_tensor_row_rready),
  .store_tensor_row_rdata(store_tensor_row_rdata),

  .read_slqdready(dca_signal_00),
  .read_slqvalid(dca_signal_06),
  .read_slqhint(dca_signal_10),
  .read_slqlast(dca_signal_02),
  .read_slqafy(dca_signal_04),
  .read_slqdata(dca_signal_07),
  .read_slydready(dca_signal_01),
  .read_slyvalid(dca_signal_05),
  .read_slyhint(dca_signal_08),
  .read_slylast(dca_signal_09),
  .read_slydata(dca_signal_03),

  .write_slqdready(write_slqdready),
  .write_slqvalid(write_slqvalid),
  .write_slqhint(write_slqhint),
  .write_slqlast(write_slqlast),
  .write_slqafy(write_slqafy),
  .write_slqdata(write_slqdata),
  .write_slydready(write_slydready),
  .write_slyvalid(write_slyvalid),
  .write_slyhint(write_slyhint),
  .write_slylast(write_slylast),
  .write_slydata(write_slydata)
);

DCA_MODULE_01
#(
  .DCA_GPARA_1(BW_AXI_ADDR),
  .DCA_GPARA_0(BW_AXI_DATA)
)
i_dca_instance_1
(
	.dca_port_11(clk),
	.dca_port_08(rstnn),
  .dca_port_09(clear),
  .dca_port_25(enable),

  .dca_port_02(cache_flush),

  .dca_port_14(dca_signal_00),
  .dca_port_05(dca_signal_06),
  .dca_port_19(dca_signal_10),
  .dca_port_16(dca_signal_02),
  .dca_port_04(dca_signal_04),
  .dca_port_24(dca_signal_07),

  .dca_port_23(dca_signal_01),
  .dca_port_20(dca_signal_05),
  .dca_port_13(dca_signal_08),
  .dca_port_18(dca_signal_09),
  .dca_port_10(dca_signal_03),

  .dca_port_00(read_slqdready),
  .dca_port_21(read_slqvalid),
  .dca_port_07(read_slqhint),
  .dca_port_03(read_slqlast),
  .dca_port_22(read_slqafy),
  .dca_port_06(read_slqdata),

  .dca_port_17(read_slydready),
  .dca_port_12(read_slyvalid),
  .dca_port_01(read_slyhint),
  .dca_port_15(read_slylast),
  .dca_port_26(read_slydata)
);

endmodule

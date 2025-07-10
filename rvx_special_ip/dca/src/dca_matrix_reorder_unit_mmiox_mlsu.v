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
// 2025-06-16
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "dca_module_memorymap_offset.vh"

`include "dca_matrix_info.vh"
`include "dca_matrix_lsu_inst.vh"



module DCA_MATRIX_REORDER_UNIT_MMIOX_MLSU
(
  clk,
  rstnn,

  control_rmx_core_config,
  control_rmx_core_status,
  control_rmx_clear_request,
  control_rmx_clear_finish,
  control_rmx_log_fifo_wready,
  control_rmx_log_fifo_wrequest,
  control_rmx_log_fifo_wdata,
  control_rmx_inst_fifo_rready,
  control_rmx_inst_fifo_rdata,
  control_rmx_inst_fifo_rrequest,
  control_rmx_operation_finish,
  control_rmx_input_fifo_rready,
  control_rmx_input_fifo_rdata,
  control_rmx_input_fifo_rrequest,
  control_rmx_output_fifo_wready,
  control_rmx_output_fifo_wrequest,
  control_rmx_output_fifo_wdata,

  mi_sinst_wvalid,
	mi_sinst_wdata,
	mi_sinst_wready,
	mi_sinst_decode_finish,
	mi_sinst_execute_finish,
	mi_sinst_busy,
	mi_sload_tensor_row_wvalid,
	mi_sload_tensor_row_wlast,
	mi_sload_tensor_row_wdata,
	mi_sload_tensor_row_wready,
	mi_sstore_tensor_row_rvalid,
	mi_sstore_tensor_row_rlast,
	mi_sstore_tensor_row_rready,
  mi_sstore_tensor_row_rdata,

  mo_sinst_wvalid,
	mo_sinst_wdata,
	mo_sinst_wready,
	mo_sinst_decode_finish,
	mo_sinst_execute_finish,
	mo_sinst_busy,
	mo_sload_tensor_row_wvalid,
	mo_sload_tensor_row_wlast,
	mo_sload_tensor_row_wdata,
	mo_sload_tensor_row_wready,
	mo_sstore_tensor_row_rvalid,
	mo_sstore_tensor_row_rlast,
	mo_sstore_tensor_row_rready,
	mo_sstore_tensor_row_rdata
);



parameter BW_ADDR = 32;
parameter MI_BW_DATA = 128;
parameter MO_BW_DATA = 128;

parameter MATRIX_SIZE_PARA = 8;
parameter TENSOR_PARA = 0;

localparam  DCA_LPARA_1 = 1;
localparam  DCA_LPARA_4 = `BW_DCA_MRU_STATUS;
localparam  DCA_LPARA_3 = `BW_DCA_MRU_LOG;
localparam  DCA_LPARA_0 = `BW_DCA_MRU_INST;
localparam  DCA_LPARA_5 = `BW_DCA_MRU_INPUT;
localparam  DCA_LPARA_2 = 32;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_tensor_scalar_lpara.vb"

input wire clk;
input wire rstnn;

input wire [(DCA_LPARA_1)-1:0] control_rmx_core_config;
output wire [(DCA_LPARA_4)-1:0] control_rmx_core_status;
input wire control_rmx_clear_request;
output wire control_rmx_clear_finish;
input wire control_rmx_log_fifo_wready;
output wire control_rmx_log_fifo_wrequest;
output wire [(DCA_LPARA_3)-1:0] control_rmx_log_fifo_wdata;
input wire control_rmx_inst_fifo_rready;
input wire [(DCA_LPARA_0)-1:0] control_rmx_inst_fifo_rdata;
output wire control_rmx_inst_fifo_rrequest;
output wire control_rmx_operation_finish;
input wire control_rmx_input_fifo_rready;
input wire [(DCA_LPARA_5)-1:0] control_rmx_input_fifo_rdata;
output wire control_rmx_input_fifo_rrequest;
input wire control_rmx_output_fifo_wready;
output wire control_rmx_output_fifo_wrequest;
output wire [(DCA_LPARA_2)-1:0] control_rmx_output_fifo_wdata;

output wire mi_sinst_wvalid;
output wire [(`BW_DCA_MATRIX_LSU_INST)-1:0] mi_sinst_wdata;
input wire mi_sinst_wready;
input wire mi_sinst_decode_finish;
input wire mi_sinst_execute_finish;
input wire mi_sinst_busy;
input wire mi_sload_tensor_row_wvalid;
input wire mi_sload_tensor_row_wlast;
input wire [(BW_TENSOR_SCALAR*MATRIX_NUM_COL)-1:0] mi_sload_tensor_row_wdata;
output wire mi_sload_tensor_row_wready;
input wire mi_sstore_tensor_row_rvalid;
input wire mi_sstore_tensor_row_rlast;
output wire mi_sstore_tensor_row_rready;
output wire [(BW_TENSOR_SCALAR*MATRIX_NUM_COL)-1:0] mi_sstore_tensor_row_rdata;

output wire mo_sinst_wvalid;
output wire [(`BW_DCA_MATRIX_LSU_INST)-1:0] mo_sinst_wdata;
input wire mo_sinst_wready;
input wire mo_sinst_decode_finish;
input wire mo_sinst_execute_finish;
input wire mo_sinst_busy;
input wire mo_sload_tensor_row_wvalid;
input wire mo_sload_tensor_row_wlast;
input wire [(BW_TENSOR_SCALAR*MATRIX_NUM_COL)-1:0] mo_sload_tensor_row_wdata;
output wire mo_sload_tensor_row_wready;
input wire mo_sstore_tensor_row_rvalid;
input wire mo_sstore_tensor_row_rlast;
output wire mo_sstore_tensor_row_rready;
output wire [(BW_TENSOR_SCALAR*MATRIX_NUM_COL)-1:0] mo_sstore_tensor_row_rdata;

wire dca_signal_10;
wire [DCA_LPARA_0-1:0] dca_signal_02;
wire dca_signal_08;
wire dca_signal_06;
wire dca_signal_01;
wire dca_signal_07;
wire [DCA_LPARA_3-1:0] dca_signal_05;
wire dca_signal_03;
wire [DCA_LPARA_5-1:0] dca_signal_04;
wire dca_signal_09;
wire [DCA_LPARA_4-1:0] dca_signal_00;

assign control_rmx_core_status = dca_signal_00;
assign control_rmx_clear_finish = 0;
assign dca_signal_01 = control_rmx_log_fifo_wready;
assign control_rmx_log_fifo_wrequest = dca_signal_07;
assign control_rmx_log_fifo_wdata = dca_signal_05;
assign dca_signal_10 = control_rmx_inst_fifo_rready;
assign dca_signal_02 = control_rmx_inst_fifo_rdata;
assign control_rmx_inst_fifo_rrequest = dca_signal_08;
assign control_rmx_operation_finish = dca_signal_06;
assign dca_signal_03 = control_rmx_input_fifo_rready;
assign dca_signal_04 = control_rmx_input_fifo_rdata;
assign control_rmx_input_fifo_rrequest = dca_signal_09;
assign control_rmx_output_fifo_wrequest = 0;
assign control_rmx_output_fifo_wdata = 0;

DCA_MODULE_04
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_0
(
  .dca_port_30(clk),
  .dca_port_23(rstnn),
  .dca_port_08(1'b 0),
  .dca_port_09(1'b 1),
  .dca_port_14(),

  .dca_port_15(dca_signal_10),
  .dca_port_03(dca_signal_02),
  .dca_port_10(dca_signal_08),
  .dca_port_26(dca_signal_06),
  .dca_port_21(dca_signal_01),
  .dca_port_35(dca_signal_07),
  .dca_port_20(dca_signal_05),
  .dca_port_24(dca_signal_03),
  .dca_port_27(dca_signal_04),
  .dca_port_04(dca_signal_09),
  .dca_port_00(dca_signal_00),

  .dca_port_25(mi_sinst_busy),
  .dca_port_32(mi_sinst_wvalid),
  .dca_port_18(mi_sinst_wdata),
  .dca_port_28(mi_sinst_wready),
  .dca_port_07(mi_sinst_decode_finish),
  .dca_port_01(mi_sinst_execute_finish),
  .dca_port_33(mi_sload_tensor_row_wready),
  .dca_port_29(mi_sload_tensor_row_wvalid),
  .dca_port_34(mi_sload_tensor_row_wlast),
  .dca_port_16(mi_sload_tensor_row_wdata),

  .dca_port_13(mo_sinst_busy),
  .dca_port_02(mo_sinst_wvalid),
  .dca_port_22(mo_sinst_wdata),
  .dca_port_12(mo_sinst_wready),
  .dca_port_06(mo_sinst_decode_finish),
  .dca_port_17(mo_sinst_execute_finish),
  .dca_port_31(mo_sstore_tensor_row_rvalid),
  .dca_port_19(mo_sstore_tensor_row_rready),
  .dca_port_11(mo_sstore_tensor_row_rlast),
  .dca_port_05(mo_sstore_tensor_row_rdata)
);

assign mi_sstore_tensor_row_rready = 0;
assign mi_sstore_tensor_row_rdata = 0;

assign mo_sload_tensor_row_wready = 0;

endmodule

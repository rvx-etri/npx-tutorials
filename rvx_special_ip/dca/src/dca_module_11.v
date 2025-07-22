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

`include "dca_matrix_info.vh"
`include "dca_matrix_lsu_inst.vh"
`include "dca_module_memorymap_offset.vh"



module DCA_MODULE_11
(
  dca_port_04,
  dca_port_20,
  dca_port_07,
  dca_port_13,
  dca_port_09,

  dca_port_11,
  dca_port_15,
  dca_port_16,

  dca_port_12,
  dca_port_18,
  dca_port_06,

  dca_port_03,
  dca_port_02,
  dca_port_14,
  dca_port_00,
  dca_port_10,

  dca_port_17,
  dca_port_08,
  dca_port_01,

  dca_port_05,
  dca_port_19
);



parameter MATRIX_SIZE_PARA = 8;
parameter TENSOR_PARA = 0;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_include_0.vh"
`include "dca_tensor_scalar_lpara.vb"
`include "dca_tensor_dim_lpara.vb"

input wire dca_port_04;
input wire dca_port_20;
input wire dca_port_07;
input wire dca_port_13;
output wire dca_port_09;

localparam  DCA_LPARA_0 = `BW_DCA_MRU_INPUT;

input wire dca_port_11;
input wire [DCA_LPARA_0-1:0] dca_port_15;
output wire dca_port_16;

input wire dca_port_12;
input wire [BW_BLOCKED_STEP_INST-1:0] dca_port_18;
output wire dca_port_06;

input wire dca_port_03;
output wire dca_port_02;
input wire dca_port_14;
output wire dca_port_00;
input wire dca_port_10;

input wire [BW_TENSOR_MATRIX-1:0] dca_port_17;
output wire [MATRIX_NUM_ELEMENT-1:0] dca_port_08;
output wire [BW_TENSOR_MATRIX-1:0] dca_port_01;

output wire dca_port_05;
output wire dca_port_19;

genvar i;
genvar i_row, i_col;

wire [`BW_DCA_MRU_OPCODE-1:0] dca_signal_03;
wire dca_signal_11;

wire dca_signal_04;
wire dca_signal_07;
wire dca_signal_02;
wire dca_signal_08;

wire dca_signal_01;
wire dca_signal_09;
wire dca_signal_12;

localparam  DCA_LPARA_1 = 4;
reg [DCA_LPARA_1-1:0] dca_signal_00;
reg dca_signal_10;

wire [BW_TENSOR_SCALAR-1:0] dca_signal_05 [0:MATRIX_MAX_DIM-1][0:MATRIX_MAX_DIM-1];
wire [BW_TENSOR_SCALAR-1:0] dca_signal_06 [0:MATRIX_MAX_DIM-1][0:MATRIX_MAX_DIM-1];

assign {dca_signal_11, dca_signal_03} = dca_port_18;

assign dca_signal_04 = dca_signal_03[`DCA_MRU_OPCODE_INDEX_TRANSPOSE];
assign dca_signal_07 = dca_signal_03[`DCA_MRU_OPCODE_INDEX_FILL];
assign dca_signal_02 = dca_signal_03[`DCA_MRU_OPCODE_INDEX_LSU0_REQ];
assign dca_signal_08 = 1;

always@(posedge dca_port_04, negedge dca_port_20)
begin
  if(dca_port_20==0)
    dca_signal_00 <= 1;
  else
  begin
    if(dca_port_00 & dca_port_10)
      ;
    else if(dca_port_10)
      dca_signal_00 <= dca_signal_00>>1;
    else if(dca_port_00)
      dca_signal_00 <= dca_signal_00<<1;
  end
end

always@(posedge dca_port_04 or negedge dca_port_20)
begin
  if(~dca_port_20)
    dca_signal_10 <= 0;
  else if(dca_port_19)
    dca_signal_10 <= 0;
  else if(dca_signal_12)
    dca_signal_10 <= 1;
end
assign dca_signal_01 = (dca_signal_02? dca_port_03 : 1) & (dca_signal_07? dca_port_11 : 1) & (dca_signal_08? (dca_port_14 & (~dca_signal_00[DCA_LPARA_1-1])) : 1);
assign dca_signal_09 = (~dca_signal_10) & dca_port_12 & dca_signal_01;
assign dca_signal_12 = dca_signal_09 & dca_signal_11;

assign dca_port_05 = dca_signal_09 & dca_signal_02;
assign dca_port_02 = dca_signal_09 & dca_signal_02;
assign dca_port_00 = dca_signal_09 & dca_signal_08;
assign dca_port_06 = dca_signal_09;
assign dca_port_16 = dca_signal_12 & dca_signal_07;

generate
for(i=0; i<MATRIX_NUM_ELEMENT; i=i+1)
begin : i_gen_mreg2_all_wenable_list2d
  assign dca_port_08[i] = dca_port_00;
end
endgenerate

assign dca_port_19 = dca_signal_10 & (dca_signal_00[0] | (dca_signal_00[1] & dca_port_10));

assign dca_port_09 = dca_port_12 | dca_signal_10;

generate
for(i_row=0; i_row<MATRIX_MAX_DIM; i_row=i_row+1)
begin : i_iter_row
  for(i_col=0; i_col<MATRIX_MAX_DIM; i_col=i_col+1)
  begin : i_iter_col
    assign dca_signal_05[i_row][i_col] = dca_port_17[(i_row*MATRIX_MAX_DIM + i_col + 1)*BW_TENSOR_SCALAR-1 -:BW_TENSOR_SCALAR];
    assign dca_port_01[(i_row*MATRIX_MAX_DIM + i_col + 1)*BW_TENSOR_SCALAR-1 -:BW_TENSOR_SCALAR] = dca_signal_06[i_row][i_col];
    assign dca_signal_06[i_row][i_col] = dca_signal_04? dca_signal_05[i_col][i_row] : (dca_signal_07? dca_port_15 : dca_signal_05[i_row][i_col]);
  end
end
endgenerate

endmodule

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





module DCA_MODULE_12
(
  dca_port_10,
  dca_port_25,
  dca_port_27,
  dca_port_09,
  dca_port_18,

  dca_port_15,

  dca_port_07,
  dca_port_11,
  dca_port_21,

  dca_port_01,
  dca_port_26,
  dca_port_24,

  dca_port_08,
  dca_port_14,
  dca_port_12,

  dca_port_23,
  dca_port_06,
  dca_port_17,

  dca_port_05,
  dca_port_22,
  dca_port_29,

  dca_port_28,
  dca_port_13,
  dca_port_00,

  dca_port_04,
  dca_port_02,
  dca_port_16,

  dca_port_19,
  dca_port_03,
  dca_port_20
);





parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter MATRIX_SIZE_PARA = 4;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"

parameter DCA_GPARA_0 = MATRIX_NUM_COL;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire dca_port_10;
input wire dca_port_25;
input wire dca_port_27;
input wire dca_port_09;
output wire dca_port_18;

input wire dca_port_15;

localparam  DCA_LPARA_15 = `BW_DCA_MATRIX_LSU_INST;

input wire dca_port_07;
input wire [DCA_LPARA_15-1:0] dca_port_11;
output wire dca_port_21;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"

input wire dca_port_01;
output wire dca_port_26;
output wire [BW_TXN_INFO-1:0] dca_port_24;

input wire dca_port_08;
output wire dca_port_14;
output wire [BW_TXN_INFO-1:0] dca_port_12;

input wire dca_port_23;
output wire dca_port_06;
output wire [BW_TXN_INFO-1:0] dca_port_17;

input wire dca_port_05;
output wire dca_port_22;
output wire [BW_TXN_INFO-1:0] dca_port_29;

input wire dca_port_28;
output wire dca_port_13;
output wire [BW_RRESP_INFO-1:0] dca_port_00;

input wire dca_port_04;
output wire dca_port_02;
output wire [BW_WDATA_INFO-1:0] dca_port_16;

input wire dca_port_19;
input wire dca_port_03;
input wire dca_port_20;

integer i;

wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_34;
wire [`BW_DCA_MATRIX_INFO_ADDR-1:0] dca_signal_40;
wire [`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:0] dca_signal_09;
wire [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_03;
wire [`BW_DCA_MATRIX_INFO_NUM_COL_M1-1:0] dca_signal_43;
wire [`BW_DCA_MATRIX_INFO_IS_SIGNED-1:0] dca_signal_37;
wire [`BW_DCA_MATRIX_INFO_IS_FLOAT-1:0] dca_signal_16;
wire [`BW_DCA_MATRIX_INFO_ADDR_LSA_P3-1:0] dca_signal_07;
wire [`BW_DCA_MATRIX_INFO_BIT_OFFSET-1:0] dca_signal_23;
wire [`BW_DCA_MATRIX_INFO_IS_BINARY-1:0] dca_signal_26;

wire dca_signal_13;
wire dca_signal_19;

localparam  DCA_LPARA_16 = 2;
localparam  DCA_LPARA_06 = 0;
localparam  DCA_LPARA_04 = 1;
localparam  DCA_LPARA_02 = 2;

reg [DCA_LPARA_16-1:0] dca_signal_41;
wire dca_signal_05;
wire dca_signal_39;

reg [MATRIX_NUM_COL-1:0] dca_signal_35;

localparam  DCA_LPARA_01 = 3;
localparam  DCA_LPARA_00 = 0;
localparam  DCA_LPARA_05 = 1;
localparam  DCA_LPARA_13 = 3;
localparam  DCA_LPARA_03 = 5;
localparam  DCA_LPARA_08 = 7;

reg [DCA_LPARA_01-1:0] dca_signal_45;
wire dca_signal_01;
wire dca_signal_14;

localparam  DCA_LPARA_07 = REQUIRED_BITWIDTH_INDEX(MATRIX_NUM_ROW);

reg [DCA_LPARA_07-1:0] dca_signal_18;
wire dca_signal_21;

reg [BW_BITADDR-1:0] dca_signal_27;
reg [BW_BITADDR-1:0] dca_signal_17;
wire [BW_BITADDR-1:0] dca_signal_04;

localparam  DCA_LPARA_14 = `BW_AXI_ALEN+BW_BITADDR_OFFSET;

wire [DCA_LPARA_14-1:0] dca_signal_08;
wire [DCA_LPARA_14-1:0] dca_signal_32;
wire [DCA_LPARA_14-1:0] dca_signal_38;

reg [`BW_AXI_ALEN-1:0] dca_signal_06;
wire [`BW_AXI_ALEN-1:0] dca_signal_25;

reg dca_signal_02;
reg dca_signal_00;
reg dca_signal_28;
reg dca_signal_46;
wire dca_signal_12;

wire dca_signal_36;
wire dca_signal_30;

wire dca_signal_44;
wire dca_signal_10;
wire [BW_TXN_INFO-1:0] dca_signal_15;

localparam  DCA_LPARA_17 = DCA_LPARA_14;
localparam  DCA_LPARA_11 = `BW_DCA_MATRIX_INFO_ADDR_LSA_P3;

wire [DCA_LPARA_17-1:0] dca_signal_31;
wire [DCA_LPARA_11-1:0] dca_signal_20;
wire [DCA_LPARA_17-1:0] dca_signal_29;

localparam  DCA_LPARA_10 = 1;
localparam  DCA_LPARA_09 = 0;
localparam  DCA_LPARA_12 = 1;

reg [DCA_LPARA_10-1:0] dca_signal_24;
wire dca_signal_11;
wire dca_signal_22;

reg [DCA_GPARA_0-1:0] dca_signal_33;
wire dca_signal_42;

assign {dca_signal_26, dca_signal_23, dca_signal_07, dca_signal_16, dca_signal_37, dca_signal_43, dca_signal_03, dca_signal_09, dca_signal_40, dca_signal_34} = dca_port_11;

assign dca_signal_13 = (~dca_signal_34[`DCA_MATRIX_LSU_INST_OPCODE_INDEX_WRITE]);
assign dca_signal_19 = dca_signal_34[`DCA_MATRIX_LSU_INST_OPCODE_INDEX_WRITE];

always@(posedge dca_port_10, negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_41 <= DCA_LPARA_06;
  else if(dca_port_09)
    case(dca_signal_41)
      DCA_LPARA_06:
        if(dca_port_07)
          dca_signal_41 <= DCA_LPARA_04;
      DCA_LPARA_04:
        if(dca_signal_05)
          dca_signal_41 <= DCA_LPARA_02;
      DCA_LPARA_02:
        if(dca_port_21)
          dca_signal_41 <= DCA_LPARA_06;
    endcase
end

always@(posedge dca_port_10, negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_35 <= 0;
  else if(dca_port_07)
  begin
    for(i=0; i<MATRIX_NUM_COL; i=i+1)
      dca_signal_35[i] <= (i<=dca_signal_43);
  end
end

assign dca_signal_05 = dca_signal_13? dca_port_28 : dca_port_04;
assign dca_signal_39 = (dca_signal_41==DCA_LPARA_04);

assign dca_port_13 = dca_signal_13 & dca_signal_39;
assign dca_port_00 = {dca_port_11, dca_signal_35};
assign dca_port_02 = dca_signal_19 & dca_signal_39;
assign dca_port_16 = {dca_port_11, dca_signal_35};

always@(posedge dca_port_10, negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_45 <= DCA_LPARA_00;
  else if(dca_port_09)
    case(dca_signal_45)
      DCA_LPARA_00:
        if(dca_port_07)
          dca_signal_45 <= DCA_LPARA_05;
      DCA_LPARA_05:
        dca_signal_45 <= DCA_LPARA_13;
      DCA_LPARA_13:
        dca_signal_45 <= DCA_LPARA_03;
      DCA_LPARA_03:
        if(dca_port_21)
          dca_signal_45 <= DCA_LPARA_00;
        else if(dca_signal_14)
          dca_signal_45 <= DCA_LPARA_08;
      DCA_LPARA_08:
        if(dca_port_21)
          dca_signal_45 <= DCA_LPARA_00;
    endcase
end

assign dca_port_21 = (dca_signal_41==DCA_LPARA_02) & (((dca_signal_45==DCA_LPARA_03) & dca_signal_14) | (dca_signal_45==DCA_LPARA_08));
assign dca_signal_01 = dca_signal_10 & dca_signal_44;
assign dca_signal_14 = dca_signal_01 & dca_signal_21;

always@(posedge dca_port_10, negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_18 <= 0;
  else if(dca_port_09)
  begin
    if(dca_signal_14)
      dca_signal_18 <= 0;
    else if(dca_signal_01)
      dca_signal_18 <= dca_signal_18 + 1'b 1;
  end
end

assign dca_signal_21 = (dca_signal_18 == dca_signal_03[DCA_LPARA_07-1:0])? 1: 0;

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_27 <= 0;
  else if(dca_port_09)
    case(dca_signal_45)
      DCA_LPARA_13:
        dca_signal_27 <= dca_signal_17;
      DCA_LPARA_03:
        if(dca_signal_01)
          dca_signal_27 <= dca_signal_17;
    endcase
end

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_17 <= 0;
  else if(dca_port_09)
    case(dca_signal_45)
      DCA_LPARA_05:
        dca_signal_17 <= {dca_signal_40, dca_signal_23};
      DCA_LPARA_13:
        dca_signal_17 <= dca_signal_04;
      DCA_LPARA_03:
        if(dca_signal_01)
          dca_signal_17 <= dca_signal_04;
    endcase
end
assign dca_signal_04 = dca_signal_17 + dca_signal_09;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(DCA_LPARA_17),
  .BW_SHIFT_AMOUNT(DCA_LPARA_11),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1),
  .CIRCULAR_SHIFT(0),
  .LSB_FILL_VALUE(1)
)
i_dca_instance_0
(
  .data_input(dca_signal_31),
  .shift_amount(dca_signal_20),
  .data_output(dca_signal_29)
);

assign dca_signal_31 = $unsigned(dca_signal_43);
assign dca_signal_20 = dca_signal_07;
assign dca_signal_08 = dca_signal_29;

assign dca_signal_32 = $unsigned({dca_signal_17[BW_BITADDR_OFFSET-1:3],3'b 000});
assign dca_signal_38 = ($unsigned(dca_signal_32) + $unsigned(dca_signal_08)) >> 3;
assign dca_signal_25 = dca_signal_38 >> BW_AXI_ADDR_OFFSET;

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_06 <= 0;
  else if(dca_port_09)
    case(dca_signal_45)
      DCA_LPARA_13:
        dca_signal_06 <= dca_signal_25;
      DCA_LPARA_03:
        if(dca_signal_01)
          dca_signal_06 <= dca_signal_25;
    endcase
end

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_02 <= 0;
  else if(dca_port_09)
    case(dca_signal_45)
      DCA_LPARA_05:
        if(dca_signal_09[`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:BW_BITADDR_OFFSET]==0)
          dca_signal_02 <= 1;
        else
          dca_signal_02 <= 0;
    endcase
end

always@(*)
begin
  dca_signal_00 = 0;
  if(dca_signal_02)
    if(dca_signal_17[BW_BITADDR_OFFSET]==dca_signal_27[BW_BITADDR_OFFSET])
      dca_signal_00 = 1;
end

always@(*)
begin
  dca_signal_28 = 0;
  if(dca_signal_25==dca_signal_06)
    dca_signal_28 = 1;
end

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_46 <= 0;
  else if(dca_port_09)
    case(dca_signal_45)
      DCA_LPARA_05:
        dca_signal_46 <= 0;
      DCA_LPARA_03:
        if(dca_signal_01)
          dca_signal_46 <= dca_signal_00 & dca_signal_28;
    endcase
end

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_24 <= DCA_LPARA_09;
  else if(dca_port_09)
  begin
    case(dca_signal_24)
      DCA_LPARA_09:
        if(dca_signal_11)
          dca_signal_24 <= DCA_LPARA_12;
      DCA_LPARA_12:
        if(dca_signal_11)
          dca_signal_24 <= DCA_LPARA_12;
        else if(dca_port_20)
          dca_signal_24 <= DCA_LPARA_09;
    endcase
  end
end

assign dca_signal_11 = dca_port_19 & dca_port_03 & dca_port_20;
assign dca_signal_22 = (dca_signal_24==DCA_LPARA_12) & dca_port_20;

always@(posedge dca_port_10 or negedge dca_port_25)
begin
  if(dca_port_25==0)
    dca_signal_33 <= 0;
  else if(dca_port_09)
  begin
    if(dca_port_07 && dca_signal_13 && dca_signal_22)
      ;
    else if(dca_signal_22)
      dca_signal_33 <= dca_signal_33>>1;
    else if(dca_port_07 && dca_signal_13)
      dca_signal_33 <= {dca_signal_33, 1'b 1};
  end
end

assign dca_signal_42 = dca_signal_13 & (~dca_signal_34[`DCA_MATRIX_LSU_INST_OPCODE_INDEX_OVERDRIVE]) & dca_signal_33[2];

assign dca_signal_12 = dca_port_15 & dca_signal_46;

assign dca_signal_36 = dca_signal_13 & dca_port_08  & (~dca_signal_42);
assign dca_signal_30 = dca_signal_19 & dca_port_05;

assign dca_signal_44 = dca_signal_36 | dca_signal_30;
assign dca_signal_10 = (dca_signal_45==DCA_LPARA_03);
assign dca_signal_15 = {dca_signal_12, dca_signal_21, dca_signal_06, dca_signal_27};

assign dca_port_26 = dca_signal_36 & dca_signal_10 & (~dca_signal_12);
assign dca_port_24 = dca_signal_15;

assign dca_port_14 = dca_signal_36 & dca_signal_10;
assign dca_port_12 = dca_signal_15;

assign dca_port_06 = dca_signal_30 & dca_signal_10 & (~dca_signal_12);
assign dca_port_17 = dca_signal_15;

assign dca_port_22 = dca_signal_30 & dca_signal_10;
assign dca_port_29 = dca_signal_15;

assign dca_port_18 = (dca_signal_45!=DCA_LPARA_00);

endmodule

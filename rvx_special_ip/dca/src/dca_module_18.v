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

`include "dca_matrix_info.vh"
`include "dca_matrix_lsu_inst.vh"
`include "dca_module_memorymap_offset.vh"




module DCA_MODULE_18
(
  dca_port_14,
  dca_port_06,
  dca_port_22,
  dca_port_21,
  dca_port_17,

  dca_port_20,
  dca_port_00,
  dca_port_10,

  dca_port_02,
  dca_port_12,
  dca_port_08,

  dca_port_18,
  dca_port_05,
  dca_port_11,
  dca_port_13,
  dca_port_16,
  dca_port_09,
  dca_port_03,
  dca_port_07,
  dca_port_01,
  dca_port_15,
  dca_port_04,
  dca_port_19
);




parameter MATRIX_SIZE_PARA = 8;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_include_2.vh"

input wire dca_port_14;
input wire dca_port_06;
input wire dca_port_22;
input wire dca_port_21;
output wire dca_port_17;

localparam  DCA_LPARA_4 = `BW_DCA_MATRIX_MAC_INST;

input wire dca_port_20;
input wire [DCA_LPARA_4-1:0] dca_port_00;
output wire dca_port_10;
input wire dca_port_02;
input wire dca_port_12;
input wire dca_port_08;

input wire dca_port_18;
output wire dca_port_05;
output reg [BW_BLOCKED_STEP_INST-1:0] dca_port_11;

input wire dca_port_13;
output wire dca_port_16;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_09;

input wire dca_port_03;
output wire dca_port_07;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_01;

input wire dca_port_15;
output wire dca_port_04;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_19;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_63;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_53;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_60;
wire [`BW_DCA_MATRIX_MAC_OPCODE-1:0] dca_signal_32;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_64;
wire dca_signal_33;
wire dca_signal_51;
wire dca_signal_55;
reg dca_signal_18;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_39;
wire dca_signal_21;
wire dca_signal_24;
wire dca_signal_69;
wire dca_signal_31;
wire dca_signal_07;
wire dca_signal_02;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_57;
wire dca_signal_45;
wire dca_signal_49;
wire dca_signal_09;
reg dca_signal_12;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_05;
wire dca_signal_46;
wire dca_signal_50;
wire dca_signal_19;
wire dca_signal_37;
wire dca_signal_61;
wire dca_signal_36;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_48;
wire dca_signal_40;
wire dca_signal_01;
wire dca_signal_47;
reg dca_signal_52;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_67;
wire dca_signal_41;
wire dca_signal_59;
wire dca_signal_66;
wire dca_signal_42;
wire dca_signal_44;
wire dca_signal_62;

wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_23;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_58;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_43;

localparam  DCA_LPARA_2 = 1;
localparam  DCA_LPARA_1 = 0;
localparam  DCA_LPARA_3 = 1;

reg [DCA_LPARA_2-1:0] dca_signal_30;
wire dca_signal_22;
wire dca_signal_04;
wire dca_signal_17;
wire dca_signal_16;

reg dca_signal_03;

localparam  DCA_LPARA_0 = 3;

reg [DCA_LPARA_0-1:0] dca_signal_13;
wire dca_signal_11;
wire dca_signal_71;

wire dca_signal_08;
wire dca_signal_68;
wire dca_signal_20;
wire dca_signal_29;
wire dca_signal_00;
wire dca_signal_10;

wire dca_signal_65;
wire dca_signal_54;
wire dca_signal_25;
wire dca_signal_34;
wire dca_signal_70;
wire dca_signal_26;
wire dca_signal_15;
wire dca_signal_14;
wire dca_signal_28;
wire dca_signal_38;

wire [MATRIX_NUM_ROW-1:0] dca_signal_06;
wire [MATRIX_NUM_COL-1:0] dca_signal_56;
wire [MATRIX_MAX_DIM-1:0] dca_signal_27;

wire [MATRIX_NUM_ROW-1:0] dca_signal_35;

assign {dca_signal_32,dca_signal_60,dca_signal_53,dca_signal_63} = dca_port_00;

assign dca_signal_65 = dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_MULT_COND];
assign dca_signal_54 = 0;
assign dca_signal_25 = dca_signal_65 & dca_signal_21;
assign dca_signal_34 = dca_signal_65 & dca_signal_24;
assign dca_signal_70 = dca_signal_54;
assign dca_signal_26 = dca_signal_54;

assign dca_signal_15 = dca_signal_25 | dca_signal_70;
assign dca_signal_14 = dca_signal_34 | dca_signal_26;

assign dca_signal_28 = dca_signal_07 & dca_signal_44;
assign dca_signal_38 = dca_signal_02 & dca_signal_62;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_0
(
  .clk(dca_port_14),
  .rstnn(dca_port_06),
  .clear(dca_port_22),
  .enable(dca_port_21),

  .matrix_info(dca_signal_64),
  .init(dca_signal_33),
  .is_col_first(dca_signal_51),
  .iterate(dca_signal_55),
  .go_next_base(dca_signal_18),

  .block_info(dca_signal_39),
  .is_first_x(dca_signal_21),
  .is_last_x(dca_signal_24),
  .is_first_y(dca_signal_69),
  .is_last_y(dca_signal_31),
  .is_first_element(dca_signal_07),
  .is_last_element(dca_signal_02),
  .valid_row_list(),
  .valid_col_list()
);

assign dca_signal_64 = dca_signal_63;
assign dca_signal_33 = dca_signal_22;
assign dca_signal_51 = 1;
assign dca_signal_55 = dca_signal_16 & dca_signal_68;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_2
(
  .clk(dca_port_14),
  .rstnn(dca_port_06),
  .clear(dca_port_22),
  .enable(dca_port_21),

  .matrix_info(dca_signal_57),
  .init(dca_signal_45),
  .is_col_first(dca_signal_49),
  .iterate(dca_signal_09),
  .go_next_base(dca_signal_12),

  .block_info(dca_signal_05),
  .is_first_x(dca_signal_46),
  .is_last_x(dca_signal_50),
  .is_first_y(dca_signal_19),
  .is_last_y(dca_signal_37),
  .is_first_element(dca_signal_61),
  .is_last_element(dca_signal_36),
  .valid_row_list(dca_signal_35),
  .valid_col_list()
);

assign dca_signal_57 = dca_signal_53;
assign dca_signal_45 = dca_signal_22;
assign dca_signal_49 = ~dca_signal_65;
assign dca_signal_09 = dca_signal_16 & dca_signal_20;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_1
(
  .clk(dca_port_14),
  .rstnn(dca_port_06),
  .clear(dca_port_22),
  .enable(dca_port_21),

  .matrix_info(dca_signal_48),
  .init(dca_signal_40),
  .is_col_first(dca_signal_01),
  .iterate(dca_signal_47),
  .go_next_base(dca_signal_52),

  .block_info(dca_signal_67),
  .is_first_x(dca_signal_41),
  .is_last_x(dca_signal_59),
  .is_first_y(dca_signal_66),
  .is_last_y(dca_signal_42),
  .is_first_element(dca_signal_44),
  .is_last_element(dca_signal_62),
  .valid_row_list(dca_signal_06),
  .valid_col_list(dca_signal_56)
);

assign dca_signal_48 = dca_signal_60;
assign dca_signal_40 = dca_signal_22;
assign dca_signal_01 = 1;
assign dca_signal_47 = dca_signal_16 & dca_signal_29;

always@(*)
begin
  dca_signal_18 = 0;
  dca_signal_12 = 0;
  dca_signal_52 = 0;
  if(dca_signal_16 && dca_signal_04)
  begin
    if(dca_signal_65)
    begin
      dca_signal_18 = dca_signal_34 & dca_signal_59;
      dca_signal_12 = dca_signal_50;
      dca_signal_52 = dca_signal_34 & dca_signal_59;
    end
    else
    begin
      dca_signal_18 = dca_signal_24;
      dca_signal_12 = dca_signal_50;
      dca_signal_52 = dca_signal_59;
    end
  end
end

assign dca_signal_08 = dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_INIT_ACC] & dca_signal_15;
assign dca_signal_68 = (~dca_signal_00) & dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU0_REQ];
assign dca_signal_20 = (~dca_signal_00) & dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU1_REQ] & (dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_RSRC_CONSTANT]? dca_signal_28 : 1);
assign dca_signal_29 = dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU2_REQ] & (~dca_signal_00) & (dca_signal_65? dca_signal_34 : 1);
assign dca_signal_00 = dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_LOAD_ACC] & (~dca_signal_03);
assign dca_signal_10 = dca_signal_29 | dca_signal_00;

always@(posedge dca_port_14, negedge dca_port_06)
begin
  if(dca_port_06==0)
    dca_signal_30 <= DCA_LPARA_1;
  else if(dca_port_21)
    case(dca_signal_30)
      DCA_LPARA_1:
        if(dca_signal_22)
          dca_signal_30 <= DCA_LPARA_3;
      DCA_LPARA_3:
        if(dca_signal_17)
          dca_signal_30 <= DCA_LPARA_1;
    endcase
end

assign dca_signal_22 = (dca_signal_30==DCA_LPARA_1) & dca_port_20;
assign dca_signal_16 = dca_port_18 & dca_port_05;
assign dca_signal_04 = dca_signal_32[`DCA_MATRIX_MAC_OPCODE_INDEX_LOAD_ACC]? dca_signal_03 : 1;
assign dca_signal_17 = dca_signal_16 & dca_signal_38 & dca_signal_04;

always@(posedge dca_port_14, negedge dca_port_06)
begin
  if(dca_port_06==0)
    dca_signal_03 <= 0;
  else if(dca_signal_16)
  begin
    if(dca_signal_03 && dca_signal_14)
      dca_signal_03 <= 0;
    else if(dca_signal_00)
      dca_signal_03 <= 1;
  end
end

always@(posedge dca_port_14, negedge dca_port_06)
begin
  if(dca_port_06==0)
    dca_signal_13 <= 1;
  else if(dca_signal_71)
  begin
    if(dca_signal_16 & dca_signal_11)
      ;
    else
      dca_signal_13 <= dca_signal_13>>1;
  end
  else if(dca_signal_16 & dca_signal_11)
    dca_signal_13 <= dca_signal_13<<1;
end

assign dca_signal_11 = dca_signal_68 | dca_signal_20 | dca_signal_00;
assign dca_signal_71 = dca_port_02 | dca_port_12 | dca_port_08;

assign dca_port_10 = dca_signal_17;

assign dca_port_05 = (dca_signal_30==DCA_LPARA_3) & dca_port_18 & (dca_signal_68? dca_port_13 : 1) & (dca_signal_20? dca_port_03 : 1) & (dca_signal_10? dca_port_15 : 1) & ((dca_signal_11)? (~dca_signal_13[DCA_LPARA_0-1]) : 1);

assign dca_signal_27 = dca_signal_35;

always@(*)
begin
  dca_port_11 = {dca_signal_27, dca_signal_06, dca_signal_56, dca_signal_38, dca_signal_32};
  if(dca_signal_00)
    dca_port_11[`BW_DCA_MATRIX_MAC_OPCODE-1:0] = `DCA_MATRIX_MAC_OPCODE_NO_CAL;
  dca_port_11[`DCA_MATRIX_MAC_OPCODE_INDEX_INIT_ACC] = dca_signal_08;
  dca_port_11[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU0_REQ] = dca_signal_68;
  dca_port_11[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU1_REQ] = dca_signal_20;
  dca_port_11[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU2_REQ] = dca_signal_29;
  dca_port_11[`DCA_MATRIX_MAC_OPCODE_INDEX_LOAD_ACC] = dca_signal_00;
end

assign dca_port_16 = dca_port_05 & dca_signal_68;
assign dca_port_07 = dca_port_05 & dca_signal_20;
assign dca_port_04 = dca_port_05 & dca_signal_10;

assign dca_signal_23 = `DCA_MATRIX_LSU_INST_OPCODE_READ;
assign dca_signal_58 = `DCA_MATRIX_LSU_INST_OPCODE_READ;
assign dca_signal_43 = dca_signal_00? `DCA_MATRIX_LSU_INST_OPCODE_READ : `DCA_MATRIX_LSU_INST_OPCODE_WRITE;

assign dca_port_09 = {dca_signal_39, dca_signal_23};
assign dca_port_01 = {dca_signal_05, dca_signal_58};
assign dca_port_19 = {dca_signal_67, dca_signal_43};

assign dca_port_17 = (dca_signal_30==DCA_LPARA_3);

endmodule

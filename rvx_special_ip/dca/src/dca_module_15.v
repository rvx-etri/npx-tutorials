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




module DCA_MODULE_15
(
  dca_port_01,
  dca_port_04,
  dca_port_22,
  dca_port_17,
  dca_port_11,

  dca_port_07,
  dca_port_15,
  dca_port_18,

  dca_port_05,
  dca_port_10,
  dca_port_08,

  dca_port_09,
  dca_port_19,
  dca_port_03,
  dca_port_21,
  dca_port_06,
  dca_port_02,
  dca_port_13,
  dca_port_00,
  dca_port_12,
  dca_port_20,
  dca_port_16,
  dca_port_14
);




parameter MATRIX_SIZE_PARA = 8;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_include_1.vh"

input wire dca_port_01;
input wire dca_port_04;
input wire dca_port_22;
input wire dca_port_17;
output wire dca_port_11;

localparam  DCA_LPARA_3 = `BW_DCA_MATRIX_MAC_INST;

input wire dca_port_07;
input wire [DCA_LPARA_3-1:0] dca_port_15;
output wire dca_port_18;
input wire dca_port_05;
input wire dca_port_10;
input wire dca_port_08;

input wire dca_port_09;
output wire dca_port_19;
output reg [BW_BLOCKED_STEP_INST-1:0] dca_port_03;

input wire dca_port_21;
output wire dca_port_06;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_02;

input wire dca_port_13;
output wire dca_port_00;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_12;

input wire dca_port_20;
output wire dca_port_16;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_14;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_07;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_12;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_63;
wire [`BW_DCA_MATRIX_MAC_OPCODE-1:0] dca_signal_66;

wire [`BW_DCA_MATRIX_INFO-1:0] dca_signal_67;
wire dca_signal_53;
wire dca_signal_08;
wire dca_signal_58;
reg dca_signal_33;
wire [`BW_DCA_MATRIX_INFO-1:0] dca_signal_49;
wire dca_signal_22;
wire dca_signal_11;
wire dca_signal_35;
wire dca_signal_55;
wire dca_signal_16;
wire dca_signal_09;

wire [`BW_DCA_MATRIX_INFO-1:0] dca_signal_61;
wire dca_signal_64;
wire dca_signal_40;
wire dca_signal_21;
reg dca_signal_46;
wire [`BW_DCA_MATRIX_INFO-1:0] dca_signal_02;
wire dca_signal_30;
wire dca_signal_26;
wire dca_signal_52;
wire dca_signal_37;
wire dca_signal_41;
wire dca_signal_29;

wire [`BW_DCA_MATRIX_INFO-1:0] dca_signal_44;
wire dca_signal_20;
wire dca_signal_43;
wire dca_signal_28;
reg dca_signal_54;
wire [`BW_DCA_MATRIX_INFO-1:0] dca_signal_13;
wire dca_signal_23;
wire dca_signal_60;
wire dca_signal_01;
wire dca_signal_03;
wire dca_signal_00;
wire dca_signal_69;

wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_38;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_45;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_27;

localparam  DCA_LPARA_1 = 1;
localparam  DCA_LPARA_2 = 0;
localparam  DCA_LPARA_0 = 1;

reg [DCA_LPARA_1-1:0] dca_signal_65;
wire dca_signal_57;
wire dca_signal_48;
wire dca_signal_15;
wire dca_signal_47;

reg dca_signal_39;

localparam  DCA_LPARA_4 = 3;

reg [DCA_LPARA_4-1:0] dca_signal_04;
wire dca_signal_70;
wire dca_signal_18;

wire dca_signal_36;
wire dca_signal_14;
wire dca_signal_59;
wire dca_signal_05;
wire dca_signal_32;
wire dca_signal_34;

wire dca_signal_10;
wire dca_signal_50;
wire dca_signal_51;
wire dca_signal_42;
wire dca_signal_17;
wire dca_signal_06;
wire dca_signal_68;
wire dca_signal_56;
wire dca_signal_62;
wire dca_signal_31;

wire [MATRIX_NUM_ROW-1:0] dca_signal_71;
wire [MATRIX_NUM_COL-1:0] dca_signal_24;
wire [MATRIX_MAX_DIM-1:0] dca_signal_25;

wire [MATRIX_NUM_ROW-1:0] dca_signal_19;

assign {dca_signal_66,dca_signal_63,dca_signal_12,dca_signal_07} = dca_port_15;

assign dca_signal_10 = dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_MULT_COND];
assign dca_signal_50 = dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_CONV_COND];
assign dca_signal_51 = dca_signal_10 & dca_signal_22;
assign dca_signal_42 = dca_signal_10 & dca_signal_11;
assign dca_signal_17 = dca_signal_50;
assign dca_signal_06 = dca_signal_50;

assign dca_signal_68 = dca_signal_51 | dca_signal_17;
assign dca_signal_56 = dca_signal_42 | dca_signal_06;

assign dca_signal_62 = dca_signal_16 & dca_signal_00;
assign dca_signal_31 = dca_signal_09 & dca_signal_69;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_0
(
  .clk(dca_port_01),
  .rstnn(dca_port_04),
  .clear(dca_port_22),
  .enable(dca_port_17),

  .matrix_info(dca_signal_67),
  .init(dca_signal_53),
  .is_col_first(dca_signal_08),
  .iterate(dca_signal_58),
  .go_next_base(dca_signal_33),

  .block_info(dca_signal_49),
  .is_first_x(dca_signal_22),
  .is_last_x(dca_signal_11),
  .is_first_y(dca_signal_35),
  .is_last_y(dca_signal_55),
  .is_first_element(dca_signal_16),
  .is_last_element(dca_signal_09),
  .valid_row_list(),
  .valid_col_list()
);

assign dca_signal_67 = dca_signal_07;
assign dca_signal_53 = dca_signal_57;
assign dca_signal_08 = 1;
assign dca_signal_58 = dca_signal_47 & dca_signal_14;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_1
(
  .clk(dca_port_01),
  .rstnn(dca_port_04),
  .clear(dca_port_22),
  .enable(dca_port_17),

  .matrix_info(dca_signal_61),
  .init(dca_signal_64),
  .is_col_first(dca_signal_40),
  .iterate(dca_signal_21),
  .go_next_base(dca_signal_46),

  .block_info(dca_signal_02),
  .is_first_x(dca_signal_30),
  .is_last_x(dca_signal_26),
  .is_first_y(dca_signal_52),
  .is_last_y(dca_signal_37),
  .is_first_element(dca_signal_41),
  .is_last_element(dca_signal_29),
  .valid_row_list(dca_signal_19),
  .valid_col_list()
);

assign dca_signal_61 = dca_signal_12;
assign dca_signal_64 = dca_signal_57;
assign dca_signal_40 = ~dca_signal_10;
assign dca_signal_21 = dca_signal_47 & dca_signal_59;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_2
(
  .clk(dca_port_01),
  .rstnn(dca_port_04),
  .clear(dca_port_22),
  .enable(dca_port_17),

  .matrix_info(dca_signal_44),
  .init(dca_signal_20),
  .is_col_first(dca_signal_43),
  .iterate(dca_signal_28),
  .go_next_base(dca_signal_54),

  .block_info(dca_signal_13),
  .is_first_x(dca_signal_23),
  .is_last_x(dca_signal_60),
  .is_first_y(dca_signal_01),
  .is_last_y(dca_signal_03),
  .is_first_element(dca_signal_00),
  .is_last_element(dca_signal_69),
  .valid_row_list(dca_signal_71),
  .valid_col_list(dca_signal_24)
);

assign dca_signal_44 = dca_signal_63;
assign dca_signal_20 = dca_signal_57;
assign dca_signal_43 = 1;
assign dca_signal_28 = dca_signal_47 & dca_signal_05;

always@(*)
begin
  dca_signal_33 = 0;
  dca_signal_46 = 0;
  dca_signal_54 = 0;
  if(dca_signal_47 && dca_signal_48)
  begin
    if(dca_signal_10)
    begin
      dca_signal_33 = dca_signal_42 & dca_signal_60;
      dca_signal_46 = dca_signal_26;
      dca_signal_54 = dca_signal_42 & dca_signal_60;
    end
    else
    begin
      dca_signal_33 = dca_signal_11;
      dca_signal_46 = dca_signal_26;
      dca_signal_54 = dca_signal_60;
    end
  end
end

assign dca_signal_36 = dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_INIT_ACC] & dca_signal_68;
assign dca_signal_14 = (~dca_signal_32) & dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU0_REQ];
assign dca_signal_59 = (~dca_signal_32) & dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU1_REQ] & (dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_RSRC_CONSTANT]? dca_signal_62 : 1);
assign dca_signal_05 = dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU2_REQ] & (~dca_signal_32) & (dca_signal_10? dca_signal_42 : 1);
assign dca_signal_32 = dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_LOAD_ACC] & (~dca_signal_39);
assign dca_signal_34 = dca_signal_05 | dca_signal_32;

always@(posedge dca_port_01, negedge dca_port_04)
begin
  if(dca_port_04==0)
    dca_signal_65 <= DCA_LPARA_2;
  else if(dca_port_17)
    case(dca_signal_65)
      DCA_LPARA_2:
        if(dca_signal_57)
          dca_signal_65 <= DCA_LPARA_0;
      DCA_LPARA_0:
        if(dca_signal_15)
          dca_signal_65 <= DCA_LPARA_2;
    endcase
end

assign dca_signal_57 = (dca_signal_65==DCA_LPARA_2) & dca_port_07;
assign dca_signal_47 = dca_port_09 & dca_port_19;
assign dca_signal_48 = dca_signal_66[`DCA_MATRIX_MAC_OPCODE_INDEX_LOAD_ACC]? dca_signal_39 : 1;
assign dca_signal_15 = dca_signal_47 & dca_signal_31 & dca_signal_48;

always@(posedge dca_port_01, negedge dca_port_04)
begin
  if(dca_port_04==0)
    dca_signal_39 <= 0;
  else if(dca_signal_47)
  begin
    if(dca_signal_39 && dca_signal_56)
      dca_signal_39 <= 0;
    else if(dca_signal_32)
      dca_signal_39 <= 1;
  end
end

always@(posedge dca_port_01, negedge dca_port_04)
begin
  if(dca_port_04==0)
    dca_signal_04 <= 1;
  else if(dca_signal_18)
  begin
    if(dca_signal_47 & dca_signal_70)
      ;
    else
      dca_signal_04 <= dca_signal_04>>1;
  end
  else if(dca_signal_47 & dca_signal_70)
    dca_signal_04 <= dca_signal_04<<1;
end

assign dca_signal_70 = dca_signal_14 | dca_signal_59 | dca_signal_32;
assign dca_signal_18 = dca_port_05 | dca_port_10 | dca_port_08;

assign dca_port_18 = dca_signal_15;

assign dca_port_19 = (dca_signal_65==DCA_LPARA_0) & dca_port_09 & (dca_signal_14? dca_port_21 : 1) & (dca_signal_59? dca_port_13 : 1) & (dca_signal_34? dca_port_20 : 1) & ((dca_signal_70)? (~dca_signal_04[DCA_LPARA_4-1]) : 1);

assign dca_signal_25 = dca_signal_19;

always@(*)
begin
  dca_port_03 = {dca_signal_25, dca_signal_71, dca_signal_24, dca_signal_31, dca_signal_66};
  if(dca_signal_32)
    dca_port_03[`BW_DCA_MATRIX_MAC_OPCODE-1:0] = `DCA_MATRIX_MAC_OPCODE_NO_CAL;
  dca_port_03[`DCA_MATRIX_MAC_OPCODE_INDEX_INIT_ACC] = dca_signal_36;
  dca_port_03[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU0_REQ] = dca_signal_14;
  dca_port_03[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU1_REQ] = dca_signal_59;
  dca_port_03[`DCA_MATRIX_MAC_OPCODE_INDEX_LSU2_REQ] = dca_signal_05;
  dca_port_03[`DCA_MATRIX_MAC_OPCODE_INDEX_LOAD_ACC] = dca_signal_32;
end

assign dca_port_06 = dca_port_19 & dca_signal_14;
assign dca_port_00 = dca_port_19 & dca_signal_59;
assign dca_port_16 = dca_port_19 & dca_signal_34;

assign dca_signal_38 = `DCA_MATRIX_LSU_INST_OPCODE_READ;
assign dca_signal_45 = `DCA_MATRIX_LSU_INST_OPCODE_READ;
assign dca_signal_27 = dca_signal_32? `DCA_MATRIX_LSU_INST_OPCODE_READ : `DCA_MATRIX_LSU_INST_OPCODE_WRITE;

assign dca_port_02 = {dca_signal_49, dca_signal_38};
assign dca_port_12 = {dca_signal_02, dca_signal_45};
assign dca_port_14 = {dca_signal_13, dca_signal_27};

assign dca_port_11 = (dca_signal_65==DCA_LPARA_0);

endmodule

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




module DCA_MODULE_26
(
  dca_port_18,
  dca_port_10,
  dca_port_07,
  dca_port_15,
  dca_port_02,

  dca_port_16,
  dca_port_12,
  dca_port_04,

  dca_port_09,
  dca_port_01,
  dca_port_00,

  dca_port_05,
  dca_port_11,
  dca_port_19,
  dca_port_22,
  dca_port_06,
  dca_port_08,
  dca_port_20,
  dca_port_17,
  dca_port_21,
  dca_port_14,
  dca_port_13,
  dca_port_03
);




parameter MATRIX_SIZE_PARA = 8;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_include_0.vh"

input wire dca_port_18;
input wire dca_port_10;
input wire dca_port_07;
input wire dca_port_15;
output wire dca_port_02;

localparam  DCA_LPARA_2 = `BW_DCA_NEUGEMM_INST;

input wire dca_port_16;
input wire [DCA_LPARA_2-1:0] dca_port_12;
output wire dca_port_04;
input wire dca_port_09;
input wire dca_port_01;
input wire dca_port_00;

input wire dca_port_05;
output wire dca_port_11;
output reg [BW_BLOCKED_STEP_INST-1:0] dca_port_19;

input wire dca_port_22;
output wire dca_port_06;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_08;

input wire dca_port_20;
output wire dca_port_17;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_21;

input wire dca_port_14;
output wire dca_port_13;
output wire [`BW_DCA_MATRIX_LSU_INST-1:0] dca_port_03;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_00;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_48;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_40;
wire [`BW_DCA_NEUGEMM_OPCODE-1:0] dca_signal_53;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_04;
wire dca_signal_55;
wire dca_signal_20;
wire dca_signal_49;
reg dca_signal_22;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_52;
wire dca_signal_42;
wire dca_signal_61;
wire dca_signal_38;
wire dca_signal_35;
wire dca_signal_31;
wire dca_signal_51;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_67;
wire dca_signal_33;
wire dca_signal_30;
wire dca_signal_64;
reg dca_signal_06;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_39;
wire dca_signal_36;
wire dca_signal_66;
wire dca_signal_54;
wire dca_signal_37;
wire dca_signal_11;
wire dca_signal_68;

wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_57;
wire dca_signal_17;
wire dca_signal_08;
wire dca_signal_32;
reg dca_signal_65;
wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] dca_signal_69;
wire dca_signal_19;
wire dca_signal_03;
wire dca_signal_01;
wire dca_signal_15;
wire dca_signal_41;
wire dca_signal_27;

wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_25;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_58;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_45;

localparam  DCA_LPARA_1 = 1;
localparam  DCA_LPARA_0 = 0;
localparam  DCA_LPARA_3 = 1;

reg [DCA_LPARA_1-1:0] dca_signal_71;
wire dca_signal_07;
wire dca_signal_18;
wire dca_signal_50;
wire dca_signal_10;

reg dca_signal_24;

localparam  DCA_LPARA_4 = 3;

reg [DCA_LPARA_4-1:0] dca_signal_13;
wire dca_signal_14;
wire dca_signal_34;

wire dca_signal_29;
wire dca_signal_59;
wire dca_signal_70;
wire dca_signal_56;
wire dca_signal_21;
wire dca_signal_16;

wire dca_signal_60;
wire dca_signal_09;
wire dca_signal_46;
wire dca_signal_12;
wire dca_signal_47;
wire dca_signal_44;
wire dca_signal_23;
wire dca_signal_63;
wire dca_signal_26;
wire dca_signal_43;

wire [MATRIX_NUM_ROW-1:0] dca_signal_28;
wire [MATRIX_NUM_COL-1:0] dca_signal_62;
wire [MATRIX_MAX_DIM-1:0] dca_signal_05;

wire [MATRIX_NUM_ROW-1:0] dca_signal_02;

assign {dca_signal_53,dca_signal_40,dca_signal_48,dca_signal_00} = dca_port_12;

assign dca_signal_60 = dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_MULT_COND];
assign dca_signal_09 = dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_CONV_COND];
assign dca_signal_46 = dca_signal_60 & dca_signal_42;
assign dca_signal_12 = dca_signal_60 & dca_signal_61;
assign dca_signal_47 = dca_signal_09;
assign dca_signal_44 = dca_signal_09;

assign dca_signal_23 = dca_signal_46 | dca_signal_47;
assign dca_signal_63 = dca_signal_12 | dca_signal_44;

assign dca_signal_26 = dca_signal_31 & dca_signal_41;
assign dca_signal_43 = dca_signal_51 & dca_signal_27;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_2
(
  .clk(dca_port_18),
  .rstnn(dca_port_10),
  .clear(dca_port_07),
  .enable(dca_port_15),

  .matrix_info(dca_signal_04),
  .init(dca_signal_55),
  .is_col_first(dca_signal_20),
  .iterate(dca_signal_49),
  .go_next_base(dca_signal_22),

  .block_info(dca_signal_52),
  .is_first_x(dca_signal_42),
  .is_last_x(dca_signal_61),
  .is_first_y(dca_signal_38),
  .is_last_y(dca_signal_35),
  .is_first_element(dca_signal_31),
  .is_last_element(dca_signal_51),
  .valid_row_list(),
  .valid_col_list()
);

assign dca_signal_04 = dca_signal_00;
assign dca_signal_55 = dca_signal_07;
assign dca_signal_20 = 1;
assign dca_signal_49 = dca_signal_10 & dca_signal_59;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_1
(
  .clk(dca_port_18),
  .rstnn(dca_port_10),
  .clear(dca_port_07),
  .enable(dca_port_15),

  .matrix_info(dca_signal_67),
  .init(dca_signal_33),
  .is_col_first(dca_signal_30),
  .iterate(dca_signal_64),
  .go_next_base(dca_signal_06),

  .block_info(dca_signal_39),
  .is_first_x(dca_signal_36),
  .is_last_x(dca_signal_66),
  .is_first_y(dca_signal_54),
  .is_last_y(dca_signal_37),
  .is_first_element(dca_signal_11),
  .is_last_element(dca_signal_68),
  .valid_row_list(dca_signal_02),
  .valid_col_list()
);

assign dca_signal_67 = dca_signal_48;
assign dca_signal_33 = dca_signal_07;
assign dca_signal_30 = ~dca_signal_60;
assign dca_signal_64 = dca_signal_10 & dca_signal_70;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_0
(
  .clk(dca_port_18),
  .rstnn(dca_port_10),
  .clear(dca_port_07),
  .enable(dca_port_15),

  .matrix_info(dca_signal_57),
  .init(dca_signal_17),
  .is_col_first(dca_signal_08),
  .iterate(dca_signal_32),
  .go_next_base(dca_signal_65),

  .block_info(dca_signal_69),
  .is_first_x(dca_signal_19),
  .is_last_x(dca_signal_03),
  .is_first_y(dca_signal_01),
  .is_last_y(dca_signal_15),
  .is_first_element(dca_signal_41),
  .is_last_element(dca_signal_27),
  .valid_row_list(dca_signal_28),
  .valid_col_list(dca_signal_62)
);

assign dca_signal_57 = dca_signal_40;
assign dca_signal_17 = dca_signal_07;
assign dca_signal_08 = 1;
assign dca_signal_32 = dca_signal_10 & dca_signal_56;

always@(*)
begin
  dca_signal_22 = 0;
  dca_signal_06 = 0;
  dca_signal_65 = 0;
  if(dca_signal_10 && dca_signal_18)
  begin
    if(dca_signal_60)
    begin
      dca_signal_22 = dca_signal_12 & dca_signal_03;
      dca_signal_06 = dca_signal_66;
      dca_signal_65 = dca_signal_12 & dca_signal_03;
    end
    else
    begin
      dca_signal_22 = dca_signal_61;
      dca_signal_06 = dca_signal_66;
      dca_signal_65 = dca_signal_03;
    end
  end
end

assign dca_signal_29 = dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_INIT_ACC] & dca_signal_23;
assign dca_signal_59 = (~dca_signal_21) & dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_LSU0_REQ];
assign dca_signal_70 = (~dca_signal_21) & dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_LSU1_REQ] & (dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_RSRC_CONSTANT]? dca_signal_26 : 1);
assign dca_signal_56 = dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_LSU2_REQ] & (~dca_signal_21) & (dca_signal_60? dca_signal_12 : 1);
assign dca_signal_21 = dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_LOAD_ACC] & (~dca_signal_24);
assign dca_signal_16 = dca_signal_56 | dca_signal_21;

always@(posedge dca_port_18, negedge dca_port_10)
begin
  if(dca_port_10==0)
    dca_signal_71 <= DCA_LPARA_0;
  else if(dca_port_15)
    case(dca_signal_71)
      DCA_LPARA_0:
        if(dca_signal_07)
          dca_signal_71 <= DCA_LPARA_3;
      DCA_LPARA_3:
        if(dca_signal_50)
          dca_signal_71 <= DCA_LPARA_0;
    endcase
end

assign dca_signal_07 = (dca_signal_71==DCA_LPARA_0) & dca_port_16;
assign dca_signal_10 = dca_port_05 & dca_port_11;
assign dca_signal_18 = dca_signal_53[`DCA_NEUGEMM_OPCODE_INDEX_LOAD_ACC]? dca_signal_24 : 1;
assign dca_signal_50 = dca_signal_10 & dca_signal_43 & dca_signal_18;

always@(posedge dca_port_18, negedge dca_port_10)
begin
  if(dca_port_10==0)
    dca_signal_24 <= 0;
  else if(dca_signal_10)
  begin
    if(dca_signal_24 && dca_signal_63)
      dca_signal_24 <= 0;
    else if(dca_signal_21)
      dca_signal_24 <= 1;
  end
end

always@(posedge dca_port_18, negedge dca_port_10)
begin
  if(dca_port_10==0)
    dca_signal_13 <= 1;
  else if(dca_signal_34)
  begin
    if(dca_signal_10 & dca_signal_14)
      ;
    else
      dca_signal_13 <= dca_signal_13>>1;
  end
  else if(dca_signal_10 & dca_signal_14)
    dca_signal_13 <= dca_signal_13<<1;
end

assign dca_signal_14 = dca_signal_59 | dca_signal_70 | dca_signal_21;
assign dca_signal_34 = dca_port_09 | dca_port_01 | dca_port_00;

assign dca_port_04 = dca_signal_50;

assign dca_port_11 = (dca_signal_71==DCA_LPARA_3) & dca_port_05 & (dca_signal_59? dca_port_22 : 1) & (dca_signal_70? dca_port_20 : 1) & (dca_signal_16? dca_port_14 : 1) & ((dca_signal_14)? (~dca_signal_13[DCA_LPARA_4-1]) : 1);

assign dca_signal_05 = dca_signal_02;

always@(*)
begin
  dca_port_19 = {dca_signal_05, dca_signal_28, dca_signal_62, dca_signal_43, dca_signal_53};
  if(dca_signal_21)
    dca_port_19[`BW_DCA_NEUGEMM_OPCODE-1:0] = `DCA_NEUGEMM_OPCODE_NO_CAL;
  dca_port_19[`DCA_NEUGEMM_OPCODE_INDEX_INIT_ACC] = dca_signal_29;
  dca_port_19[`DCA_NEUGEMM_OPCODE_INDEX_LSU0_REQ] = dca_signal_59;
  dca_port_19[`DCA_NEUGEMM_OPCODE_INDEX_LSU1_REQ] = dca_signal_70;
  dca_port_19[`DCA_NEUGEMM_OPCODE_INDEX_LSU2_REQ] = dca_signal_56;
  dca_port_19[`DCA_NEUGEMM_OPCODE_INDEX_LOAD_ACC] = dca_signal_21;
end

assign dca_port_06 = dca_port_11 & dca_signal_59;
assign dca_port_17 = dca_port_11 & dca_signal_70;
assign dca_port_13 = dca_port_11 & dca_signal_16;

assign dca_signal_25 = `DCA_MATRIX_LSU_INST_OPCODE_READ;
assign dca_signal_58 = `DCA_MATRIX_LSU_INST_OPCODE_READ;
assign dca_signal_45 = dca_signal_21? `DCA_MATRIX_LSU_INST_OPCODE_READ : `DCA_MATRIX_LSU_INST_OPCODE_WRITE;

assign dca_port_08 = {dca_signal_52, dca_signal_25};
assign dca_port_21 = {dca_signal_39, dca_signal_58};
assign dca_port_03 = {dca_signal_69, dca_signal_45};

assign dca_port_02 = (dca_signal_71==DCA_LPARA_3);

endmodule

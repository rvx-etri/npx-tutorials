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
`include "fpir_define.vh"




module DCA_MODULE_30
(
  dca_port_0,
  dca_port_3,
  dca_port_7,
  dca_port_2,

  dca_port_4,
  dca_port_1,
  dca_port_5,
  dca_port_8,
  dca_port_6
);




parameter TENSOR_PARA = 0;

`include "dca_tensor_scalar_lpara.vb"

input wire dca_port_0, dca_port_3;
input wire dca_port_7;
input wire dca_port_2;

input wire dca_port_4;
input wire [BW_TENSOR_SCALAR-1:0] dca_port_1;
input wire [BW_TENSOR_SCALAR-1:0] dca_port_5;
output wire dca_port_8;
output wire [BW_TENSOR_SCALAR-1:0] dca_port_6;

localparam  DCA_LPARA_4 = TENSOR_BW_EXPONENT + 1;
localparam  DCA_LPARA_1 = TENSOR_BW_SIGNIFICAND; 
localparam  DCA_LPARA_5 = 2*DCA_LPARA_1-1;

`ifdef PACT_SUPPORT_FLOAT32
localparam  DCA_LPARA_2 = `MAX(TENSOR_BW_INTEGER, (DCA_LPARA_1+1));
`else
localparam  DCA_LPARA_2 = TENSOR_BW_INTEGER;
`endif
localparam  DCA_LPARA_0 = 2*DCA_LPARA_2;

wire dca_signal_07;
reg  [DCA_LPARA_2-1:0] dca_signal_19;
reg  [DCA_LPARA_2-1:0] dca_signal_12;
wire dca_signal_15;
wire dca_signal_14;
wire [DCA_LPARA_0-1:0] dca_signal_24;

wire signed [TENSOR_BW_INTEGER-1:0] dca_signal_03;
wire signed [TENSOR_BW_INTEGER-1:0] dca_signal_25;
wire signed [TENSOR_BW_INTEGER-1:0] dca_signal_04;
wire dca_signal_23;

wire dca_signal_11;
wire dca_signal_09;
wire [`BW_FPIR_TYPE-1:0] dca_signal_20;
wire [TENSOR_BW_SIGNIFICAND-1:0] dca_signal_00;
wire [TENSOR_BW_SIGNIFICAND-1:0] dca_signal_13;
wire [DCA_LPARA_4-1:0] dca_signal_16;

wire dca_signal_01;
wire dca_signal_08;
wire [`BW_FPIR_TYPE-1:0] dca_signal_06;
wire [DCA_LPARA_4-1:0] dca_signal_22;
wire dca_signal_17;

wire [DCA_LPARA_1-1:0] dca_signal_21;
wire [DCA_LPARA_1-1:0] dca_signal_10;
wire [DCA_LPARA_5-1:0] dca_signal_05;

wire dca_signal_02;
wire [BW_TENSOR_SCALAR-1:0] dca_signal_18;

ERVP_PIPELINED_MULTIPLIER
#(
  .BW_INPUT(DCA_LPARA_2),
  .BW_OUTPUT(DCA_LPARA_0),
  .USE_LIBRARY(0)
)
i_dca_instance_0
(
  .clk(dca_port_0),
  .rstnn(dca_port_3),
  .enable(dca_port_7),
  .stall(1'b 0),

  .input_wvalid(dca_signal_07),
  .input_wready(),
  .input_left(dca_signal_19),
  .input_right(dca_signal_12),

  .output_rvalid(dca_signal_15),
  .output_rready(dca_signal_14),
  .output_result(dca_signal_24),
  .output_upper(),
  .output_lower()
);

assign dca_signal_07 = dca_port_2? dca_signal_09 : dca_port_4;
assign dca_signal_14 = 1;

always@(*)
begin
  dca_signal_19 = $signed(dca_signal_03);
  dca_signal_12 = $signed(dca_signal_25);
  if(dca_port_2)
  begin
    dca_signal_19 = $unsigned(dca_signal_21);
    dca_signal_12 = $unsigned(dca_signal_10);
  end
  else
  begin
    dca_signal_19 = $signed(dca_signal_03);
    dca_signal_12 = $signed(dca_signal_25);
  end
end

assign dca_signal_03 = dca_port_1;
assign dca_signal_25 = dca_port_5;
assign dca_signal_23 = dca_signal_15;
assign dca_signal_04 = dca_signal_24;

`ifdef PACT_SUPPORT_FLOAT32

PACT_FMULTIPLIER_PIPELINE1
i_dca_instance_2
(
  .clk(dca_port_0),
  .rstnn(dca_port_3),
  .enable(dca_port_7),

  .in_valid(dca_port_4),
  .in_input0_float(dca_port_1),
  .in_input1_float(dca_port_5),

  .out_valid_early_case(dca_signal_11),
  .out_valid_normal_case(dca_signal_09),

  .out_early_special_case(dca_signal_20),
  .out_input0_significand(dca_signal_00),
  .out_input1_significand(dca_signal_13),
  .out_added_exponent(dca_signal_16)
);

PACT_FMULTIPLIER_PIPELINE2
i_dca_instance_1
(
  .clk(dca_port_0),
  .rstnn(dca_port_3),  
  .enable(dca_port_7),

  .in_valid_early_case(dca_signal_11),
  .in_valid_normal_case(dca_signal_09),
  .in_early_special_case(dca_signal_20),
  .in_input0_significand(dca_signal_00),
  .in_input1_significand(dca_signal_13),
  .in_added_exponent(dca_signal_16),

  .out_multiplier_input0(dca_signal_21),
  .out_multiplier_input1(dca_signal_10),

  .out_valid_early_case(dca_signal_01),
  .out_valid_normal_case(dca_signal_08),
  .out_early_special_case(dca_signal_06),
  .out_added_exponent(dca_signal_22),
  .out_multiplied_sign(dca_signal_17)
);

PACT_FMULTIPLIER_PIPELINE3
i_dca_instance_3
(
  .clk(dca_port_0),
  .rstnn(dca_port_3),
  .enable(dca_port_7),

  .in_valid_early_case(dca_signal_01),
  .in_valid_normal_case(dca_signal_08),
  .in_early_special_case(dca_signal_06),
  .in_added_exponent(dca_signal_22),
  .in_multiplied_sign(dca_signal_17),

  .in_multiplier_output0(dca_signal_05),

  .out_valid(dca_signal_02),
  .out_result(dca_signal_18)
);

assign dca_signal_05 = dca_signal_24;

`endif 

assign dca_port_8 = (dca_port_2)? dca_signal_02 : dca_signal_23;
assign dca_port_6 = (dca_port_2)? dca_signal_18 : $unsigned(dca_signal_04);

endmodule

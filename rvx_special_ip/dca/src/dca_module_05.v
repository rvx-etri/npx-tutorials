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





module DCA_MODULE_05 
(
  dca_port_04,
  dca_port_02,
  dca_port_00,

  dca_port_01,
  dca_port_09,

  dca_port_08,
  dca_port_10,
  
  dca_port_12,
  dca_port_03,

  dca_port_05,
  dca_port_11,
  dca_port_07,
  dca_port_06
);





parameter DCA_GPARA_2 = 10;
parameter DCA_GPARA_0 = 10;
parameter DCA_GPARA_1 = 8;
parameter DCA_GPARA_3 = 8;

input wire dca_port_04;
input wire dca_port_02;
input wire dca_port_00;

input wire [DCA_GPARA_1-1:0] dca_port_01;
input wire [DCA_GPARA_3-1:0] dca_port_09;

input wire dca_port_08;
output wire dca_port_10;

output wire dca_port_12;
output wire dca_port_03;

output wire dca_port_05;
output wire dca_port_11;
output wire dca_port_07;
output wire dca_port_06;

localparam  DCA_LPARA_6 = 2;
localparam  DCA_LPARA_4 = 0;
localparam  DCA_LPARA_2 = 1;
localparam  DCA_LPARA_1 = 2;

reg [DCA_LPARA_6-1:0] dca_signal_18;
wire dca_signal_06;

localparam  DCA_LPARA_3 = DCA_GPARA_1;

reg [DCA_LPARA_3-1:0] dca_signal_05;
wire dca_signal_04;

wire dca_signal_07;
wire dca_signal_20;
wire [DCA_LPARA_3-1:0] dca_signal_10;
wire dca_signal_09;

localparam  DCA_LPARA_5 = DCA_GPARA_3 + 1;

reg [DCA_LPARA_5-1:0] dca_signal_00;
reg [DCA_LPARA_5-1:0] dca_signal_08;
wire dca_signal_14;
wire dca_signal_17;

wire dca_signal_11;
wire dca_signal_03;
wire [DCA_LPARA_5-1:0] dca_signal_15;
wire dca_signal_12;

localparam  DCA_LPARA_0 = `MAX(DCA_GPARA_0,DCA_GPARA_2);

wire dca_signal_16;
wire dca_signal_19;
wire [DCA_LPARA_0-1:0] dca_signal_13;

wire dca_signal_02;
wire dca_signal_01;

always@(posedge dca_port_04, negedge dca_port_02)
begin
  if(dca_port_02==0)
    dca_signal_18 <= DCA_LPARA_4;
  else if(dca_port_00)
  begin
    if(dca_port_10)
      dca_signal_18 <= DCA_LPARA_4;
    else if(dca_port_08)
      dca_signal_18 <= DCA_LPARA_1;
    else if(dca_signal_20)
      dca_signal_18 <= DCA_LPARA_2;
    else if(dca_signal_18==DCA_LPARA_2)
      dca_signal_18 <= DCA_LPARA_1;
  end
end

assign dca_signal_06 = (dca_signal_18==DCA_LPARA_1);

always@(posedge dca_port_04, negedge dca_port_02)
begin
  if(dca_port_02==0)
    dca_signal_05 <= 0;
  else if(dca_port_00)
  begin
    if(dca_port_08)
      dca_signal_05 <= dca_port_01;
    else if(dca_signal_20)
      dca_signal_05 <= (dca_signal_05>>1);
  end
end

assign dca_signal_04 = dca_signal_06 & dca_signal_05[0];

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(DCA_LPARA_3),
  .UP(1),
  .RESET_INDEX(0),
  .CIRCULAR(1)
)
i_dca_instance_2
(
  .clk(dca_port_04),
  .rstnn(dca_port_02),
  .enable(dca_port_00),
  .init(dca_signal_07),
  .count(dca_signal_20),
  .value(dca_signal_10),
  .is_first_count(),
  .is_last_count(dca_signal_09)
);

assign dca_signal_07 = dca_port_08;
assign dca_signal_20 = dca_signal_03 & dca_signal_12;

always@(posedge dca_port_04, negedge dca_port_02)
begin
  if(dca_port_02==0)
    dca_signal_00 <= 0;
  else if(dca_port_00)
  begin
    if(dca_port_08 || dca_signal_20)
      dca_signal_00 <= dca_port_09;
    else if(dca_signal_03)
      dca_signal_00 <= (dca_signal_00>>1);
  end
end

assign dca_signal_14 =  dca_signal_04 & dca_signal_00[0];

always@(posedge dca_port_04, negedge dca_port_02)
begin
  if(dca_port_02==0)
    dca_signal_08 <= 0;
  else if(dca_port_00)
  begin
    if(dca_port_08 || dca_signal_20)
      dca_signal_08 <= {dca_port_09,1'b 0};
    else if(dca_signal_03)
      dca_signal_08 <= (dca_signal_08>>1);
  end
end

assign dca_signal_17 = dca_signal_04 & dca_signal_08[0];

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(DCA_LPARA_5),
  .UP(1),
  .RESET_INDEX(0),
  .CIRCULAR(1)
)
i_dca_instance_0
(
  .clk(dca_port_04),
  .rstnn(dca_port_02),
  .enable(dca_port_00),
  .init(dca_signal_11),
  .count(dca_signal_03),
  .value(dca_signal_15),
  .is_first_count(),
  .is_last_count(dca_signal_12)
);

assign dca_signal_11 = dca_port_08 | dca_signal_20;
assign dca_signal_03 = dca_signal_06 & dca_signal_01;
assign dca_signal_02 = dca_signal_14 | dca_signal_17;
assign dca_signal_01 = dca_signal_02? dca_signal_13[DCA_LPARA_0-1] : 1;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(DCA_LPARA_0),
  .UP(1),
  .RESET_INDEX(0),
  .CIRCULAR(1)
)
i_dca_instance_1
(
  .clk(dca_port_04),
  .rstnn(dca_port_02),
  .enable(dca_port_00),
  .init(dca_signal_16),
  .count(dca_signal_19),
  .value(dca_signal_13),
  .is_first_count(),
  .is_last_count()
);

assign dca_signal_16 = dca_port_08;
assign dca_signal_19 = dca_signal_02;

assign dca_port_12 = dca_signal_14 & dca_signal_13[0];
assign dca_port_03 = dca_signal_17 & dca_signal_13[0];

assign dca_port_10 = dca_signal_20 & dca_signal_09;

assign dca_port_05 = dca_signal_06 & dca_signal_12 & dca_signal_13[0];
assign dca_port_11 = dca_signal_06 & (~dca_signal_12) & dca_signal_13[0];
assign dca_port_07 = dca_signal_14 & dca_signal_13[DCA_GPARA_2-1];
assign dca_port_06 = dca_signal_17 & dca_signal_13[DCA_GPARA_0-1];

endmodule

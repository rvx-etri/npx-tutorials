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
`include "ervp_axi_define.vh"




module DCA_MODULE_10
(
  dca_port_02,
  dca_port_14,
  dca_port_12,
  dca_port_15,
  dca_port_11,

  dca_port_08,
  dca_port_01,

  dca_port_06,
  dca_port_00,
  dca_port_04,
  dca_port_09,

  dca_port_10,
  dca_port_07,
  dca_port_13,
  dca_port_03,
  dca_port_05
);




parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter MATRIX_SIZE_PARA = 4;
parameter BW_LPI_BURDEN = 1;
parameter DCA_GPARA_0 = 4;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"

input wire dca_port_02;
input wire dca_port_14;
input wire dca_port_12;
input wire dca_port_15;
output wire dca_port_11;

input wire dca_port_08;
output wire dca_port_01;

input wire dca_port_06;
input wire dca_port_00;
input wire dca_port_04;
input wire dca_port_09;

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = BW_AXI_ADDR;
localparam  BW_LPIXM_DATA = BW_AXI_DATA;

`include "lpixm_lpara.vb"

output wire [2-1:0] dca_port_10;
input wire dca_port_07;
input wire dca_port_13;
input wire dca_port_03;
input wire [BW_LPI_YDATA-1:0] dca_port_05;

wire [BW_LPI_BURDEN-1:0] dca_signal_0;
wire dca_signal_2;

localparam  DCA_LPARA_0 = DCA_GPARA_0;

wire dca_signal_4;
wire dca_signal_1;
reg [DCA_LPARA_0-1:0] dca_signal_3;

assign dca_signal_0 = dca_port_05[BW_LPI_YDATA-1-:BW_LPI_BURDEN];
assign dca_signal_2 = dca_signal_0;

always@(posedge dca_port_02, negedge dca_port_14)
begin
  if(dca_port_14==0)
    dca_signal_3 <= 0;
  else if(dca_port_12)
    dca_signal_3 <= 0;
  else if(dca_port_15)
  begin
    if(dca_signal_4 && (~dca_signal_1))
      dca_signal_3 <= {dca_signal_3,1'b 1};
    else if(dca_signal_1 && (~dca_signal_4))
      dca_signal_3 <= {1'b 0,dca_signal_3[DCA_LPARA_0-1:1]};
  end
end

assign dca_signal_4 = dca_port_00 & dca_port_06 & dca_port_04;
assign dca_signal_1 = dca_port_07 & dca_port_10[0] & dca_port_03;

assign dca_port_10[1] = 0;
assign dca_port_10[0] = (~dca_port_08) & dca_signal_3[0];

assign dca_port_01 = dca_signal_1 & dca_signal_2;
assign dca_port_11 = dca_signal_3[0];

endmodule

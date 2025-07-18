// dca_matrix_lsu_inst.vh
// ervp_axi_lpara.vb
// dca_matrix_dim_lpara.vb
// dca_lsu_util.vb
// LSU_PARA

localparam LSU_PARA_0_AFTER = LSU_PARA;

localparam LSU_PARA_1_ANDSOON = LSU_PARA_0_AFTER;
localparam LSU_PARA_1_AFTER = LSU_PARA_1_ANDSOON >> LSU_PARA_1_BIT;
localparam _MAX_BW_MEMORY_SINGLE_TEMP = LSU_PARA_1_ANDSOON % (2**LSU_PARA_1_BIT);
localparam MAX_BW_MEMORY_SINGLE_DEFAULT = 32;
localparam MAX_BW_MEMORY_SINGLE = (_MAX_BW_MEMORY_SINGLE_TEMP==0)? MAX_BW_MEMORY_SINGLE_DEFAULT : _MAX_BW_MEMORY_SINGLE_TEMP;

localparam LSU_PARA_2_ANDSOON = LSU_PARA_1_AFTER;
localparam LSU_PARA_2_AFTER = LSU_PARA_2_ANDSOON >> LSU_PARA_2_BIT;
localparam _MEMORY_OPERATION_TYPE_TEMP = LSU_PARA_2_ANDSOON % (2**LSU_PARA_2_BIT);
localparam MEMORY_OPERATION_TYPE_DEFAULT = 3;
localparam MEMORY_OPERATION_TYPE = (_MEMORY_OPERATION_TYPE_TEMP==0)? MEMORY_OPERATION_TYPE_DEFAULT : _MEMORY_OPERATION_TYPE_TEMP;

localparam LSU_PARA_3_ANDSOON = LSU_PARA_2_AFTER;
localparam LSU_PARA_3_AFTER = LSU_PARA_3_ANDSOON >> LSU_PARA_3_BIT;
localparam _BYTE_SUPPORT_TYPE_TEMP = LSU_PARA_3_ANDSOON % (2**LSU_PARA_3_BIT);
localparam BYTE_SUPPORT_TYPE_DEFAULT = 3;
localparam BYTE_SUPPORT_TYPE = (_BYTE_SUPPORT_TYPE_TEMP==0)? BYTE_SUPPORT_TYPE_DEFAULT : _BYTE_SUPPORT_TYPE_TEMP;

localparam LSU_PARA_4_ANDSOON = LSU_PARA_3_AFTER;
localparam LSU_PARA_4_AFTER = LSU_PARA_4_ANDSOON >> LSU_PARA_4_BIT;
localparam _INST_FIFO_DEPTH_TEMP = LSU_PARA_4_ANDSOON % (2**LSU_PARA_4_BIT);
localparam INCLUDE_INST_FIFO = 1;
localparam INST_FIFO_DEPTH = (_INST_FIFO_DEPTH_TEMP<2)? 2 : _INST_FIFO_DEPTH_TEMP;

// extension

localparam LSU_SUPPORT_MULTIBYTE = (BYTE_SUPPORT_TYPE&1)!=0;
localparam LSU_SUPPORT_SUBBYTE = (BYTE_SUPPORT_TYPE&2)!=0;

localparam MAX_BW_MEMORY_ROW = (MATRIX_NUM_COL*MAX_BW_MEMORY_SINGLE);
localparam MAX_NUM_AXI_DATA = `DIVIDERU(MAX_BW_MEMORY_ROW,BW_AXI_DATA)+1;
localparam BW_MEMORY_ROW_BUFFER = BW_AXI_DATA*MAX_NUM_AXI_DATA;

localparam BW_LSU_ELEMENT = MAX_BW_MEMORY_SINGLE+1;
localparam BW_LSU_ELEMENT_ROW = BW_LSU_ELEMENT*MATRIX_NUM_COL;

// etc
localparam BW_BITADDR = BW_AXI_ADDR+3;
localparam BW_BITADDR_OFFSET = BW_AXI_ADDR_OFFSET+3;

localparam BW_TXN_INFO = 1 + 1 + `BW_AXI_ALEN + BW_BITADDR;
localparam BW_RRESP_INFO = MATRIX_NUM_COL + `BW_DCA_MATRIX_LSU_INST;
localparam BW_WDATA_INFO = MATRIX_NUM_COL + `BW_DCA_MATRIX_LSU_INST;

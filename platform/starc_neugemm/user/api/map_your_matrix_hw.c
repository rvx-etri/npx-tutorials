#include "platform_info.h"
#include "ervp_assert.h"
#include "ervp_printf.h"
#include "ervp_blocked_matrix_op.h"

#include "ip_instance_info.h"
#include "dca_neugemm.h"

#include "map_your_matrix_hw.h"

const char matrix_hw_name[] = "DCA";

ervp_task_wait_fx_t i_dca_neugemm00_add(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neugemm_add(mop_mapping, i_dca_neugemm00_info, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_dca_neugemm00_sub(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neugemm_sub(mop_mapping, i_dca_neugemm00_info, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_dca_neugemm00_ewmult(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neugemm_ewmult(mop_mapping, i_dca_neugemm00_info, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_dca_neugemm00_mult(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neugemm_mult(mop_mapping, i_dca_neugemm00_info, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_dca_neugemm00_scalar_mult_fixed(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, int scalar_value, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return dca_neugemm_scalar_mult_fixed(mop_mapping, i_dca_neugemm00_info, ma_info, scalar_value, mc_info, option_value);
}

ervp_task_wait_fx_t i_dca_neugemm00_conv_oneblock(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int conv_option_value)
{
  return dca_neugemm_conv_oneblock(mop_mapping, i_dca_neugemm00_info, ma_info, mb_info, mc_info, conv_option_value);
}

////////////////////////////////////////////////////////////////////////////

static ervp_blocked_matrix_info_t* blocked_info_neugemm;

ervp_task_wait_fx_t i_blocked_matrix_add(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return blocked_matrix_add(blocked_info_neugemm, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_blocked_matrix_sub(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return blocked_matrix_sub(blocked_info_neugemm, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_blocked_matrix_ewmult(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return blocked_matrix_ewmult(blocked_info_neugemm, ma_info, mb_info, mc_info, option_value);
}

ervp_task_wait_fx_t i_blocked_matrix_mult(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int option_value)
{
  return blocked_matrix_mult(blocked_info_neugemm, ma_info, mb_info, mc_info, option_value);
}

////////////////////////////////////////////////////////////////////////////

static ervp_blocked_matrix_info_t* blocked_info_conv;

ervp_task_wait_fx_t i_blocked_matrix_conv(ervp_mop_mapping_t *mop_mapping, const ErvpMatrixInfo *ma_info, const ErvpMatrixInfo *mb_info, ErvpMatrixInfo *mc_info, unsigned int conv_option_value)
{
  return blocked_matrix_conv(blocked_info_conv, ma_info, mb_info, mc_info, conv_option_value);
}

////////////////////////////////////////////////////////////////////////////

void map_your_matrix_function(ervp_mop_mapping_t* mop_mapping)
{
  /* map your own functions */
  blocked_info_neugemm = blocked_matrix_info_alloc();
  blocked_info_neugemm->block_size = i_dca_neugemm00_info->num_col;
  blocked_info_neugemm->subop_mapping = matrix_op_mapping_alloc();
  blocked_info_neugemm->subop_mapping->matrix_add = i_dca_neugemm00_add;
  blocked_info_neugemm->subop_mapping->matrix_sub = i_dca_neugemm00_sub;
  blocked_info_neugemm->subop_mapping->matrix_ewmult = i_dca_neugemm00_ewmult;
  blocked_info_neugemm->subop_mapping->matrix_mult = i_dca_neugemm00_mult;
  blocked_info_neugemm->subop_mapping->matrix_scalar_mult_fixed = i_dca_neugemm00_scalar_mult_fixed;

  blocked_info_conv = blocked_matrix_info_alloc();
  blocked_info_conv->block_size = i_dca_neugemm00_info->num_col;
  blocked_info_conv->subop_mapping = matrix_op_mapping_alloc();
  blocked_info_conv->subop_mapping->matrix_add = i_dca_neugemm00_add;
  blocked_info_conv->subop_mapping->matrix_sub = i_dca_neugemm00_sub;
  blocked_info_conv->subop_mapping->matrix_ewmult = i_dca_neugemm00_ewmult;
  blocked_info_conv->subop_mapping->matrix_mult = i_dca_neugemm00_mult;
  blocked_info_conv->subop_mapping->matrix_scalar_mult_fixed = i_dca_neugemm00_scalar_mult_fixed;
  blocked_info_conv->subop_mapping->matrix_conv = i_dca_neugemm00_conv_oneblock;
#if 1
  mop_mapping->matrix_add = i_dca_neugemm00_add;
  mop_mapping->matrix_sub = i_dca_neugemm00_sub;
  mop_mapping->matrix_ewmult = i_dca_neugemm00_ewmult;
  mop_mapping->matrix_mult = i_dca_neugemm00_mult;
#else
  mop_mapping->matrix_add = i_blocked_matrix_add;
  mop_mapping->matrix_sub = i_blocked_matrix_sub;
  mop_mapping->matrix_ewmult = i_blocked_matrix_ewmult;
  mop_mapping->matrix_mult = i_blocked_matrix_mult;
#endif
  mop_mapping->matrix_scalar_mult_fixed = i_dca_neugemm00_scalar_mult_fixed;
  mop_mapping->matrix_conv = i_blocked_matrix_conv;
}

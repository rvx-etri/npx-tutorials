#include "platform_info.h"
#include "ervp_printf.h"
#include "ervp_printf_section.h"
#include "ervp_core_id.h"
#include "map_your_matrix_hw.h"

#include "npx_parser.h"
#include "npx_network.h"
#include "npx_sample.h"
#include "npx_preprocess.h"

#define FNAME_MAX 256

char app_name[FNAME_MAX] = "mnist_app";

char net_fname[FNAME_MAX];
char opt_fname[FNAME_MAX];
char parameter_fname[FNAME_MAX];
char sample_fname[FNAME_MAX];
char tv_fname[FNAME_MAX];
char pre_fname[FNAME_MAX];

#define SKIP_SIM 1

int main()
{
  if (EXCLUSIVE_ID == 0)
  {
    ervp_mop_mapping_t* mop_mapping = matrix_op_mapping_alloc();
    map_your_matrix_function(mop_mapping);

    int sample_index = 0;
    sprintf(net_fname, "%s_network.cfg", app_name);
    sprintf(opt_fname, "%s_operator.cfg", app_name);
    sprintf(pre_fname, "%s_preprocess.cfg", app_name);
    sprintf(parameter_fname, "%s_parameter_quant.bin", app_name);

    printf_section(SKIP_SIM, "Verify NPX: %s", net_fname);

    npx_network_t *net = npx_parse_network_cfg(net_fname, opt_fname);
    npx_network_load_parameters(net, parameter_fname);
    npx_network_map_matrix_operator(net, -1, mop_mapping);
    npx_network_print(net);

    while (1)
    {
      sprintf(sample_fname, "%s_sample_%03d.bin", app_name, sample_index);
      if (!fakefile_exists(sample_fname))
        break;
      printf_subsection(SKIP_SIM, "Iteration %d", sample_index);
      npx_network_reset(net);
      const npx_rawinput_t *npx_sample = npx_load_sample(sample_fname, pre_fname);
      const npx_layerio_tsseq_t *input_tsseq = npx_preprocess(pre_fname, net, npx_sample->tensor, npx_sample->scaled);
      sprintf(tv_fname, "%s_layeroutput_%03d.bin", app_name, sample_index);
      npx_testvector_t *tv = npx_load_testvector(tv_fname, net);

      npx_layerio_state_t state;
      state.input_tsseq = input_tsseq;
      state.output_tsseq = NULL;

      for (int layer_index = 0; layer_index < net->num_layer; layer_index++)
      {
        state.output_tsseq = npx_inference(net, state.input_tsseq, layer_index, layer_index + 1);
        assert(state.output_tsseq != NULL);
        npx_verify_with_testvector(state.output_tsseq, tv, layer_index);
        state.input_tsseq = state.output_tsseq;
        state.output_tsseq = NULL;
      }
      sample_index++;
    }
  }

  return 0;
}

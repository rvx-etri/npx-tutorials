## ****************************************************************************
## ****************************************************************************
## Copyright SoC Design Research Group, All rights reserved.    
## Electronics and Telecommunications Research Institute (ETRI)
##
## THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
## WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
## TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
## REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
## SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
## IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
## COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
## ****************************************************************************
## 2024-08-12
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

ifdef RVX_MINI_HOME
	include ${RVX_MINI_HOME}/rvx_config.mh
else
	include ${RVX_DEVKIT_HOME}/rvx_config.mh
endif

TEMPLATE_FILE = ${RVX_ENV}/util/Makefile.npx.template
include ${RVX_UTIL_HOME}/template_makefile.mh

-include ./rvx_each.mh

PLATFORM_DIR = $(call absolute_path,${CURDIR}/../..)

UTIL_DIR = ${PLATFORM_DIR}/util
FAKEFIE_DIR = ${UTIL_DIR}/fakefile
USER_DIR = ${PLATFORM_DIR}/user
API_DIR = ${USER_DIR}/api
SSW_INFO_FILE = ${PLATFORM_DIR}/arch/ssw/src/ssw_info.h

ifndef APP_CFG_DIR
APP_CFG_DIR=${CURDIR}/app
endif
APP_CFG_DIR_ABS = $(call absolute_path,${APP_CFG_DIR})
ALL_CFG_LIST=$(wildcard ${APP_CFG_DIR_ABS}/*.cfg)
ALL_APP_CFG_LIST = $(filter-out %_preprocess.cfg, $(ALL_CFG_LIST))
ALL_APP_CFG_NAME_LIST=$(basename $(notdir ${ALL_APP_CFG_LIST}))

ifndef PARA_DIR
PARA_DIR=${CURDIR}/result
endif
PARA_DIR_ABS = $(call absolute_path,${PARA_DIR})

check:
	@echo ${XARVIS_NPX_TRANIER_HOME}
	@echo ${APP_CFG_DIR_ABS}
	@echo ${ALL_APP_CFG_NAME_LIST}
	@echo ${PARA_DIR_ABS}

config:
	@echo ${XARVIS_HOME}
	@echo "source ${XARVIS_HOME}/rvx_setup.sh" > rvx_setup.sh

clean:
	@true

NUM_SAMPLE=1

check_train_home:
	$(if $(XARVIS_NPX_TRANIER_HOME), , $(error XARVIS_NPX_TRANIER_HOME is NOT defined))

app_list:
	@echo ${ALL_APP_CFG_NAME_LIST}

all: ${ALL_APP_CFG_NAME_LIST}

${ALL_APP_CFG_NAME_LIST}:%: check_train_home %.train %.riscv %.sample %.opt %.file_gen

$(addsuffix .train, ${ALL_APP_CFG_NAME_LIST}):%.train:
ifdef XARVIS_NPX_TRANIER_HOME
	cd ${XARVIS_NPX_TRANIER_HOME} && make train CFG_FILE="${APP_CFG_DIR_ABS}/$(*).cfg" RESULT_DIR=${PARA_DIR_ABS}
endif

$(addsuffix .riscv, ${ALL_APP_CFG_NAME_LIST}):%.riscv:
ifdef XARVIS_NPX_TRANIER_HOME
	cd ${XARVIS_NPX_TRANIER_HOME} && make riscv CFG_FILE="${APP_CFG_DIR_ABS}/$(*).cfg" RESULT_DIR=${PARA_DIR_ABS}
endif

$(addsuffix .sample, ${ALL_APP_CFG_NAME_LIST}):%.sample:
ifdef XARVIS_NPX_TRANIER_HOME
	-rm -rf ${PARA_DIR_ABS}/$(*)/riscv/*_sample_*.*
	-rm -rf ${PARA_DIR_ABS}/$(*)/riscv/*_layeroutput_*.*
	cd ${XARVIS_NPX_TRANIER_HOME} && make sample CFG_FILE="${APP_CFG_DIR_ABS}/$(*).cfg" RESULT_DIR=${PARA_DIR_ABS} NUM_SAMPLE=${NUM_SAMPLE}
endif

$(addsuffix .tv, ${ALL_APP_CFG_NAME_LIST}):%.tv:
ifdef XARVIS_NPX_TRANIER_HOME
	-rm -rf ${PARA_DIR_ABS}/$(*)/riscv/*_sample_*.*
	-rm -rf ${PARA_DIR_ABS}/$(*)/riscv/*_layeroutput_*.*
	cd ${XARVIS_NPX_TRANIER_HOME} && make tv CFG_FILE="${APP_CFG_DIR_ABS}/$(*).cfg" RESULT_DIR=${PARA_DIR_ABS} NUM_SAMPLE=${NUM_SAMPLE}
endif

$(addsuffix .opt, ${ALL_APP_CFG_NAME_LIST}):%.opt:
	cd ${RVX_ENV}/util && ${PYTHON3_CMD} ./generate_npx_operator_info.py -cfg "${APP_CFG_DIR_ABS}/$(*).cfg" -ssw_info ${SSW_INFO_FILE} -o ${PARA_DIR_ABS} -s _operator

$(addsuffix .file_gen, ${ALL_APP_CFG_NAME_LIST}):%.file_gen: %.api_clean
	cd ${UTIL_DIR} && make fakefile
	cd ${FAKEFIE_DIR} && make convert FILE_LIST="${APP_CFG_DIR_ABS}/$(*)_preprocess.cfg" RESULT_DIR=${API_DIR}
	cd ${FAKEFIE_DIR} && make convert FILE_LIST="${PARA_DIR_ABS}/$(*)/riscv/$(*)*.bin" RESULT_DIR=${API_DIR}
	cd ${FAKEFIE_DIR} && make convert FILE_LIST="${PARA_DIR_ABS}/$(*)/riscv/$(*)*.cfg" RESULT_DIR=${API_DIR}

$(addsuffix .api_clean, ${ALL_APP_CFG_NAME_LIST}):%.api_clean:
	-cd ${API_DIR} && rm -rf $(*)_*_file.*

api_clean: $(addsuffix .api_clean, ${ALL_APP_CFG_NAME_LIST})

$(addsuffix .only, ${ALL_APP_CFG_NAME_LIST}):%.only: api_clean %.train %.riscv %.sample %.opt %.file_gen

$(addsuffix .verify, ${ALL_APP_CFG_NAME_LIST}):%.verify: api_clean %.train %.riscv %.tv %.opt %.file_gen

verify:
	make verify_app.verify NUM_SAMPLE=3

FORCE:

.PHONY: FORCE clean api_clean $(addsuffix .api_clean, ${ALL_APP_CFG_NAME_LIST})

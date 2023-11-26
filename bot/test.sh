#!/bin/bash

source scripts/utils.sh
source scripts/cfg_files.sh

job_dir=${PWD}
job_out="slurm-${SLURM_JOB_ID}.out"
resume_dir=$(grep "to resume session add" ${job_dir}/${job_out} | head -1 | sed "s@.*'--resume \([^']*\)'.*@\1@g")

cfg_load cfg/job.cfg
export EESSI_SOFTWARE_SUBDIR_OVERRIDE=$(cfg_get_value "architecture" "software_subdir")

export EESSI_REPOS_CFG_DIR_OVERRIDE=${HOME}/bot-configs/mc-aws-rocky88-202310/repos

./eessi_container.sh --verbose --access rw --mode run --container docker://ghcr.io/eessi/build-node:debian11 --repository eessi.io-2023.06-software --storage /tmp/${USER}/EESSI --resume ${resume_dir} tests/EasyBuild/test-eb.sh

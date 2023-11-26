#!/bin/bash

job_dir=${PWD}
job_out="slurm-${SLURM_JOB_ID}.out"
resume_opt=$(grep "to resume session add" ${job_dir}/${job_out} | head -1 | sed "s@.*'\(--resume [^']*\)'.*@\1@g")

export EESSI_REPOS_CFG_DIR=${HOME}/bot-configs/mc-aws-rocky88-202310/repos

./eessi_container.sh --verbose --access rw --mode run --container docker://ghcr.io/eessi/build-node:debian11 --repository eessi.io-2023.06-software --storage /tmp/${USER}/EESSI ${resume_opt} tests/EasyBuild/test-eb.sh

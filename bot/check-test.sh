#!/bin/bash

job_dir=${PWD}
job_out="slurm-${SLURM_JOB_ID}.out"
job_test_result_file=_bot_job${SLURM_JOB_ID}.test

grep_out=$(grep '^All checks PASSED' ${job_dir}/${job_out})
all_checks_passed=$?

if [[ ${all_checks_passed}} -eq 0 ]]; then
    status="SUCCESS"
else
    status="FAILURE"
fi

echo "[RESULT]" > ${job_result_file}
echo -n "comment_description = " >> ${job_result_file}
echo "all checks pass for test phase" >> ${job_result_file}
echo "status = ${status}" >> ${job_result_file}

test "${status}" == "SUCCESS"
exit $?

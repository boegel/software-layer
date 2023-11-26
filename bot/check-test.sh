#!/bin/bash

job_dir=${PWD}
job_out="slurm-${SLURM_JOB_ID}.out"
job_test_result_file=_bot_job${SLURM_JOB_ID}.test

grep_out=$(grep '^All checks PASSED' ${job_dir}/${job_out})
all_checks_passed=$?

if [[ ${all_checks_passed} -eq 0 ]]; then
    comment_description="all checks pass in test phase"
    status="SUCCESS"
else
    comment_description="some checks FAILED in test phase"
    status="FAILURE"
fi

echo "[RESULT]" > ${job_test_result_file}
echo -n "comment_description = " >> ${job_test_result_file}
echo "${comment_description}" >> ${job_test_result_file}
echo "status = ${status}" >> ${job_test_result_file}

test "${status}" == "SUCCESS"
exit $?

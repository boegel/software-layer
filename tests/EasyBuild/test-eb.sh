#!/bin/bash

set -e

source /cvmfs/software.eessi.io/versions/${EESSI_VERSION}/init/bash

module load EasyBuild
eb --version

echo "All checks for test phase PASSED"

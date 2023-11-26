#!/bin/bash

set -e

source /cvmfs/software.eessi.io/versions/${EESSI_VERSION}/init/bash

module load EasyBuild
eb --version

find /cvmfs/software.eessi.io/versions/${EESSI_VERSION}/software/linux/$(uname -m) -type d

echo "All checks for test phase PASSED"

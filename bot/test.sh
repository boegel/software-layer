#!/bin/bash

set -e

source /cvmfs/software.eessi.io/versions/2023.06/init/bash

module load EasyBuild/4.8.2
eb --version

echo "All checks for test phase PASSED"

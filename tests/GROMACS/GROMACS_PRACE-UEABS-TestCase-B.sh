#!/bin/bash

# see https://repository.prace-ri.eu/git/UEABS/ueabs/#gromacs

if [ ! -f lignocellulose-rf.tpr ]; then
    curl -OL https://repository.prace-ri.eu/ueabs/GROMACS/1.2/GROMACS_TestCaseB.tar.gz
    tar xfvz GROMACS_TestCaseB.tar.gz
fi

export WORKDIR=/tmp/$USER/$$
mkdir -p $WORKDIR
cp lignocellulose-rf.tpr $WORKDIR
cd $WORKDIR
echo "working directory: $WORKDIR"

module load GROMACS/2020.1-foss-2020a-Python-3.8.2

export OMP_NUM_THREADS=36

gmx mdrun -s lignocellulose-rf.tpr -maxh 0.50 -resethway -noconfout -nsteps 10000 -g logfile

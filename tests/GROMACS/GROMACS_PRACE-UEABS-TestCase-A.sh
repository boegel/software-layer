#!/bin/bash

# see https://repository.prace-ri.eu/git/UEABS/ueabs/#gromacs

if [ ! -f ion_channel.tpr ]; then
    curl -OL https://repository.prace-ri.eu/ueabs/GROMACS/1.2/GROMACS_TestCaseA.tar.gz
    tar xfvz GROMACS_TestCaseA.tar.gz
fi

export WORKDIR=/tmp/$USER/$$
mkdir -p $WORKDIR
cp ion_channel.tpr $WORKDIR
cd $WORKDIR
echo "working directory: $WORKDIR"

module load GROMACS/2020.1-foss-2020a-Python-3.8.2

export OMP_NUM_THREADS=36

gmx mdrun -s ion_channel.tpr -maxh 0.50 -resethway -noconfout -nsteps 10000 -g logfile

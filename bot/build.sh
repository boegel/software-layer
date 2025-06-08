#!/usr/bin/env bash
#
# Script to prepare for building EESSI software layer.
#
# Clones EESSI/software-layer-scripts repository,
# symlinks scripts and files from there into current (working) directory,
# and then calls out to bot/build.sh script located in there.
#
# This script is part of the EESSI software layer, see
# https://github.com/EESSI/software-layer.git
#
# author: Kenneth Hoste (HPC-UGent)
#
# license: GPLv2
#

# give up as soon as any error occurs
set -e

# FIXME: should clone from EESSI not boegel
git clone https://github.com/boegel/software-layer-scripts

# symlink everything, except for:
# - common files like LICENSE and README.md
# - 'bot' subdirectory, there we need to be a bit more careful (see below)
for file in $(ls software-layer-scripts | egrep -v 'LICENSE|README.md|^bot'); do
    ln -s software-layer-scripts/${file}
done

# symlink all scripts in 'bot' subdirectory, except for bot/build.sh
for file in $(ls software-layer-scripts/bot | grep -v '^build.sh'); do
    ln -s ../software-layer-scripts/bot/${file} bot/${file}
done

# call out to bot/build.sh script from software-layer-scripts
software-layer-scripts/bot/build.sh

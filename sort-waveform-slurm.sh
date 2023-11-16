#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=1:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --cpus-per-task=5	# number of processors per task
#SBATCH -J "sort-waveform-slurm"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o sws.%N.%j.out # STDOUT
#SBATCH -e sws.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
/data/miniconda3/bin/conda init
source ~/.bashrc
envarg=`/data/src/PyHipp/envlist.py`
conda activate $envarg
python -u -c "import PyHipp as pyh; \
from PyHipp import mountain_batch; \
mountain_batch.mountain_batch(); \
from PyHipp import export_mountain_cells; \
export_mountain_cells.export_mountain_cells(); \
pyh.Waveform(saveLevel=1);"
conda deactivate
/data/src/PyHipp/envlist.py $envarg

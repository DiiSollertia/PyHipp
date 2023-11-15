#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=1:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
<<<<<<< HEAD
#SBATCH -J "freq"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o freq-slurm.%N.%j.out # STDOUT
#SBATCH -e freq-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; \
import time; \
pyh.FreqSpectrum(saveLevel=1); \
pyh.FreqSpectrum(loadHighPass=True, pointsPerWindow=3000, saveLevel=1); \
print(time.localtime());"
=======
#SBATCH -J "freqsp"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o freqsp-slurm.%N.%j.out # STDOUT
#SBATCH -e freqsp-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; pyh.FreqSpectrum(saveLevel=1); pyh.FreqSpectrum(loadHighPass=True, pointsPerWindow=3000, saveLevel=1);"
>>>>>>> 45075aa897245894e96281c2cec7efcf86e8796c

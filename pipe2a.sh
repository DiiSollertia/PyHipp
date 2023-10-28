#!/bin/bash

# first job called from the day directory
# creates RPLParallel, Unity, and EDFSplit objects, and
# calls aligning_objects and raycast
/opt/slurm/bin/sbatch /data/src/PyHipp/rplparallel-slurm.sh

# second job - no dependencies, called from the day directory
jid2=$(/opt/slurm/bin/sbatch /data/src/PyHipp/rse-slurm.sh)

# third set of jobs - depends on rse-slurm.sh, called from the day directory
jid3=$(/opt/slurm/bin/sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs1a-slurm.sh)
jid4=$(/opt/slurm/bin/sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs2a-slurm.sh)
jid5=$(/opt/slurm/bin/sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs3a-slurm.sh)
jid6=$(/opt/slurm/bin/sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs4a-slurm.sh)


#!/bin/sh

temp1=($(squeue))

<<<<<<< HEAD
cmd1="sbatch --dependency=afterany:"
=======
cmd1="sbatch --dependency=afterok:"
>>>>>>> 45075aa897245894e96281c2cec7efcf86e8796c

counter1=0
for i in "${temp1[@]}"; do
       if [[ "$i" == "queue1" ]]; then
	       id1=${temp1[$counter1-1]}
	       cmd1="${cmd1}${id1}:"
       fi
       counter1=$((counter1+1))
done

cmd1=${cmd1::-1}
cmd1="${cmd1} /data/src/PyHipp/fsall-slurm.sh"

echo $cmd1
eval $cmd1

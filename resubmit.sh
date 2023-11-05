find . -name "channel*" | grep -v -e eye -e mountain | sort > hps-chs.txt
find . -name "rplhighpass*hkl" | grep -v -e eye | sort | cut -d "/" -f 1-4 > hps.txt
# cwd=`pwd`; for i in `comm -23 hps-chs.txt hps.txt`; do echo $i; cd $i; sbatch /data/src/PyHipp/rplhighpass-sort-slurm.sh; cd $cwd; done
find . -name "firings.mda" | sort | cut -d "/" -f 3 > srt.txt
cut -d "/" -f 4 hps-chs.txt > srt-chs.txt
cwd=`pwd`; for i in `comm -23 srt-chs.txt srt.txt`; do find ./session01/ -name $i | grep -v -e eye -e mountain; cd $i; sbatch /data/src/PyHipp/sort-slurm.sh; cd $cwd; done

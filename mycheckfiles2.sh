#!/bin/bash

echo -e "\nNumber of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo -e "\n#==========================================================="

echo "Start Times"
head -n 1 *slurm*.out
echo "End Times"
tail -n 5 *slurm*.out
echo "#==========================================================="

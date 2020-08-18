#!/bin/bash
# Bash script to run make with sbatch
#
# Usage:
#
#   sbatch make.sh
#
#SBATCH --time=240:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
# For 2 peptides per size per haplotype, 20G is sufficient
# For 10 peptides per size per haplotype, 20G is insufficient
#SBATCH --mem=40G
#SBATCH --job-name=create_luts
#SBATCH --output=create_luts.log
module load R Python/3.8.2-GCCcore-9.3.0

make



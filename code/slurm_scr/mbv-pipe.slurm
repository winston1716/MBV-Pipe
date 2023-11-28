#!/bin/bash

#SBATCH -J mbv-pipe
#SBATCH -o mbv-pipe.out
#SBATCH -e mbv-pipe.err
#SBATCH -p cpu
#SBATCH -N 1
#SBATCH --cpus-per-task=30
#SBATCH --nodes=1

cd /n02dat01/users/wtjiang/Workspace/MBV-Pipe/code
/n02dat01/users/wtjiang/Workspace/MBV-Pipe/code/mbv-pipe.sh
#!/bin/bash

#SBATCH -J mbv-pipe
#SBATCH -o mbv-pipe.out
#SBATCH -e mbv-pipe.err
#SBATCH -p cpu
#SBATCH -N 1
#SBATCH --cpus-per-task=30
#SBATCH --nodes=1

start_time=$(date +"%Y-%m-%d %H:%M:%S")
echo "Job started at $start_time"

# command
cd /n02dat01/users/wtjiang/Workspace/MBV-Pipe/code
/n02dat01/users/wtjiang/Workspace/MBV-Pipe/code/mbv-pipe.sh

end_time=$(date +"%Y-%m-%d %H:%M:%S")
echo "Job ended at $end_time"

start_minutes=$(date -d "$start_time" +%s)
end_minutes=$(date -d "$end_time" +%s)
duration_seconds=$((end_seconds - start_seconds))

duration_hours=$((duration_seconds / 3600))
duration_seconds=$((duration_seconds % 3600))
duration_minutes=$((duration_seconds / 60))
duration_seconds=$((duration_seconds % 60))

echo "Job duration: $duration_hours hours, $duration_minutes minutes, and $duration_seconds seconds"
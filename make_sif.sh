#!/bin/bash

#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=4
#SBATCH --mail-user=arman.thariani@kaust.edu.sa
#SBATCH --mail-type=ALL

module load singularity

export XDG_RUNTIME_DIR=/ibex/user/thariaaa/temp

singularity build --fakeroot --force ./BindCraft.sif ./Singularity.def
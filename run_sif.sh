#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH --job-name=rf_array
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --mail-user=arman.thariani@kaust.edu.sa
#SBATCH --mail-type=ALL

singularity run --nv --cleanenv --bind /ibex/reference/KSL/:/ibex/reference/KSL/ \
    BindCraft.sif \
    --settings './PDL1.json' --filters './default_filters.json' --advanced './default_4stage_multimer.json'
# BindCraft Container
## Purpose
The goal of this repo is to provide the setup for a containerized version of BindCraft built with Singularity and designed for the Ibex HPC cluster. The setup files include a way to make the Singularity image as well as run it using SLURM. This version of BindCraft allows for multiple jobs to be run simultaneously to make the process of getting passing trajectories faster.

## Setup
The setup consists of a number of steps but this should produce a fully containerized version of BindCraft. The steps are as follows:
1. Change relevant variables in .sh scripts
2. Build image
3. Test

### Change relevant variables in .sh scripts
1. In `make_sif.sh`, you will want to change the directories to your personal ones. Change the following:
   1. `#SBATCH --mail-user=arman.thariani@kaust.edu.sa` Change the email so that you get updates on when the job is complete
   2. `export XDG_RUNTIME_DIR=/ibex/user/thariaaa/temp` Create a temporary directory for the build process as per [Ibex container instructions](https://docs.hpc.kaust.edu.sa/soft_env/prog_env/containers/create_image.html#:~:text=While%20building%20images%20with%20%E2%80%93fakeroot%20on%20Ibex%2C%20Always%20allocate%20a%20compute%20node%20on%2C%20(won%E2%80%99t%20work%20on%20login%20nodes).%20export%20XDG_RUNTIME_DIR%3D%24HOME/somewhere%2C%20to%20allow%20temporary%20space%20for%20Singularity%20to%20write%20intermediate%20blobs/images.)
   
2. In `run_sif.sh`, you will want to adjust the locations for the settings and filters as they currently point to the defaults in this repository. You will want to adjust the parameters accordingly so please check the settings files
   1. `#SBATCH --mail-user=arman.thariani@kaust.edu.sa` Same as above
   2. `--bind /ibex/reference/KSL/:/ibex/reference/KSL/` you will need to bind the directory that contains your alphafold data directories which you will also need to specify the location of in the advanced settings (in this case check and adjust `default_4stage_multimer.json`)
   3. Similar to above, you should specify the PDB location in the settings file (in this case `PDL1.json`)

### Build image
Run `sbatch make_sif.sh` and once the job is complete, you should have the `BindCraft.sif` file mentioned above

### Test
Run `sbatch run_sif.sh` and this should result in the creation of the output folder specified in the settings json file. You can run this command several times to run BindCraft processes in parallel and so long as the same settings and filters are applied, all the parallel processes will output to the same folder and collectively stop when the goal is reached. 

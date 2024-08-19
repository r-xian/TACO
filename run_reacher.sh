#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=27G
#SBATCH --job-name=reacher_TACO
#SBATCH --gres=gpu:a100
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o reacher.out
#SBATCH -e reacher.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /home/s4642506/TACO

srun python ./train.py agent=taco task=reacher_easy seed=1 

# task=finger_spin
# task=reacher_easy
# task=cartpole_swingup
# task=cheetah_run
# task=walker_walk
# task=cup_catch

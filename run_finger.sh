#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=27G
#SBATCH --job-name=finger_TACO
#SBATCH --gres=gpu:a100
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o finger.out
#SBATCH -e finger.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /home/s4642506/TACO

srun python ./train.py agent=taco task=finger_spin seed=1 
# srun python ./train.py agent=taco task=finger_spin seed=2 
# srun python ./train.py agent=taco task=finger_spin seed=3 
# srun python ./train.py agent=taco task=finger_spin seed=4 
# srun python ./train.py agent=taco task=finger_spin seed=5 

# task=finger_spin
# task=reacher_easy
# task=cartpole_swingup
# task=cheetah_run
# task=walker_walk
# task=cup_catch

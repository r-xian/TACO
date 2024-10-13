#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=12G
#SBATCH --job-name=TACO_finger
#SBATCH --gres=gpu:h100
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o finger.out
#SBATCH -e finger.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /scratch/user/s4642506/TACO

srun python ./train.py agent=taco task=finger_spin seed=1 exp_name=finger_1
srun python ./train.py agent=taco task=finger_spin seed=2 exp_name=finger_2
srun python ./train.py agent=taco task=finger_spin seed=3 exp_name=finger_3
srun python ./train.py agent=taco task=finger_spin seed=4 exp_name=finger_4
srun python ./train.py agent=taco task=finger_spin seed=5 exp_name=finger_5

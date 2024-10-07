#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --job-name=TACO_cartpole
#SBATCH --gres=gpu:nvidia_a100_80gb_pcie_1g.10gb
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o cartpole.out
#SBATCH -e cartpole.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /scratch/user/s4642506/TACO

srun python ./train.py agent=taco task=cartpole_swingup seed=1 exp_name=cartpole_1
srun python ./train.py agent=taco task=cartpole_swingup seed=2 exp_name=cartpole_2
srun python ./train.py agent=taco task=cartpole_swingup seed=3 exp_name=cartpole_3
srun python ./train.py agent=taco task=cartpole_swingup seed=4 exp_name=cartpole_4
srun python ./train.py agent=taco task=cartpole_swingup seed=5 exp_name=cartpole_5

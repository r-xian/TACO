#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=12G
#SBATCH --job-name=TACO_reacher
#SBATCH --gres=gpu:h100
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o reacher.out
#SBATCH -e reacher.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /scratch/user/s4642506/TACO

srun python ./train.py agent=taco task=reacher_easy seed=1 exp_name=reacher_1
srun python ./train.py agent=taco task=reacher_easy seed=2 exp_name=reacher_2
srun python ./train.py agent=taco task=reacher_easy seed=3 exp_name=reacher_3
srun python ./train.py agent=taco task=reacher_easy seed=4 exp_name=reacher_4
srun python ./train.py agent=taco task=reacher_easy seed=5 exp_name=reacher_5

#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --job-name=TACO_RE_FS_WW
#SBATCH --gres=gpu
#SBATCH --time=80:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o RE_FS_WW.out
#SBATCH -e RE_FS_WW.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh

cd /scratch/user/s4642506/Mask-based-Latent-Reconstruction/src
conda activate tmv2
export CUDA_VISIBLE_DEVICES=0
srun python ./train.py --config-path ./configs --config-name reacher_easy jumps=15 seed=1 num_env_steps=105000 wandb=true agent=mtm_sac #4 hours

cd /scratch/user/s4642506/TACO
conda activate taco
srun python ./train.py agent=taco task=reacher_easy seed=1 exp_name=reacher_1
srun python ./train.py agent=taco task=reacher_easy seed=2 exp_name=reacher_2
srun python ./train.py agent=taco task=reacher_easy seed=3 exp_name=reacher_3

srun python ./train.py agent=taco task=finger_spin seed=1 exp_name=finger_1
srun python ./train.py agent=taco task=finger_spin seed=2 exp_name=finger_2
srun python ./train.py agent=taco task=finger_spin seed=3 exp_name=finger_3

srun python ./train.py agent=taco task=walker_walk seed=1 exp_name=walker_1
srun python ./train.py agent=taco task=walker_walk seed=2 exp_name=walker_2
srun python ./train.py agent=taco task=walker_walk seed=3 exp_name=walker_3
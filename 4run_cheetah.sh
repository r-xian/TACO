#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --job-name=TACO_cheetah
#SBATCH --gres=gpu:nvidia_a100_80gb_pcie_1g.10gb
#SBATCH --time=72:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o cheetah.out
#SBATCH -e cheetah.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /scratch/user/s4642506/TACO

srun python ./train.py agent=taco task=cheetah_run seed=1 exp_name=cheetah_1
srun python ./train.py agent=taco task=cheetah_run seed=2 exp_name=cheetah_2
srun python ./train.py agent=taco task=cheetah_run seed=3 exp_name=cheetah_3
srun python ./train.py agent=taco task=cheetah_run seed=4 exp_name=cheetah_4
srun python ./train.py agent=taco task=cheetah_run seed=5 exp_name=cheetah_5
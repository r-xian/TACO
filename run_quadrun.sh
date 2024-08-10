#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=30G
#SBATCH --job-name=reacher_TACO
#SBATCH --gres=gpu:nvidia_a100_80gb_pcie_1g.10gb
#SBATCH --time=96:00:00
#SBATCH --partition=gpu_cuda
#SBATCH --account=a_lead
#SBATCH -o quadrun.out
#SBATCH -e quadrun.error

module load miniconda3
source $EBROOTMINICONDA3/etc/profile.d/conda.sh
conda activate taco
cd /home/s4642506/TACO

srun python ./train.py agent=taco task=quadruped_run seed=2 exp_name=quadruped_run_2 
srun python ./train.py agent=taco task=quadruped_run seed=3 exp_name=quadruped_run_3




# task=finger_spin
# task=reacher_easy
# task=cartpole_swingup
# task=cheetah_run
# task=walker_walk
# task=cup_catch

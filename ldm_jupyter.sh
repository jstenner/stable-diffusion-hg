#!/bin/bash
#SBATCH --job-name=StableAI
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=stenner@ufl.edu   # Where to send mail
#SBATCH --nodes=1                     # Use one node
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=1             # Use 1 core
#SBATCH --mem=40gb                    # Memory limit
#SBATCH --partition=gpu               # Required for GPUs
#SBATCH --gpus=a100:1                 # Specify GPU type
#SBATCH --time=04:00:00               # Time limit hrs:min:sec, or 7-0 for days + hrs
#SBATCH --qos=art4612                 # QOS Group
#SBATCH --output=stable_%j.out # Standard output and error log


date;hostname;pwd

module r condacudagcc
module add jupyter
conda activate ldm

launch_jupyter_lab

# For additional details see: https://help.rc.ufl.edu/doc/Remote_Jupyter_Notebook
# To set a password, on a login node, use these commands:
#     module load jupyter
#     jupyter-notebook password
# You will be asked to enter a password and confirm that password.
# This password can then be used to connect to the notebooks without
# needing the token.
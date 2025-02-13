#!/bin/bash -l
#
#SBATCH --job-name=selfRecJob              # Job name
#SBATCH --gres=gpu:a100:1                  # Request 1 A100 GPU
#SBATCH --partition=a100                   # Run on the A100 partition
#SBATCH --time=6:00:00                     # Set maximum run time to 6 hours
#SBATCH --ntasks=1                         # Single task
#SBATCH --output=logs/%x_%j.out            # Save stdout to logs/jobname_jobid.out
#SBATCH --error=logs/%x_%j.err             # Save stderr to logs/jobname_jobid.err
#SBATCH --export=NONE


unset SLURM_EXPORT_ENV  
export http_proxy=http://proxy:80
export https_proxy=http://proxy:80

module load python             
module load cuda/12.6.1            
source activate selfRec


python main.py                      

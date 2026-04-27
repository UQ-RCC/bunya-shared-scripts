#!/bin/bash
#SBATCH --job-name=slurm-api-test
#SBATCH --account=a_ai_collab
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00
#SBATCH --output=slurm-api-test-%j.out
#SBATCH --error=slurm-api-test-%j.err

set -euo pipefail

echo "Slurm API test job"
echo "Started: $(date)"
echo "Host: $(hostname)"
echo "Job ID: ${SLURM_JOB_ID:-unknown}"
echo "Account: ${SLURM_JOB_ACCOUNT:-unknown}"
echo "Working directory: $(pwd)"

echo "Environment check:"
echo "  SLURM_NTASKS=${SLURM_NTASKS:-unknown}"
echo "  SLURM_CPUS_PER_TASK=${SLURM_CPUS_PER_TASK:-unknown}"

echo "Finished: $(date)"

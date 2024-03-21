#!/bin/bash

# Set job requirements

# SBATCH -p short
# SBATCH -t 4:00
# SBATCH --partition=thin_course

# Change these variables if you want to change the input or output directories
inputdir="$HOME/rdm-april-2024/input"
outputdir="$HOME/rdm-april-2024/result"
resultsfile="result-$SLURM_JOBID.txt"

# Make sure that the outputdir exist
mkdir -p $outputdir

# Is the input data found
echo "Running analysis on "$inputdir
echo "Hopefully we will find the aleins"
sleep 10s
echo "Output stored in "$outputdir

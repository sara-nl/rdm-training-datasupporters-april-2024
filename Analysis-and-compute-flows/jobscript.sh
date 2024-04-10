#!/bin/bash

# Set job requirements

# SBATCH -p short
# SBATCH -t 4:00
# SBATCH --partition=data_course

# Change these variables if you want to change the input or output directories
inputdir="$HOME/input"
outputdir="$HOME/result"
#resultsfile="result-$SLURM_JOBID.txt"

# Make sure that the outputdir exist
mkdir -p $outputdir

# Is the input data found
echo "Running analysis on "$inputdir
echo "Hopefully we will find the aleins"
cp $HOME/input/lofar.png $HOME/result/ouput.png

echo "Output stored in "$outputdir

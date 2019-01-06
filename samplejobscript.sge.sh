#!/bin/bash

# Specify a job name
#$ -N downsampling

# Project name and target queue
#$ -P ludwig.prjc
#$ -q short.qc

# Run the job in the current working directory
#$ -cwd -j y

# Log locations which are relative to the current
# working directory of the submission
###$ -o output.log
###$ -e error.log

# Parallel environemnt settings
#  For more information on these please see the wiki
#  Allowed settings:
#   shmem
#   mpi
#   node_mpi
#   ramdisk
#$ -pe shmem 1

# Some useful data about the job to help with debugging
echo "------------------------------------------------"
echo "SGE Job ID: $JOB_ID"
echo "SGE Task ID: $SGE_TASK_ID"
echo "Run on host: "`hostname`
echo "Operating system: "`uname -s`
echo "Username: "`whoami`
echo "Started at: "`date`



echo "------------------------------------------------"



# Begin writing your script here

echo $JOB_ID
/apps/well/samtools/1.8-gcc5.4.0/bin/samtools view -s 0.25 -b /well/ludwig/projects/variant_calling/data/EGAZ00001224454_1abdd039-1c39-4593-b7ee-fd6c90e85fd6_17a31a3deafd6aa0e119d28c8ad27b3f.bam > /well/ludwig/users/bgn494/control_downsampled_025.sam

# End of job script


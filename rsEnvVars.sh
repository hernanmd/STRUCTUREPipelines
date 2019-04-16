#!/bin/bash

# Input file in Structure format
strinput="project_data.str"

# Output directory where results will be written
jobid="001"
outputdir="$jobid"

# Populations file: Generated automatically by runStrClumpak
popfile="populations_file.txt"

# Data labels file: Example
# cat data_labels.txt
# 1       ANG
# 2       BRN
# 3       ZEB
labelsfile="data_labels.txt"

# Structure results zipped into a single file
# stresults.zip
# 	k1.zip
#		k1/
#			project_data_k1_run10_f
#			project_data_k2_run1_f
#			...
#	k2.zip
#		k2/
#			...
strresultszip="stresults.zip"

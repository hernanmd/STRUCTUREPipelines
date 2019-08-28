#!/bin/bash 

# Paper: https://onlinelibrary.wiley.com/doi/full/10.1111/1755-0998.12702
# Manual: https://github.com/StuntsPT/Structure_threader/blob/master/docs/usage.md

project_dir=""
project_output=""
fsbin="/data/home/hernan/.local/bin/fastStructure"
strbin="/usr/local/bin/structure"

# Generate mainparams and extraparams
structure_threader params -o "$project_output" \

# With fastSTRUCTURE
structure_threader run \
	-K 4 9 \
	-R 1 \
	-i "$project_dir"/project_data \
	-o "$project_output" \
	-t 32 \
	-st "$strbin" \
	--params mainparams \
	--log 1
	
structure_threader plot \
	-i fS_run \
	-f fastStructure \
	-K 2 3 4 \
	-o 2_4_plots \
	--ind indfile.txt

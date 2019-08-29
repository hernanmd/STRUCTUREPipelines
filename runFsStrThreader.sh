#!/bin/bash

# Paper: Structure_threader https://onlinelibrary.wiley.com/doi/full/10.1111/1755-0998.12702
# Manual 1 : https://github.com/StuntsPT/Structure_threader/blob/master/docs/usage.md
# Manual 2 : https://structure-threader.readthedocs.io/en/latest/
# Sample run
#
# ./runFsStrThreader fs_input_dir/ fs_output_dir/

project_input="$1"
project_output="$2"
pop_file="$3"
ks="$4"
fsbin="/data/home/hernan/.local/bin/fastStructure"
strbin="/usr/local/bin/structure"

# Generate mainparams and extraparams
structure_threader params -o . \

echo "Please edit the generated mainparams file..."

# With fastSTRUCTURE
structure_threader run \
	-K "$ks" \
	-R 1 \
	-i "$project_input" \
	-o "$project_output" \
	-t 32 \
	-fs "$fsbin" \
	--pop "$pop_file" \
	--params mainparams \
	--log 1

runPlotStrThreader "project_output" "$pop_file"

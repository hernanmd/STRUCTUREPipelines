#!/bin/bash

# Paper: Structure_threader https://onlinelibrary.wiley.com/doi/full/10.1111/1755-0998.12702
# Manual 1 : https://github.com/StuntsPT/Structure_threader/blob/master/docs/usage.md
# Manual 2 : https://structure-threader.readthedocs.io/en/latest/

set -u  # Check for undefined variables
set -o errexit    # Used to exit upon error, avoiding cascading errors
set -o nounset    # Exposes unset variables
set -eo pipefail # Fail fast and be aware of exit codes

require_util() {
	command -v "$1" > /dev/null 2>&1 || oops "you do not have '$1' installed, which I need to $2"
}

print_basic_help() {
	local program_name=$(basename "$0")
	printf "Usage: %s <input_dir> <plink_infile.bed> <output_dir> <pop_file> <Ks>\n" "$program_name"
}

print_usage() {
	cat << EOF
Run StructureThreader with input validation.

EOF

	print_basic_help

cat << EOF

  - mainparams and extraparams are generated using a skeleton if not found in current directory
  - Structure project input file is parsed from mainparams.
  - Validate input parameters

The options include:
	input_dir		Directory where input files are located
	plink_infile.bed	Name of the PLINK input bed file, WITH extension (.fam and .bim also required to be in the same directory)
	output_dir 		Directory where output files will be written
	pop_file	 	Population file as required by Stucture_threader
	Ks			Number of MAXPOPS

This software is licensed under the MIT License.
EOF
}

# Extract the input file name from the mainparams
parse_str_infile() {
	local input_dir="$1"

	in_str=$(grep "#define INFILE" "$input_dir"/mainparams | awk '{print $3}')
	echo "$in_str"
}

# Run workflow with fastSTRUCTURE
runFs() {
	$strthbin run \
		-fs "$fsbin" \
		-i "$input_dir"/"$input_plinkfile" \
		-o "$output_dir" \
		-K $ks \
		-t 32 \
		--log 1 \
		--pop "$pop_file" \
		--params "$input_dir"/mainparams
}

# Plot results
plotComparativeFs() {
	local listOfKs=$(seq -s ' ' 2 "$ks")

	$strthbin plot \
		-f faststructure \
		-i "$output_dir" \
		-K $listOfKs \
		-o comparativePlotAllKs \
		--pop "$pop_file"
}

# Validate input params and environment
validate() {
	local input_dir="$1"
	local output_dir="$2"
	local pop_file="$3"

	require_util grep
	require_util awk
	[[ -d $input_dir ]] || { printf "%s is not an input directory\n" $input_dir; exit 1; }
	[[ -f $pop_file ]] || { printf "%s population file does not exists\nPlease create it using mkPopFile script\n" $pop_file; exit 1; }
}

# If there are no mainparams and extraparams, let's create it
create_params_files() {
	[[ -f "$input_dir"/mainparams ]] || \
		{ printf "Creating mainparams file\nPlease edit mainparams and extraparams and run this script again\n"
		$strthbin params -o "$input_dir"
		exit 1; }
	[[ -f "$input_dir"/extraparams ]] || { printf "Please create and edit extraparams, then run this script again\n"; exit 1; }
}

main() {
	[[ $# -ne 5 ]] && { print_usage; exit 1; }

	local input_dir="$1"
	local input_plinkfile="$2"
	local output_dir="$3"
	local pop_file="$4"
	local ks="$5"

	local fsbin="/data/home/hernan/.local/bin/fastStructure"
	local strthbin="/data/home/hernan/.local/bin/structure_threader"

	validate "$input_dir" "$output_dir" "$pop_file"
	create_params_files
	str_infile=$(parse_str_infile "$input_dir")
	# runFs "$input_dir" "$str_infile" "$output_dir" "$fsbin" "$strthbin"
	plotComparativeFs
}

main "$@"

#!/bin/bash

strinput="project_data.str"
jobid="001"
outputdir="Main_Pipeline_Greedy_1000R"
popfile="/home/hernan/strauto/populations_file.txt"
labelsfile="/home/hernan/strauto/data_labels.txt"
strresultszip="/home/hernan/Structure_results.zip"

# Download CLUMPAK
# wget http://clumpak.tau.ac.il/index.html

# Install perl dependencies
# cpan Getopt::Long File::Slurp File::Path List::MoreUtils PDF::API2 PDF::Table File::Basename List::Permutor GD::Graph::lines GD::Graph::Data Getopt::Std List::Util File::Slurp Scalar::Util Statistics::Distributions Archive::Extract Data::PowerSet Array::Utils

# Extract 3-letter ids of populations from STRUCTURE input project file
tail -n +3 ${strinput} | cut -f 1 -d " " | cut -c 1-3 > ${popfile}

# In case any pm is missing prepend this: 
# perl -I/usr/local/lib/perl5/site_perl/5.18.1/ 
CLUMPAK.pl \
	--id ${jobid} \
	--dir ${outputdir} \
	--podtopop ${popfile} \
	--labels ${labelsfile} \
#	--clumppsearchmethod 2 \
#	--clumpprepeats 1000 \
	--file ${strresultszip}
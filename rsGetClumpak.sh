#!/bin/bash

# Download CLUMPAK
wget http://clumpak.tau.ac.il/download/CLUMPAK.zip
unzip CLUMPAK.zip

# Install perl dependencies
cpan Getopt::Long File::Slurp File::Path List::MoreUtils PDF::API2 PDF::Table File::Basename List::Permutor GD::Graph::lines GD::Graph::Data Getopt::Std List::Util File::Slurp Scalar::Util Statistics::Distributions Archive::Extract Data::PowerSet Array::Utils

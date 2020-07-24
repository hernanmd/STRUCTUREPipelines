# Table of Contents

- [Description](#description)
- [General Installation](#general-installation)
- [Pipeline CLUMPAK(StrAuto) + distruct](#pipeline-clumpakstrauto--distruct)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Download CLUMPAK](#download-clumpak)
  - [Run Main Pipeline (CLUMPAK)](#run-main-pipeline-clumpak)
  - [Run Distruct for many Ks](#run-distruct-for-many-ks)
- [Pipeline Structure_threader](#pipeline-structure_threader)
  - [Installation](#installation)
  - [Usage](#usage-1)
    - [Create a "popfile"](#create-a-popfile)
    - [Edit the "mainparams" and optionally the "extraparams" file](#edit-the-mainparams-and-optionally-the-extraparams-file)
    - [Run analysis](#run-analysis)
    - [Plot results](#plot-results)
- [Pipeline fastSTRUCTURE with Docker](#pipeline-faststructure-with-docker)
  - [Installation](#installation-1)
  - [Run image under Windows MSYS2 or WSL](#run-image-under-windows-msys2-or-wsl)
  - [Run image under Linux/OSX](#run-image-under-linuxosx)

# Description

This repository contains three pipelines with scripts to run locally several types of STRUCTURE analysis :

  - Pipeline [CLUMPAK](http://clumpak.tau.ac.il/index.html) analysis of STRUCTURE results produced by [StrAuto](https://www.crypticlineage.net/software/strauto/) and generate [distruct](https://www.crypticlineage.net/software/distruct/) figures.
  - Pipeline Structure_threader with fastStructure
  - Pipeline fastStructure with Docker

# General Installation

```bash
git clone https://github.com/hernanmd/STRUCTUREPipelines.git
cd runstructure
```

# Pipeline CLUMPAK(StrAuto) + distruct

## Requirements

  - STRUCTURE input file (.str). 
    - The default name used in the configuration files is project_data.str
  - StrAuto results should be already available in a .zip file
    - The results should be zipped into a single .zip file.
	- Default name is stresults.zip, with the following structure:

```bash
       k1.zip
               k1/
			project_data_k1_run10_f
			project_data_k2_run1_f
			...
       k2.zip
               k2/
                       project_data_k1_run10_f
                       project_data_k2_run1_f
			...
```

## Usage

  - Put your StrAuto results into a subdirectory
  - Edit environment variables in the file rsEnvVars.sh

## Download CLUMPAK

```bash
./rsGetClumpak.sh
```
## Run Main Pipeline (CLUMPAK)

  - The runStrClumpak script performs the following actions:
    - Read environment variables in rsEnvVars.sh as parameters.
    - Create the output directory.
    - Build the populations file.
    - Run the CLUMPAK Perl script

```bash
./runStrClumpak
```

## Run Distruct for many Ks

  - The following script perform the following actions:
    - Read environment variables as parameters.
    - Create the output directory.
    - Build the populations file.
    - Run DistructForManyKs perl script

```bash
./runStrDistructForManyKs
```

# Pipeline Structure_threader

## Installation

WiP

## Usage

To use this pipeline you should have your input files both in PED/MAP format (to generate the populations file) and in BED/BIM/FAM format (required by fastSTRUCTURE).
ALSO the structure input file, which could be generated from PLINK using the "--recode structure" option.
It is highly recommended to put the input files in a separate subdirectory.
The output directory will be created if not already present.

### Create a "popfile" 

```bash
# Create the required popfile from the PED file. 
# The input is a PED file name which should be specified WITHOUT the .ped extension
# The output is a new file named "popfile" suitable for Structure_threader plots
./mkPopFile ../STRUCTURE_PIPrun/project_input/file
```

### Edit the "mainparams" and optionally the "extraparams" file

### Run analysis

To run Structure_threader you must specify the following parameters

  - 1st parameter is the DIRECTORY where input files are located
  - 2nd parameter is the BED file (using PED is not valid for now)
  - 3rd parameter is the DIRECTORY where output will be written
  - 4th parameter is the name of the popfile generated with mkPopFile script.
  - 5th parameter is the number of maximum K:

Example:

```bash
 ./runFsStrThreader.sh project_input/ file.bed project_output/ popfile 24
```

The Structure_threader already generates a plots subdirectory with HTML/SVG paired files into the output directory, however this script will also generate a "Comparative Plots" in a comparativePlotAllKs

# Pipeline fastSTRUCTURE with Docker 

## Installation

Install Docker
Under Windows: Launch MSYS2
Under Linux/OSX: Launch Terminal
Fetch fastStructure docker image from [https://hub.docker.com/r/dockerbiotools/faststructure](https://hub.docker.com/r/dockerbiotools/faststructure)

```bash
docker pull dockerbiotools/faststructure
```

## Run image under Windows MSYS2 or WSL

```bash
# Get the image id from the following command
docker images
# Make a directory for your dataset
mkdir data # Or whatever your population name is
# Install the winpty package if necessary
# pacman -Ss winpty (or apt get winpty)
# Run the image
winpty docker run -it -v /${PWD}/data/:/fastStructure/data 6ca
```

## Run image under Linux/OSX

```bash
# Get the image id from the following command
docker images
# Run the image
docker run -it -v /${PWD}/data/:/fastStructure/data 6ca
```


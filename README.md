# Description

This repository contains scripts to run locally [CLUMPAK](http://clumpak.tau.ac.il/index.html) analysis of STRUCTURE results produced by [StrAuto](https://www.crypticlineage.net/software/strauto/) and generate [distruct](https://www.crypticlineage.net/software/distruct/) figures.

# Installation

```bash
git clone https://github.com/hernanmd/runstructure.git
cd runstructure
```

# Requirements

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

# Usage

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


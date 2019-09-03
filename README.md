# Description

This repository contains three pipelines with scripts to run locally several types of STRUCTURE analysis :

  - Pipeline [CLUMPAK](http://clumpak.tau.ac.il/index.html) analysis of STRUCTURE results produced by [StrAuto](https://www.crypticlineage.net/software/strauto/) and generate [distruct](https://www.crypticlineage.net/software/distruct/) figures.
  - Pipeline Structure_threader with fastStructure
  - Pipeline fastStructure with Docker

# Global Installation

```bash
git clone https://github.com/hernanmd/STRUCTUREPipelines.git
cd runstructure
```

## Pipeline CLUMPAK(StrAuto) + distruct : Requirements

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

## Pipeline CLUMPAK(StrAuto) + distruct : Usage

  - Put your StrAuto results into a subdirectory
  - Edit environment variables in the file rsEnvVars.sh

## Pipeline CLUMPAK(StrAuto) + distruct : Download CLUMPAK

```bash
./rsGetClumpak.sh
```
## Pipeline CLUMPAK(StrAuto) + distruct : Run Main Pipeline (CLUMPAK)

  - The runStrClumpak script performs the following actions:
    - Read environment variables in rsEnvVars.sh as parameters.
    - Create the output directory.
    - Build the populations file.
    - Run the CLUMPAK Perl script

```bash
./runStrClumpak
```

## Pipeline CLUMPAK(StrAuto) + distruct : Run Distruct for many Ks

  - The following script perform the following actions:
    - Read environment variables as parameters.
    - Create the output directory.
    - Build the populations file.
    - Run DistructForManyKs perl script

```bash
./runStrDistructForManyKs
```

## Pipeline Structure_threader : Installation

## Pipeline Structure_threader : Usage

Last parameter is the number of Ks:

```bash
 ./runFsStrThreader.sh project_input/file.bed project_output/ popfile 24
 ```

## Pipeline fastSTRUCTURE with Docker : Installation

Install Docker
Under Windows: Launch MSYS2
Under Linux/OSX: Launch Terminal
Fetch fastStructure docker image from [https://hub.docker.com/r/dockerbiotools/faststructure](https://hub.docker.com/r/dockerbiotools/faststructure)

```bash
docker pull dockerbiotools/faststructure
```

## Pipeline fastSTRUCTURE with Docker : Run image under Windows MSYS2

```bash
# Get the image id from the following command
docker images
# Make a directory for your dataset
mkdir data # Or whatever your population name is
# Install the winpty package if necessary
# pacman -Ss winpty
# Run the image
winpty docker run -it -v /${PWD}/data/:/fastStructure/data 6ca
```

## Pipeline fastSTRUCTURE with Docker : Run image under Linux/OSX

```bash
# Get the image id from the following command
docker images
# Run the image
docker run -it -v /${PWD}/data/:/fastStructure/data 6ca
```


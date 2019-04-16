# Description

Parallelization of Structure workflow to run in a Cluster environment.

# Installation

```bash
git clone https://github.com/hernanmd/runstructure.git
cd runstructure
```

# Requirements

  - Structure input file (.str)
  - Structure results should be already available in a .zip file.

# Usage

  - Put your results into a subdirectory
  - Edit rsEnvVars.sh

## Download CLUMPAK

```bash
./rsGetClumpak.sh
```

## Run Main Pipeline (CLUMPAK)

  - See [http://clumpak.tau.ac.il/index.html](http://clumpak.tau.ac.il/index.html) for details.
  - Read environment variables as parameters.
  - Create the output directory.
  - Build the populations file.
  - Run CLUMPAK perl script


```bash
./runStrClumpak
```

## Run Distruct for many Ks

The following script will:

  - Read environment variables as parameters.
  - Create the output directory.
  - Build the populations file.
  - Run DistructForManyKs perl script

```bash
./runStrDistructForManyKs
```


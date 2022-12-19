## This is the markdown for week 7

### This docments outlines the contents of week 2

'week7' contains four directories namely 'code', 'data', 'results, 'sandbox'.

#### Code
This directory contains all python scripts and files containing code that are required for submission. All the scripts have to be called using this directory as the present working directory. The following is a short description of the files present in this directory:

* LV1.py: It is a python program which simulates the Lotka-Volterra model for predator prey interactions. It does not take the carrying capacity into account.
* LV2.py: It is a python program which simulates the Lotka-Volterra model for predator prey interactions. It takes the carrying capacity into account.
* profileme.py: Script which does calculations in a loopy way for many iterations.
* profileme2.py:  Script which does calculations in a non-loopy way for many iterations.
* run_fmr_R.py: This script runs a R script using the module subprocess.
* timetime.py: This scripts calcualtes the run time of profileme.py and profileme2.py using the module timeit.
* profileLV.sh: This script profiles LV1.py and LV2.py using the module cProfile.
* fmr.R: This R script is used by another script as an input.

The following groupwork files are also present in this folder:

* LV3.py - Did this script as a part of groupwork by mistake!

* Vectorize1.py - Python version of Vectorize1.R

* Vectorize2.py - Python version of Vectorize2.R

* Vectorize1.R - Vectorization in R

* Vectorize2.R - Vectorization in R (part2)

* compare.sh - Compare the time for four vectorization scrits.

The following packages are used in the codes:

* sys 
* numpy 
* scipy 
* matplotlib 
* time
* pandas

#### Data
This directory has all the data required by the scripts. 

#### Results
This directory id empty presently. After running all the scripts it is expected to contain the results given by the scripts.

#### Sandbox
This directory is for practice and contains practice scripts and files. On GitHub it is empty as it is not meant for submission. 
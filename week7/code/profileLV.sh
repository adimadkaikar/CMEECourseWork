#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: boilerplate.sh
#Descripton: First shell script
#Arguements: None
#Date: Oct 2022

python3 -m cProfile -s cumtime -o ../results/profires_LV1 ../code/LV1.py
python3 -m cProfile -s cumtime -o ../results/profires_LV2 ../code/LV2.py
echo "The profiling results are stored in results"
#exit

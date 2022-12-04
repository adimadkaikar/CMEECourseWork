#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: miniproject.sh
#Descripton: Script to run the miniproject workflow and compile the report
#Arguements: None
#Date: Nov 2022

# Running the workflow
Rscript cleaning.R

# Compliling the Latex
chmod u+x texcount.pl
texcount -1 -sum main.tex > main-words.sum
bash CompileLaTeX.sh main
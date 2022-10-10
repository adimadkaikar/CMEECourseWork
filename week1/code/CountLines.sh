#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: CountLines.sh
#Descripton: Counts and prints the number of lines in the file
#Arguements: 1 -> Any file
#Date: Oct 2022

NumLines=`wc -l < $1`
echo "The files $1 has $NumLines lines"
echo

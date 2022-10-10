#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: tabtocsv.sh
#Descripton: substitute all the commas for spaces and saves the output to a .txt file
#Arguements: None
#Date: Oct 2022

# Finding the .csv files
MY_VAR=../data/Temperatures
MY_VAR=$(find $MY_VAR -type f -name "*.csv")

#echo "$MY_VAR"

# Looping through all the .csv files to convert them to space delimited files
for f in $MY_VAR; 
    do  
        echo  "Creating a space separated version of  $f ..."
        cat $f | tr -s "," " " >> "../results/$(basename "$f" .csv).txt"
        echo "Done!"
    done

exit
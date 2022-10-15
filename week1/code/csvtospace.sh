#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: tabtocsv.sh
#Descripton: substitute all the commas for spaces and saves the output to a .txt file
#Arguements: None
#Date: Oct 2022

# Finding the .csv files
MY_VAR=$(find $1 -type f -name "*.csv")
#echo "$MY_VAR"
if test -z $MY_VAR; then
    echo "No .csv file available. "
    echo "Continuing with default values"
    MY_VAR=../data/Temperatures
    MY_VAR=$(find $MY_VAR -type f -name "*.csv")
fi

echo $MY_VAR

for f in $MY_VAR; 
    do  
        echo "Creating a space delimited version of $f"; 
        cat $f | tr -s "," " " >> "../results/$(basename "$f" .txt).csv"
        echo "Done!"
    done

exit
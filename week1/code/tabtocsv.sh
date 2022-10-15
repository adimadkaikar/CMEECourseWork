#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: tabtocsv.sh
#Descripton: substitute all the tabs for commas. Saves the output to a .csv file
#Arguements: 1 -> tab delimited file
#Date: Oct 2022

# Checking for valid inputs
if [[ $1 =~ .*txt.* ]]; then 
    echo "It works: $1"
    echo  "Creating a comma delimited version of $1 ..."
    cat $1 | tr -s "\t" "," >> "../results/$(basename "$1" .txt).csv"
    echo "Done!"

else
    echo "Please give a valid input. It should be a tab deliminated .txt file."
    exit
fi
exit

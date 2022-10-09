#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: tabtocsv.sh
#Descripton: substitute all the tabs for commas
#
#Saves the output to a .csv file
#Arguements: 1 -> tab delimited file
#Date: Oct 2022

if test -z "$1"; then 
    echo "Please give a valid input"
else
    echo "It works: $1"
    echo  "Creating a comma delimited version of $1 ..."
    cat $1 | tr -s "\t" "," >> "../sandbox/$(basename "$1" .txt).csv"
    echo "Done!"
fi
exit

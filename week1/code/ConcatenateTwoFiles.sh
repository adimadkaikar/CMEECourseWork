#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: ConcatenateTwoFiles.sh
#Descripton: Merges the two input files
#Arguements: 3 -> Text files
#Date: Oct 2022

if test -z "$1" || test -z "$2" || test -z "$3"; then 
    echo "Please give a valid input. This script needs three text files as inputs (two input files and one outout)"
else
    echo "It works: $1 $2"
    cat $1 > $3
    cat $2 >> $3
    echo "Merged File is"
    cat $3
    echo "Whee it works!"
fi
exit

#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: tabtocsv.sh
#Descripton: Converts a .tiff image to .png image
#Arguements: 1 -> Directory containing a .tiff image or a .tiff image
#Date: Oct 2022

#echo $1
# Loking for and isolating .tiff files from a directory.
MY_VAR=$(find $1 -type f -name "*.tiff")
#echo "$MY_VAR"
if test -z $MY_VAR; then
    echo "No .tiff image file available. Please give a valid input"
    exit
fi

for f in $MY_VAR; 
    do  
        echo "Converting $f"; 
        convert "$f"  "../data/$(basename "$f" .tiff).png"; 
    done

exit
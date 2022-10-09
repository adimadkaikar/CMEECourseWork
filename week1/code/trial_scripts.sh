#!/bin/bash

echo $1
MY_VAR=$(find $1 -type f -name "*.tiff")
echo "$MY_VAR"

for f in $MY_VAR; 
    do  
        echo "Converting $f"; 
        convert "$f"  "../data/$(basename "$f" .tiff).png"; 
    done
   
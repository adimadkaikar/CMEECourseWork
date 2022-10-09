#!/bin/bash

MY_VAR=../data/Temperatures
MY_VAR=$(find $MY_VAR -type f -name "*.csv")
echo "$MY_VAR"

for f in $MY_VAR; 
    do  
        echo  "Creating a space separated version of  $f ..."
        cat $f | tr -s "," " " >> "../results/$(basename "$f" .csv).txt"
        echo "Done!"
    done

exit
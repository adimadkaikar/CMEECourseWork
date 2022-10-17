#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: CompileLaTeX.sh
#Descripton: Compiles .tex files into .pdf
#Arguements: 1 -> Filename of the .tex form ideally without the .tex suffix
#Date: Oct 2022


if [[ $1 =~ .*tex.* ]]; then
    #echo "Please input a '.tex' file"
    pdflatex $1
    bibtex $(basename "$1" .tex)
    pdflatex $1
    pdflatex $1
    evince $(basename "$1" .tex).pdf
else
    echo -n "Please enter a .tex file with the .tex extension (eg: MyExample.tex should be entered as MyExample.tex): "
    read in_file
    echo "$in_file"
    if [[ $in_file =~ .*tex.* ]]; then
      echo "Please input a '.tex' file"
      pdflatex $in_file
      bibtex $(basename "$in_file" .tex)
      pdflatex $in_file
      pdflatex $in_file
      evince $(basename "$in_file" .tex).pdf
    else
      echo "Enter a valid input"
      exit
    fi
fi

#Cleanup

rm *.aux
rm *.log
rm *.bbl
rm *.blg

exit

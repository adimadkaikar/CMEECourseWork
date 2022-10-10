#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: CompileLaTeX.sh
#Descripton: Compiles .tex files into .pdf
#Arguements: 1 -> Filename of the .tex form ideally without the .tex suffix
#Date: Oct 2022

if [[ $1 =~ .*tex.* ]]; then
  echo "It's there."
    pdflatex $1
    bibtex $(basename "$1" .tex)
    pdflatex $1
    pdflatex $1
    evince $(basename "$1" .tex).pdf
else
    echo "It's not there"
    pdflatex $1.tex
    bibtex $1
    pdflatex $1.tex
    pdflatex $1.tex
    evince $1.pdf
fi

#Cleanup

rm *.aux
rm *.log
rm *.bbl
rm *.blg

exit

#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: CompileLaTeX.sh
#Descripton: Compiles .tex files into .pdf
#Arguements: 1 -> Filename of the .tex form ideally without the .tex suffix
#Date: Dec 2022


pdflatex $1.tex
bibtex $1
pdflatex $1.tex
pdflatex $1.tex
evince $1.pdf &

## Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg
rm *.out
rm *.sum
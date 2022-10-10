#!/bin/bash

#Author: Aditi Madkaikar arm122@ic.ac.uk
#Script: tabtocsv.sh
#Descripton: Basic script to learn about variables in shell scripting
#Arguements: None
#Date: Oct 2022

##Illustrates the use of variables

#Special variables

echo "The script was called with $# parameters"
echo "The script's name is $0"
echo "The arguements are $@"
echo "The first arguement is $1"
echo "The second arguement is $2"

#Assigned variables
MY_VAR='Why not print this'

echo "The current value of this string is:" $MY_VAR
echo
echo "Please enter a new value:"
read MY_VAR
echo
echo "The current value of the variable is:" $MY_VAR
echo

#Assigned variables; Explicit declration

MY_VAR="some string"
echo "The current value of the variable is:" $MY_VAR
echo
read MY_VAR
echo
echo "The current value of the variable is:" $MY_VAR
echo

## Assigned VAriables; Reading(multiple values) from user input:

echo "Enter teo number separated by space(s)"
read a b 
echo
echo "you entered" $a "and" $b "; Their sum is:"

##Assigned variables; Command substitution
MY_SUM=$(expr $a + $b)
echo $MY_SUM
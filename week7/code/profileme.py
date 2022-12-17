#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: profileme.py
Descripton: Checking run time
Arguements: None
Date: Oct 2022
"""
def my_squares(iters):
    """
    Takes a number as input and outputs a list of squares of all numbers.
    """
    out = []
    for i in range(iters):
        out.append(i ** 2)
    return out

def my_join(iters, string):
    """
    Creates a string of length itter itteratively
    """
    out = ""
    for i in range(iters):
        out += string.join(", ")
    return out

def run_my_funcs(x, y):
    """
    Main running function
    """
    print(x, y)
    my_squares(x)
    my_join(x,y)
    
    return 0

run_my_funcs(10000000,"My string")
#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: boilerplate.py
Descripton: First python program
Arguements: None
Date: Oct 2022
"""

__appname__ = '[Type appname here]'
__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'

import numpy as np
def my_squares(iters):
    """
    Makes a list of all numbers in range iter using list comprehension
    """
    out = [i ** 2 for i in range(iters)]
    return out

def my_join(iters, string):
    """
    Makes a string of length iter 
    """
    out = ""
    for i in range(iters):
        out += ", " + string
    return out

def my_squares_np(iters):
    """ 
    Same as my_squares but using numpy
    """
    a = np.arange(iters)
    out = np.square(a)
    return out

def my_squares_np_l(iters):
    """
    Same as using my_squares but using numpy and loop
    """
    out = np.zeros(iters)
    for i in range(iters):
        out[i] = i ** 2
    return out

def run_my_funcs(x, y):
    """
    Function to run the other functions
    """
    print(x, y)
    my_squares(x)
    my_join(x, y)
    my_squares_np(x)
    my_squares_np_l(x)
    return 0

run_my_funcs(10000000,"My string")


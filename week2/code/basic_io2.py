#!/usr/bin/env python3

"""
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: basic_io2.py
Descripton: Program to write files using python
Arguements: None
Date: Oct 2022
"""

list_to_save = range(100)
f = open('../sandbox/testout.txt', 'w')
for i in list_to_save:
    f.write(str(i) + '\n')
f.close()
#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: loops.py
Descripton: Python loops
Arguements: None
Date: Oct 2022
"""

"""
Script showing loops
"""
for i in range(5):
    print(i)

my_list = [0, 2, "geronimo!", 3.0, True, False]
for k in my_list:
    print(k)

total = 0
summands = [0, 1, 11, 111, 1111]
for s in summands:
    total = total + s
    print(total)

z = 0 
while z < 100:
    z = z + 1
    print(z)

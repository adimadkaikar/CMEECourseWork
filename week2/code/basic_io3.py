#!/usr/bin/env python3
import pickle

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: basic_io3.py
Descripton: Program to read and write binary files
Arguements: None
Date: Oct 2022
"""

"""This script reads and writes a binary file"""

my_dictionary = {" a key": 10, "another key": 11}
f = open('../sandbox/testp.p', 'wb')
pickle.dump(my_dictionary, f)
f.close()

f = open('../sandbox/testp.p', 'rb')
another_dictionary = pickle.load(f)
f.close()

print(another_dictionary)
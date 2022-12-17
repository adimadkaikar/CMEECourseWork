#!/usr/bin/env python3
import csv

"""
This script shows how to import and export basic csv files.
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: basic_csv.py
Descripton: Csv input and output
Arguements: None
Date: Oct 2022
"""

with open('../data/testcsv.csv', 'r') as f:
    csvread = csv.reader(f)
    temp = []
    for row in csvread:
        temp.append(tuple(row))
        print(row)
        print("The species is:", row[0])

with open('../data/testcsv.csv', 'r') as f:
    with open('../data/bodymass.csv', 'w') as g:
        csvread = csv.reader(f)
        csvwrite = csv.writer(g)
        for row in csvread:
            print(row)
            csvwrite.writerow([row[0], row[4]])


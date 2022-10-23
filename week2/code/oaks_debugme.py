#!/usr/bin/env python3

"""
Script to align two sequences.
"""

__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'

# Importing the required modules
import csv
import sys
import doctest

#Define function
def is_an_oak(name):
    """ 
    Returns True if name is starts with 'quercus' 
    >>> is_an_oak('Fagus sylvatica')
    False

    >>> is_an_oak('Quercus petraea')
    True

    """
    return name.lower().startswith('quercus ')

def main(argv): 
    """This is the main entry point of the function"""
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0] + ' '):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])
    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()
#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: test_control_flow.py
Descripton: Use of control statements
Arguements: None
Date: Oct 2022
"""
"""
Some functions exemplifying the use of control statements
"""

__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'

from pydoc import doc
import sys
import doctest


def even_or_odd(x=0):
    """Find whether a number x is even or odd
    >>> even_or_odd(10)
    '10 is Even!'

    >>> even_or_odd(5)
    '5 is Odd ;('
    
    whenever float is provided nearest integer is used
    >>> even_or_odd(3.2)
    '3.2 is Odd ;('
    
    in case of negative numbers, the positive is taken
    >>> even_or_odd(-2)
    '-2 is Even!'
    """
    if x % 2 == 0:
        return f"{x} is Even!"
    return f"{x} is Odd ;("

def main(argv):
    """Main entry point of the program"""
    print(even_or_odd(22))
    print(even_or_odd(33))
    return 0

if __name__ == '__main__':
    """Makes sure the main function is called from the command line"""
    status = main(sys.argv)

doctest.testmod()

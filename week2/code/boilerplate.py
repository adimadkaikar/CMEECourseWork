#!/usr/bin/env python3

"""
This is my description ;) & I'm changing it
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

import sys
#import using_name
#import control_flow

def main(argv):
    """Main entry point of the program"""
    print("This is a boilerplate")
    #print(control_flow.find_all_primes(44))
    return False

if __name__ == '__main__':
    """Makes sure the main function is called from the command line"""
    status = main(sys.argv)
    sys.exit(status)

#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: control_flow.py
Descripton: Control flow program
Arguements: None
Date: Oct 2022
"""

"""
Some functions exemplifying the control of statements
"""

__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'

import sys

def even_or_odd(x=0):
    """Find whether a number x is even or odd"""
    if x % 2 == 0:
        return f"{x} x is Even!"
    return f"{x} is Odd ;("

def largest_divisor_five(x=120):
    """Find largest divisor of x among 2, 3, 4, 5"""
    #largest = 0
    if x % 5 == 0:
        largest = 5
    elif x % 4 == 0:
        largest = 4
    elif x % 3 == 0:
        largest = 3
    elif x % 2 == 0:
        largest = 2
    else:
        return f"No divisor found for {x} :("
    return f"The largest divisor of {x} is {largest}"

def is_prime(x=770):
    """Find whether an integer is prime"""
    for i in range(2, x):
        if x % i == 0:
            print(f"{x} is not a prime :( : {i} is a divisor")
            return False
        print(f"{x} is a prime!") 
        return True

def find_all_primes(x=22):
    """Finds all primes upto x"""
    allprimes = []
    for i in range(2, x + 1):
        if is_prime(i):
            allprimes.append(i)
    print(f"There are {len(allprimes)} between 2 and {x}")
    return allprimes

#print(even_or_odd(12))

def main(argv):
    """Main entry point of the program"""
    print(even_or_odd(22))
    print(even_or_odd(33))
    print(largest_divisor_five(120))
    print(largest_divisor_five(1))
    print(is_prime(60))
    print(is_prime(59))
    print(find_all_primes(100))
    return 0

if __name__ == '__main__':
    """Makes sure the main function is called from the command line"""
    status = main(sys.argv)
    sys.exit(status)

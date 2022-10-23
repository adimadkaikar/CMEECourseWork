#!/usr/bin/env python3

"""
Some basic functions. Half of them calculate factorial.
"""

__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'

import sys

def foo_1(x = 16):
    """Evalulates squareroot of x"""
    return x ** 0.5

def foo_2(x = 9, y = 2):
    """Finds the greater number"""
    if x > y:
        return x
    return y

def foo_3(x = 3, y = 2, z = 5):
    """Demo function. Should ideally sort the numbers in ascending order but it fails under certain conditions."""
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x = 10):
    """Factorial method 1"""
    result = 1 
    for i in range(1, x +1):
        result = result * i
    return result

def foo_5(x = 10):
    """Factorial method 2"""
    if x == 1:
        return 1
    return x * foo_5(x -1)

def foo_6(x = 10):
    """Factorial method 3"""
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

def main(argv):
    """Main entry point of the program"""
    print(foo_1(4))
    print(foo_2(5, 6))
    print(foo_3(6, 8, 9))
    print(foo_4(7))
    print(foo_5(8))
    print(foo_6(8))
    return 0

if __name__ == '__main__':
    """Makes sure the main function is called from the command line"""
    status = main(sys.argv)
    sys.exit(status)

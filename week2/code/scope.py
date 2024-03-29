#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: scope.py
Descripton: Scope of python variables
Arguements: None
Date: Oct 2022
"""
"""
Looing for varible scops
"""
i = 1
x = 0
for i in range(10):
    x += 1
print(x)
print(i)

i = 1
x = 0
def a_function(y):
    """
    Checking global variables
    """
    x = 0
    for i in range(y):
        x += 1
    return x
x = a_function(10)
print(x)
print(i)

_a_global = 10 # a global variable

if _a_global >= 5:
    _b_global = _a_global + 5 # also a global variable
    
print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    """
    Checking global variables
    """
    _a_global = 4 # a local variable
    
    if _a_global >= 4:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 3
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)

print("After calling a_function, outside the function, the value of _a_local is ", _a_local)

_a_global = 10

def a_function():
    """
    Difference between local and global variables
    """
    _a_local = 4
    
    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)
    
a_function()

print("Outside the function, the value of _a_global is", _a_global)

def a_function():
    """
    Another function
    """
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)

_a_global = 10

def a_function():
    """
    Another function 2
    """
    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)

a_function()

print("The value of a_global in main workspace / namespace is", _a_global)


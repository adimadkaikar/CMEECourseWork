#!/usr/bin/env python3

"""
This is my description ;)
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: oaks.py
Descripton: Basic Oaks
Arguements: None
Date: Oct 2022
"""
"""
Non-modular form of oaks
"""
taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea',
       ]

def is_an_oak(name):
    """
    Returns True if there is an oak
    """
    return name.lower().startswith('quercus ')

oaks_loop = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loop.add(species)
print(oaks_loop)

oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper())
print(oaks_loops)

oaks_uc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_uc)
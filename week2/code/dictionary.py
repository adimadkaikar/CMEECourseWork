#!/usr/bin/env python3

"""
This is my description ;) 
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: dictionary.py
Descripton: Dictionary comprehension
Arguements: None
Date: Oct 2022
"""

"""
Script for converting list to dictionary
"""
taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
# 
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. OR, 'Chiroptera': {'Myotis
#  lucifugus'} ... etc

#### Your solution here #### 

# Loopy way of populating dictionary
taxa_dic = dict()
for name, order in taxa:
        if order in taxa_dic:
                taxa_dic[order].add(name)
        else:
                taxa_dic[order] = set([name])

print(taxa_dic)

# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
 
#### Your solution here #### 
taxa_dic_lc = {x[1]:set(y[0] for y in taxa if x[1] == y[1]) for x in taxa}
print(taxa_dic_lc)
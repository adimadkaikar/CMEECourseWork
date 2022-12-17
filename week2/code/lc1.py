#!/usr/bin/env python3

"""
This is my description ;) & I'm changing it
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: lc1.py
Descripton: List Comprehension 1
Arguements: None
Date: Oct 2022
"""

"""
Script for converting tuples to list
"""
birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

latin_names_lc = [i[0] for i in birds]
commom_names_lc = [i[1] for i in birds]
body_mass_lc = [i[2] for i in birds]
print("Latin names: ")
print(latin_names_lc)
print("Common names: ")
print(commom_names_lc)
print("Body mass: ")
print(body_mass_lc)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

latin_names_loop = []
commom_names_loop =[]
body_mass_loop =[]

for i in birds:
#    print(i[0])
    latin_names_loop.append(i[0])
    commom_names_loop.append(i[1])
    body_mass_loop.append(i[2])

print("Latin names: ")
print(latin_names_loop)
print("Common names: ")
print(commom_names_loop)
print("Body mass: ")
print(body_mass_loop)

# A nice example out out is:
# Step #1:
# Latin names:
# ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
# ... etc.
 
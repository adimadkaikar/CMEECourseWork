"""
SCript for converting tuples to lists
"""
# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
 
high_rain_lc = [i for i in rainfall if i[1] > 100.0]
print("The months and rainfall values when the amount of rainfall was greater then 100mm: ")

print(high_rain_lc)

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

low_rain_lc = [i for i in rainfall if i[1] < 50.0]
print("The months and rainfall values when the amount of rainfall was lesser then 50mm: ")
print(low_rain_lc)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

high_rain_loop = []
for i in rainfall:
    if i[1] > 100.0:
#       print(i)
       high_rain_loop.append(i)
print("The months and rainfall values when the amount of rainfall was greater then 100mm: ")
print(high_rain_loop)

low_rain_loop = []
for i in rainfall:
    if i[1] < 50.0:
        low_rain_loop.append(i)
print("The months and rainfall values when the amount of rainfall was lesser then 50mm: ")
print(low_rain_loop)


# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.


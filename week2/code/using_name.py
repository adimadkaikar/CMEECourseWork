#!/user/bin/env python3

#Filename: using_python.py
"""
A weird script showing how python modules work
"""

if __name__ == '__main__':
    print("This program is running by itself")
else:
    print('I am being imported from another module')
print("This module's name is: " + __name__)

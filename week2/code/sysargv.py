#1/user/bin/env python3

"""
Script checking the system arguements
"""

import sys

print("This is the name of the script: ", sys.argv[0])
print("Numer of arguements: ", len(sys.argv))
print("The arguements are: ", str(sys.argv))
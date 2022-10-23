#!/usr/bin/env python3

"""
Script to align two sequences.
"""

__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'

# Importing the required modules
import sys

def calculate_score(s1, s2, l1, l2, startpoint):
    """
    This function calculates the best source when s1, s2, l1, l2 and the startpoint are provided. 
    It aligns the shorter sequence at the startpoint location of the longer sequence and calculates the number of matching base pairs
    Ig you want to import this function as a module, assign the longer sequence s1, and the shorter to s2. 
    l1 is length of the longest, l2 that of the shortest
    """
    matched = "" # to hold string displaying alignements
    score = 0
    #import ipdb; ipdb.set_trace()
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    print("." * startpoint + matched)           
    print("." * startpoint + s2)
    print(s1)
    print(score) 
    print(" ")

    return score

# Assign the longer sequence s1, and the shorter to s2
# # l1 is length of the longest, l2 that of the shortest

def main(argv):
    """
    Main entry point of the program.
    This program takes a .txt file as input and then calculates the best score among the two sequences.
    It prints the outout to another .txt file which is then stored in the results directory
    """
    
    # Opening the data file
    with open('../data/seqs.txt', 'r') as f:
        temp = []
        for line in f:
            temp.append(line.split('\n')[0])

    # Asigning the sequences
    seq1 = temp[0]
    seq2 = temp[1]

    # Assign the longer sequence s1, and the shorter to s2
    # l1 is length of the longest, l2 that of the shortest

    l1 = len(seq1)
    l2 = len(seq2)
    if l1 >= l2:
        s1 = seq1
        s2 = seq2
    else:
        s1 = seq2
        s2 = seq1
        l1, l2 = l2, l1 # swap the two lengths
    
# now try to find the best match (highest score) for the two sequences
    my_best_align = None
    my_best_score = -1

    for i in range(l1): # Note that you just take the last alignment with the highest score
        z = calculate_score(s1, s2, l1, l2, i)
        if z > my_best_score:
            my_best_align = "." * i + s2 # think about what this is doing!
            my_best_score = z 
    print(my_best_align)
    print(s1)
    print("Best score:", my_best_score)

    list_to_save = [my_best_align, s1, 'Best score: ', my_best_score]

    f = open('../results/best_align.txt', 'w+')
    for i in list_to_save:
        f.write(str(i) + '\n')
    f.close() 
    return 0

if __name__ == '__main__':
    """Makes sure the main function is called from the command line"""
    status = main(sys.argv)
    sys.exit(status)

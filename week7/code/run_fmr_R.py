#!/usr/bin/env python


import subprocess


p = subprocess.Popen("Rscript ../code/fmr.R", shell=True).wait()
if p==0:
    print("Successful run from python!")
else: 
    print("Fatal error. Please fix and retry :)")
#!/usr/bin/env python3

"""
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: LV2.py
Descripton: Lotka-Volterra model for predator prey interactions taking into account carrying capacity.
Arguements: None
Date: Oct 2022
"""

import numpy as np
from scipy import stats 
from scipy import integrate 
import matplotlib.pylab as p
import sys

def dCR_dt(pops, t=0):
    """_summary_

    Args:
        pops (int): Predator and prey population at time t
        t (int, optional): _description_. Defaults to 0.

    Returns:
        list: List if rate of changes of redator and prey 
    Function for LV model
    """
    R = pops[0]
    C = pops[1]
    dRdt = r * R * (1 - R/K) - a * R * C
    dCdt = -z * C + a * e * R * C
    
    return np.array([dRdt, dCdt])

if __name__ == '__main__':
    """
    This is the main entry point of the function. It controls  the flow of the script
    """
    
    if len(sys.argv)==6:
        
        r = np.float64(sys.argv[1])
        a = np.float64(sys.argv[2])
        z = np.float64(sys.argv[3])
        e = np.float64(sys.argv[4])
        K = np.float64(sys.argv[5])
    else:
        r = 2.
        a = 0.1
        z =1.5
        e = 0.75
        K = 100

    t = np.linspace(0, 200, 2000)

    R0 = 1
    C0 = 1
    RC0 = np.array([R0, C0])

    pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)


    print(infodict['message'])
    print(f"The final prey population is {pops[-1,0]}")
    print(f"The final predator population is {pops[-1,1]}")

    f1 = p.figure()

    p.plot(t, pops[:,0], 'g-', label = 'Resource density')
    p.plot(t, pops[:, 1], 'b-', label = 'Consumer density')
    p.grid()
    p.legend(loc="best")
    p.text(175,1.15, f'r:{r}\na:{a}\nz:{z}\ne:{e}', size=12)
    p.xlabel('Time')
    p.ylabel('Population density')
    p.title('Consumer-Resource population dynamics')
    #p.show()

    f1.savefig('../results/LV2_model.pdf')

    f2 = p.figure()
    p.plot(pops[:,0], pops[:,1], 'b-')
    p.grid()
    p.xlabel('Resource density')
    p.ylabel('consumer density')
    p.title('Consumer-Resource population dynamics')
    #p.show()
    f2.savefig("../results/LV2_model2.pdf")
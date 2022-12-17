#!/usr/bin/env python3

"""
Author: Aditi Madkaikar arm122@ic.ac.uk
Script: LV1.py
Descripton: Lotka-Volterra model for predator prey interactions
Arguements: None
Date: Oct 2022
"""

__appname__ = '[Type appname here]'
__author__ = 'Aditi Madkaiakr (arm122@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = 'None'
"""
This module simulates the Lotka-Volterra model for population growth 
NOT taking into account the carrying capacity.
"""

# Importing all the required modules
import numpy as np
from scipy import stats 
from scipy import integrate 
import matplotlib.pylab as p

def dCR_dt(pops, t=0, r = 1., a = 0.1, z = 1.5, e = 0.75):
    """
    This function shows the system of differential equation for the Lotka-Volterra model
    """
    R = pops[0]
    C = pops[1]
    dRdt = r * R - a * R * C
    dCdt = -z * C + a * e * R * C
    
    return np.array([dRdt, dCdt])

if __name__ == '__main__':
    """This is the main entry point of the function. It controls  the flow of the script"""
    
    r = 1.
    a = 0.1
    z =1.5
    e = 0.75
    t = np.linspace(0, 15, 1000)

    R0 = 10
    C0 = 5
    RC0 = np.array([R0, C0])
    pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)

    type(infodict)
    infodict.keys()

    print(infodict['message'])

    f1 = p.figure()

    p.plot(t, pops[:,0], 'g-', label = 'Resource density')
    p.plot(t, pops[:, 1], 'b-', label = 'Consumer density')
    p.grid()
    p.legend(loc="best")
    p.xlabel('Time')
    p.ylabel('Population density')
    p.title('Consumer-Resource population dynamics')
    #p.show()

    f1.savefig('../results/LV_model.pdf')

    f2 = p.figure()
    p.plot(pops[:,0], pops[:,1], 'r-')
    p.grid()
    p.xlabel('Resource density')
    p.ylabel('consumer density')
    p.title('Consumer-Resource population dynamics')
    #p.show()
    f2.savefig("../results/LV_model2.pdf")

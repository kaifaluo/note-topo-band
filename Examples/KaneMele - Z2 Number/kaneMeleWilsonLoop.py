# -*- coding: utf-8 -*-
"""
Created on Sat Feb 22 22:04:42 2020

@author: luokaifa
"""

import time
import math
import numpy as np
import matplotlib.pyplot as plt

s0 = np.array([[1, 0], [0, 1]])
s1 = np.array([[0, 1], [1, 0]])
s2 = np.array([[0, -1j], [1j, 0]])
s3 = np.array([[1, 0], [0, -1]])
t0 = np.array([[1, 0], [0, 1]])
t1 = np.array([[0, 1], [1, 0]])
t2 = np.array([[0, -1j], [1j, 0]])
t3 = np.array([[1, 0], [0, -1]])

kron = np.kron
cos = np.cos
sin = np.sin
sqrt = np.sqrt
pi = np.pi

GM0 = kron(s0,t0)
GM1 = kron(s0,t1)
GM2 = kron(s0,t3)
GM3 = kron(s1,t2)
GM4 = kron(s2,t2)
GM5 = kron(s3,t2)

GM12 = kron(s0,-t2)
GM15 = kron(s3, t3)
GM23 = kron(s1,-t1)
GM24 = kron(s2,-t1)

t = 1
lam_r = 0.05*t
lam_so = 0.06*t
lam_v = 0.1*t


Nx = 30
Ny = 200

phis = np.empty((Ny+1,2))
phis1 = np.empty((Ny+1,2))
for j in range(Ny+1):
    ky = j * (np.pi/(Ny))
    
    wave = np.zeros((4,2*(Nx+1)), dtype='complex64')
    for i in range(Nx):
        kx = i * (2*np.pi/(Nx))
        Hk = t * (1 + 2 * cos(kx/2) * cos((sqrt(3)/2) * ky)) * GM1\
                + lam_v * GM2 \
                + lam_r * (1 - cos(kx/2) * cos((sqrt(3)/2) *ky)) * GM3\
                - sqrt(3) * lam_r * sin(kx/2) * sin((sqrt(3)/2) * ky) * GM4\
                - 2 * t * cos(kx/2) * sin((sqrt(3)/2) * ky) * GM12\
                + 2 * lam_so * (sin(kx) - 2 * sin(kx/2) * cos((sqrt(3)/2) * ky)) * GM15 \
                - lam_r * cos(kx/2) * sin ((sqrt(3)/2) * ky) * GM23 \
                + sqrt(2) * lam_r * sin(kx/2) * cos((sqrt(3)/2) * ky)*GM24
        energies, states = np.linalg.eigh(Hk)     
        wave[:,2*i]=(states[:,0])
        wave[:,2*i+1]=(states[:,1])
                
    wave[:,2*(Nx)] = wave[:,0]
    wave[:,2*(Nx)+1] = wave[:,1]
    WC = s0
    Fk = np.zeros((2,2), dtype='complex64')
    for k in range(Nx):
        Fk[0,0] = np.vdot(wave[:,2*k], wave[:,2*(k+1)])
        Fk[0,1] = np.vdot(wave[:,2*k], wave[:,2*(k+1)+1])
        Fk[1,0] = np.vdot(wave[:,2*k+1], wave[:,2*(k+1)])
        Fk[1,1] = np.vdot(wave[:,2*k+1], wave[:,2* (k+1)+1])
        WC = np.dot(WC , Fk)
    
    WC_lambda, WC_states=np.linalg.eig(WC)    
    WC = (np.log(WC_lambda).imag)/pi
    
    for i in range(2):
        if -1<= WC[i] <=1:
            phis[j,i] = WC[i]
        elif WC[i] < -1:
            phis[j,i] = WC[i] + round(np.abs(WC[i])/2)*2
        else:
            phis[j,i] = WC[i] - round(np.abs(WC[i])/2)*2
    
    for i in range(2):
        if WC_lambda[i].real>0 and WC_lambda[i].imag>=0:
            phis1[j,i] = (math.atan(WC_lambda[i].imag / WC_lambda[i].real))/pi
            
        elif WC_lambda[i].real<0 and WC_lambda[i].imag>=0:
            phis1[j,i] = ((np.pi - math.atan(np.abs(WC_lambda[i].imag / WC_lambda[i].real))))/pi
            
        elif WC_lambda[i].real>0 and WC_lambda[i].imag<0:
            phis1[j,i] = (( math.atan(WC_lambda[i].imag / WC_lambda[i].real)))/pi
        else:
            phis1[j,i] = ((math.atan(WC_lambda[i].imag / WC_lambda[i].real) - np.pi*(1-np.sign(WC_lambda[i].imag))/2))/pi

ky = np.linspace(0,1,Ny+1)
plt.figure()
plt.plot(ky, phis[:,0],'.')
plt.plot(ky, phis[:,1],'.')
plt.axis([0,1,-1,1])
plt.yticks([-1,0,1])
plt.xlabel("$k_{y}/\pi$")
plt.ylabel("$\phi/\pi$")
# plt.legend(loc='best')
plt.show()
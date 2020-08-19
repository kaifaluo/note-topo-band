%% Hamil_PBC: function description
function [H] = Hamil_PBC(ka,kb,kc)

L1=1;
L2=0.5;
L3=1;
LAB=1.2; 
LAA=100;
LBB=100; 
LGA=1;
LGB=1;

t1=-1/L1;
t2=-1/L2;
t3=-1/L3;
t4=-1/LAB;
tA=-1/LAA;
tB=-1/LBB;
mu0=(1/LGA+1/LGB)/2;
mud=(1/LGA-1/LGB)/1;

dx=t1+t2*cos(kb-ka)+t3*cos(ka)+t4*cos(ka-kc);
dy=t2*sin(-kb+ka)+t3*sin(ka)+t4*sin(ka-kc);
dz=(1/LAA-1/LBB)*(1-cos(kc))+mud;
d0=-(t1+t2+t3+t4)-(tA+tB)*(1-cos(kc))+mu0;
H=[d0+dz,dx-1j*dy;
   dx+1j*dy,d0-dz];...
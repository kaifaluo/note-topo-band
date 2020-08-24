close all; clear all; clc;

%% Kpath:   Gamma-Z-F-Gamma-L

G=[0,0,0];
L=[1/2,0,0];
K=[	0.8228956288	0.1771043712	0.5000000000];

m=[K;G;L];

a=[2.057	1.1876	9.548];
b=[-2.057	1.1876	9.548];    
c=[0	-2.3752	9.548]; 

v=dot(a,cross(b,c));
k1=2*pi*cross(b,c)./v;
k2=2*pi*cross(c,a)./v;
k3=2*pi*cross(a,b)./v;

k=[k1;k2;k3];

path=m*k;
path(:,3)=[0 0 0]';
save('input\path.mat','path');
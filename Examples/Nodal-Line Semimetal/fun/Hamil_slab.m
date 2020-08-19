%% Hamil_slab: function description
function [H] = Hamil_slab(n_uc,ka,kb)

L1=1;
L2=0.5;
L3=1;
LAB=1.2;          
LAA=100;
LBB=100;   
LB0=1;
LA0=1;

t1=-1/L1;
t2=-1/L2;
t3=-1/L3;
t4=-1/LAB;
tA=-1/LAA;
tB=-1/LBB;
muA=1/L1+1/L2+1/L3+2/LAA+1/LAB+1/LA0;
muB=1/L1+1/L2+1/L3+2/LBB+1/LAB+1/LB0;


H=zeros(n_uc*2);
h_AB1=t1+t2*exp(1j*(kb-ka))+t3*exp(-1j*ka);
h_AB2=t4*exp(1j*ka);
for j = 1:n_uc-1
	H(2*j-1,2*j-1) = muA/2;
	H(2*j,2*j) = muB/2;
    H(2*j-1,2*j+1) = tA;
    H(2*j,2*j+2) = tB;
    H(2*j-1,2*j) = h_AB1;
	H(2*j,2*j+1) = h_AB2;
end
H(1,1) = (muA+tA)/2;
H(2,2) = (muB+tB)/2;
H(end-1,end-1) = H(1,1);
H(end,end) = H(2,2);
H(end-1,end) = h_AB1;
H=H+H';
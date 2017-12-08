function [eigvalue,nk_label] = EigSlab(num_unitcell,K_path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
%% lattice basis in 2D(kx-ky plane)============%%													
R_1=[1 0];R_2=[-1 0];R_3=[0 1];R_4=[0 -1];		   	%%						
%  hopping terms(interactive elements)--------------%%													
L1=1;L2=0.365;L3=1;LAB=1;                             %%          
LAA=20;LBB=100;                                     %%
LB0=1;mu=-0.50;LA0=1/(LB0+2*mu*(1/LAA-1/LBB));       %%	
%  calculation scale--------------------------------%%														
%===================================================%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ==============================================
%the path in BZ
%1: (0,0,0)                        0 0 0
%2: (pi,-sqrt(3)/3*pi,0)           0.5 0 0
%3: (4/3*pi,0,0)                   1/3 1/3 0
%4: (0,0,0)                        0 0 0
%% ==========================================
K_path_temp=K_path;
[K,nk_label]=GeneKPoint(K_path_temp);
n_k=nk_label(end);
% %==================================================
%% =============================================
eigvalue=zeros(2*num_unitcell,n_k);
h_AA=-1/LAA;
h_BB=-1/LBB;
e_A=1/L1+1/L2+1/L3+2/LAA+1/LAB+1/LA0;
e_B=1/L1+1/L2+1/L3+2/LBB+1/LAB+1/LB0;
for i = 1:n_k
	Y=zeros(num_unitcell*2);
    h_AB1=-(1/L1+1/L2*exp(1j*(K(i,2)-K(i,1)))+1/L3*exp(-1j*K(i,1)));
    h_AB2=-1/LAB*exp(1j*K(i,1));
	for j=1:num_unitcell-1
		Y(2*j-1,2*j-1)=e_A;
		Y(2*j-1,2*j)=h_AB1;
		Y(2*j,2*j-1)=h_AB1';
        Y(2*j-1,2*j+1)=h_AA;
        Y(2*j+1,2*j-1)=h_AA';
	end
	for j=1:num_unitcell-1
		Y(2*j,2*j)=e_B;
		Y(2*j,2*j+1)=h_AB2;
		Y(2*j+1,2*j)=h_AB2';
        Y(2*j,2*j+2)=h_BB;
        Y(2*j+2,2*j)=h_BB';
    end
     Y(1,1)=1/L1+1/L2+1/L3+1/LAA+1/LA0+1/LAB;
     Y(2,2)=1/L1+1/L2+1/L3+1/LBB+1/LAB+1/LB0;
     Y(2*num_unitcell-1,2*num_unitcell-1)=1/L1+1/L2+1/L3+1/LAA+1/LAB+1/LA0;
     Y(2*num_unitcell,2*num_unitcell)=1/L1+1/L2+1/L3+1/LBB+1/LB0+1/LAB;
     Y(2*num_unitcell-1,2*num_unitcell)=h_AB1;
     Y(2*num_unitcell,2*num_unitcell-1)=h_AB1';
	%----------------------------------------------------------
	[v,D]=eig(Y);
	%----------------------------------------------------------
	for j = 1:2*num_unitcell
   	   eigvalue(j,i)=sqrt(D(j,j));
	end
end
toc
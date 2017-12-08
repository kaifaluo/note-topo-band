%% berryPhase: to calculate the berryPhase along K_path
function [berryPhase,nk_label,text_parameter] = berryPhase(K_path,nk)

%% =========================================
a_1 = [1 0 0];
a_2 = [0 1 0];
a_3 = [0 0 1];
%---------------------------------

%-----------------------------------
L1=1;L2=0.5;L3=1;LAB=1;LAA=10;LBB=10;
%=======================================

%% ==============================
[K,nk_label]=GeneKPoint(K_path);
n_k=nk_label(end);

% %% ===============================================
% %-----------------------------------------------------
% %the path in BZ
% %1: (0,0,0)                        0 0 0
% %2: (pi,-sqrt(3)/3*pi,0)           0.5 0 0
% %3: (4/3*pi,0,0)                   1/3 1/3 0
% %4: (0,0,0)                        0 0 0
%%------------------------------------------
num_kz=40;
k_z=linspace(0,2*pi,num_kz);
v_11=zeros(n_k,num_kz);v_12=zeros(n_k,num_kz);
for i =1:n_k
	K_3D=zeros(num_kz,3);
	for j =1:num_kz
		K_3D(j,:)=[K(i,:) k_z(j)];
        H_AA=(1/L1+1/L2+1/L3+2/LAA)-2/LAA*cos(K_3D(j,3));
        H_BB=(1/L1+1/L2+1/L3+2/LBB)-2/LBB*cos(K_3D(j,3));
		H_AB=-(1/L1+...
			   1/L2*exp(1j*(K_3D(j,2)-K_3D(j,1)))+...
			   1/L3*exp(-1j*K_3D(j,1))+...
		  	 1/LAB*exp(1j*(K_3D(j,3)-K_3D(j,1)))...
               );
		H = [H_AA H_AB;H_AB' H_BB];
		[v,D]=eig(H);
        if D(1,1)>D(2,2)
            v_11(i,j)=v(1,2);v_12(i,j)=v(2,2);
        else
            v_11(i,j)=v(1,1);v_12(i,j)=v(2,1);
        end
    end
end
%%==========================================================


%% calculate the berryPhase(i)===========================
berryPhase=zeros(1,n_k);
for i = 1:n_k
    F_temp=1;
    BP_temp=0;
    k=1;
    for j =1:num_kz-1
        F_temp = (v_11(i,j)')*v_11(i,j+1)+(v_12(i,j)')*v_12(i,j+1);
        BP_temp = BP_temp + log(F_temp);
        k=k+1;
        if k == num_kz
            F_temp = (v_11(i,k)')*v_11(i,1)+(v_12(i,k)')*v_12(i,1);
            BP_temp = BP_temp+log(F_temp);
        end
    end
    berryPhase(i)=mod(imag(BP_temp),2*pi);
end
%%===================================================

text_parameter=['L_1=' num2str(L1) ', L_2=' num2str(L2) ', L_3=' num2str(L3) ...
  ', L_{AB}=' num2str(LAB) ', L_{AA}=' num2str(LAA) ', L_{BB}=' num2str(LBB)...
  ];

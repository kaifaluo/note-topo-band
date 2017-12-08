%% CalChernNum: Calculate the Chern Number over ka-kb space
%%For example, when a=2,b=3, that means we will scan Chern Number along
%%k1-axis.
function [chernNum] = CalChernNum(a,b,n_k)
%% ====================================
global L1 L2 L3 LAB LAA LBB mu n_k1 n_k2 n_k3;
L1=1;L2=0.5;L3=L1;LAB=L3;                             
LAA=2;LBB=10;mu=-0.5;

%% =======================================
n_k2=150;
n_k3=150;

%% ======================================
if (a==1 && b==2) || (a==2 && b==1);
	n_ka=n_k2;n_kb=n_k3;n_kc=n_k;
elseif (a==1 && b==3) || (a==3 && b==1);
	n_ka=n_k2;n_kb=n_k;n_kc=n_k3;
else (a==2 && b==3) || (a==3 && b==2);
	n_ka=n_k;n_kb=n_k2;n_kc=n_k3;
end
k1=linspace(-pi,pi,n_ka);
k2=linspace(-pi,pi,n_kb);
k3=linspace(-pi,pi,n_kc);
%----------------------------
Vel_a = zeros (n_k2,n_k3);
Vel_b = zeros (n_k2,n_k3);
E_1 = zeros (n_k2,n_k3);
E_2 = zeros (n_k2,n_k3);
chernNum=zeros(1,n_k);
curvature=zeros(n_k2,n_k3,n_k);
%% ============================
for ika = [1:n_k]
    
	    for ikb = [1:n_k2]
        	for ikc =[1:n_k3]
              K_3D = [k1(ika) k2(ikb) k3(ikc)];
          	  [D,Velocity_a,Velocity_b]=EigHamil(@eig,a,b,K_3D);
          	  E_1(ikb,ikc) = D(1,1);
			  E_2(ikb,ikc) = D(2,2);
			  Vel_a(ikb,ikc) = Velocity_a;
			  Vel_b(ikb,ikc) = Velocity_b;
			  end
        end
        curvature(:,:,ika) = 2*imag((Vel_a.*Vel_b)./((E_2-E_1).^2));
        chernNum(ika) = sum(sum(curvature(:,:,ika)))*((2*pi/n_k2)*(2*pi/n_k3))/(2*pi);
        
end
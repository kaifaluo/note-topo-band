%% gene_surf_Green: function description
function [ves] = gene_surf_Green(omega,K)

%%
C1=1;
C2=0.5;
C3=1;
C4=0.833; 
CAA=0.2;
CBB=0.01; 
CGA=0.77;
CGB=1;

t1=-C1;
t2=-C2;
t3=-C3;
t4=-C4;
tA=-CAA;
tB=-CBB;

%%
a=[1,0,0]';
b=[0,1,0]';
c=[0,0,0]';

H0_AB = t1 + t2*exp(-1j*K*(b-a)) + t3*exp(-1j*K*a);
H0_AA = C1+C2+C3+C4+CGA+2*CAA;
H0_BB = C1+C2+C3+C4+CGB+2*CBB;
H00 = [H0_AA, H0_AB; ...
       H0_AB', H0_BB];

H1_AB = t4*exp(-1j*K*(c-a));
H01 = [tA, H1_AB; ...
       H1_AB', tB];
H10 = H01';

a = H01;
ve = H00;
b = H10;
ves = H00;
%%
thres = 1E-10;
eta=1E-12;

N=100; %% the maximum number of iteration times

for i=1:N
	temp=(omega*eye(2)-ve+1j*eta)^(-1);
	ve = ve + a*temp*b + b*temp*a;
	ves = ves + b*temp*a;
	a = a*temp*a;
	b = b*temp*b;
	if sum(sum(abs(a)))<thres && sum(sum(abs(b)))<thres
		break;
	end
	if i == N
		disp(i);
	end
end
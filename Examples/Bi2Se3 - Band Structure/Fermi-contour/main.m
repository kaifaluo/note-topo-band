clear all; 
clc;

%%
tic
load('input\k_list.mat');
k_list=KPoints;
LEN=length(KPoints(:,1));

omega_max = 0.28;
omega_min = 0.278;
kk=30;
%omega=linspace(omega_min,omega_max,kk);
omega=0.05;
thres=1E-10;
eta=(omega_max-omega_min)/kk*1.5;

iter=zeros(LEN,1);
DOS=zeros(LEN,1);

max=100;

for i =1:LEN
    ka=k_list(i,1);kb=k_list(i,2);kc=k_list(i,3);
    H00=kron(eye(2),H_ql(ka,kb,kc))+H_soc();
    H01=kron(eye(2),H_ql2(ka,kb,kc));
    H10=H01';
        a = H01;
        ve = H00;
        b = H10;
        ves = H00;
        for k=1:max
            temp=(omega*eye(40)-ve+1i*eta*eye(40))^-1;
            ve=ve+a*temp*b+b*temp*a; %%(体态)
            ves=ves+b*temp*a; %%(上表面)
            %ves=ves+a*temp*b; %%(下表面)
            a=a*temp*a;
            b=b*temp*b;      
            if sum(sum(abs(a)))<thres && sum(sum(abs(b)))<thres
                break
            end
        GF = inv((omega+1j*eta)*eye(40)-ves);
        DOS(i) = -imag(trace(GF))/pi;
    end
end

DOS = log(DOS-min(min(DOS))+1)*100;
A = k_list(:,1);
B = k_list(:,2);
C = DOS;

tri=delaunay(A,B);
patch(A,B,C)
patch('Faces',tri,'Vertices',[A,B],'FaceVertexCData',C, ...
    'FaceColor','interp','EdgeColor','none'); hold on;
toc
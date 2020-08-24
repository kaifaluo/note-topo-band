clear all; clc;

%%
tic

data=load('input\path.mat');
path=data.path;
nk=100;

[k_list,k_label,nk] = gene_k_list(path,nk);
E_rag = 0.4;
nE = 200;
E_list = linspace(-E_rag,E_rag,nE);

thres = 1E-3;
%eta = 2*E_rag/nE*5;
eta = 1E-5;
DOS = zeros(nk,nE);
max = 500;

for ii =1:nk
    disp(ii)
    ka=k_list(ii,1);kb=k_list(ii,2);kc=k_list(ii,3);
    H00=kron(eye(2),H_ql(ka,kb,kc))+H_soc();
    H01=kron(eye(2),H_ql2(ka,kb,kc));

    for jj=1:nE
        a = H01; ve = H00; b = a';  ves = H00;
        for kk = 1:max
            temp = inv((E_list(jj)+1j*eta)*eye(40)-ve);
            ve = ve+a*temp*b+b*temp*a;
            ves = ves+b*temp*a;  %% top surface
            a = a*temp*a;
            b = b*temp*b;
            if sum(sum(abs(a)))<thres && sum(sum(abs(b)))<thres
                break
            end
        end
        GFs = inv(E_list(jj)*eye(40)-ves);
%       GFb = inv(E_list(jj)*eye(40)-ve);
%       GF = GFs + GFb;
        DOS(ii,jj)=-imag(trace(GFs))/pi;
    end
end

DOS = log(DOS-min(min(DOS))+1)*100;
[X,Y]=meshgrid(E_list,1:nk);
surf(X,Y,DOS); shading interp
toc


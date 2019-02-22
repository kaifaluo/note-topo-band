%% berryPhase: to calculate the berryPhase along K_path
function [berryPhase,nk_label,nk] = gene_BerryPhase(K_path,nk)

%% ==============================
[k_list,nk_label,nk]=gene_k_list(K_path,nk);
nkc=40;
kc_list=linspace(0,2*pi,nkc);
v_11=zeros(nk,nkc);v_12=zeros(nk,nkc);
for i =1:nk
	K_3D=zeros(nkc,3);
    ka=k_list(i,1);kb=k_list(i,2);
	for j =1:nkc
        kc=kc_list(j);
        H = Hamil_PBC(ka,kb,kc);
		[v,D]=eig(H);
        v_11(i,j)=v(1,1);v_12(i,j)=v(2,1);
    end
end

%%===================================================
berryPhase=zeros(nk,1);
for i = 1:nk
    BP_temp=0;
    v1_tmp=v_11(i,:);
    v2_tmp=v_12(i,:);
    F = conj(v1_tmp).*v1_tmp([2:nkc,1])+conj(v2_tmp).*v2_tmp([2:nkc,1]);
    BP= sum(log(F));
    berryPhase(i)=mod(imag(BP),2*pi);
    if berryPhase(i) > 2*pi-0.05
         berryPhase(i)=0;
     end
end

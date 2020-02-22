%% gene_band: function description
function [E_list,k_list,k_label,nk] = gene_band(K_path,nk)

[k_list,k_label,nk]=gene_k_list(K_path,nk);
LEN=k_label(end);
temp=zeros(40,40);
E_list=zeros(LEN,40);

for i =1:LEN
    ka=k_list(i,1);kb=k_list(i,2);kc=k_list(i,3);
    temp(1:20,1:20)=Hamil_0(ka,kb,kc);
    temp(21:40,21:40)=Hamil_0(ka,kb,kc);
    H=temp+Hamil_soc();
    [v,D]=eig(H);
    E_list(i,:)=diag(D);
end

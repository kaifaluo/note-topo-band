%% gene_band: function description
function [E_list,k_list,k_label,nk] = gene_band(K_path,nk)

%------------------------------------------
[k_list,k_label,nk]=gene_k_list(K_path,nk);
LEN=k_label(end);
E_list=zeros(LEN,2);
for i =1:LEN
    ka=k_list(i,1);kb=k_list(i,2);kc=k_list(i,3);
	H = Hamil_PBC(ka,kb,kc);
    [v,D]=eig(H);
    E_list(i,:)=diag(D);
end

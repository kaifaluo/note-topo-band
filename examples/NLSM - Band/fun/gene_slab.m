function [eigvalue,nk_label,nk] = gene_slab(n_uc,nk,K_path)

tic													
K_path(:,3)=0;
[k_list,nk_label,nk]=gene_k_list(K_path,nk);
eigvalue=zeros(2*n_uc,nk);
for i = 1:nk
	ka=k_list(i,1);kb=k_list(i,2);
	H = Hamil_slab(n_uc,ka,kb);
	[v,D]=eig(H);
	eigvalue(:,i)=diag(D);
end
toc
function [k_list,nk_lab,nk]=gene_k_list(K,nk)

nK=length(K(:,1));
DK=diff(K);
K_norm=zeros(1,nK-1);
for i = 1:nK-1
	K_norm(i) = norm(DK(i,:));
end

nk_seg = round(nk*(K_norm/sum(K_norm)));	
nk_lab = [0,cumsum(nk_seg)];
nk=sum(nk_seg);

k_list=zeros(nk,3);
for i = 1:nK-1
	kx_list=linspace(K(i,1),K(i+1,1),nk_seg(i))';
	ky_list=linspace(K(i,2),K(i+1,2),nk_seg(i))';
	kz_list=linspace(K(i,3),K(i+1,3),nk_seg(i))';
	k_list(nk_lab(i)+1:nk_lab(i+1),:) = [kx_list,ky_list,kz_list];
end
%% gene_WilsonLoop: function description
function [WC] = gene_WilsonLoop(nkx,sz_H)

kx = linspace(-pi,pi,nkx);
WC = zeros(nkx,1);

nk0 = 20;

for i=1:nkx
    K_path = [kx(i),0,0;kx(i),2*pi,0];
    [K,nk_label,nk0] = gene_k_list(K_path,nk0);
    H_list=zeros(sz_H,sz_H,nk0);
    for j = 1:nk0
        H_list(:,:,j) = Hamil_QWZ(K(j,1),K(j,2),K(j,3));
    end
    WC(i) = gene_WC(H_list);
end
%% gene_ChernNum: function description
function [ChernNum] = gene_ChernNum(kx_list,nk0)


ky = linspace(-pi,pi,nk0)';
kz = linspace(-pi,pi,nk0)';
k_list=zeros(nk0^2,2);
for i = 1:nk0
	k_list((i-1)*nk0+1:i*nk0,:) = [ky(i)*ones(nk0,1),kz];
end
nkk = length(k_list(:,1));
BCu = zeros(nkk,1);
nk=length(kx_list);
ChernNum=zeros(nk,1);
%%==================================

for j = 1:nk
	for i = 1:nkk
	M = Hamil_Chern(K_3D);
		BCu(i) = -1/(4*pi)*det(M)/(d1^2+d2^2+d3^2)^(3/2);
	end
	ChernNum(j) = (2*pi/nk0)^2*sum(BCu);
end

thres=0.02;
ChernNum(ChernNum>1+thres)=1;
ChernNum(ChernNum<-1-thres)=-1;
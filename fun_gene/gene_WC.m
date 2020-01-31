%% gene_WC: to calculate the WC along K_path
function [WC] = gene_WC(H_list)

nk0=length(H_list(1,1,:));
vo=zeros(2,nk0+1); %% nk0+1 instead of nk0, is ready for the circular inner product

for i =1:nk0
    H = H_list(:,:,i);
	[v,D]=eig(H);
    if real(D(1,1)) > real(D(2,2))
       vo(:,i)=v(:,2);
    else
       vo(:,i)=v(:,1);
    end
end

vo(:,end)=vo(:,1);

%% ==calculate the WC=========================

WC=0;
for i =1:nk0
    F = dot(vo(:,i),vo(:,i+1));
    WC = WC + log(F);
end

WC = imag(WC);

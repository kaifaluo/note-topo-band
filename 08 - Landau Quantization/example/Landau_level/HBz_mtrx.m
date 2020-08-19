%%
function H=HBz_mtrx(kz,Bz)
load paras.mat;


H=zeros(2*N,2*N);

L=sqrt(1/Bz);


for in=1:N
    H(2*(in-1)+1,2*(in-1)+1)=(C+m)+(A+B)*(2*(in+0.5)/L/L+kz^2);
    H(2*(in-1)+2,2*(in-1)+2)=(C-m)+(A-B)*(2*(in+0.5)/L/L+kz^2);
    H(2*(in-1)+1,2*(in-1)+2)=-1j*betap*Bz*kz;
    H(2*(in-1)+2,2*(in-1)+1)=+1j*betap*Bz*kz;
    if (in<N-1)
        H(2*(in-1)+1,2*(in-1)+6)=-1j*alphap*kz*sqrt((in+2)*(in+1))/L/L;
        H(2*(in-1)+2,2*(in-1)+5)=-1j*alphap*kz*sqrt((in+2)*(in+1))/L/L;
    end
end

for i=1:2*N
    for j=1:i
        H(i,j)=conj(H(j,i));
    end
end


end
%%
function H=HBz_mtrx_onering(kz,Bz)
load paras.mat;


H=zeros(2*N+2,2*N+2);

L=sqrt(1/Bz);


for in=0:N
    H(2*in+1,2*in+1)=(C+m)+(A+B)*(2*(in+0.5)/L/L+kz^2);
    H(2*in+2,2*in+2)=(C-m)+(A-B)*(2*(in+0.5)/L/L+kz^2);
    if (in<N)
        H(2*in+1,2*in+4)=alphap*sqrt((in+1)/2)/L;
        H(2*in+2,2*in+3)=alphap*sqrt((in+1)/2)/L;
    end
end


for i=1:2*N+2
    for j=1:i
        H(i,j)=conj(H(j,i));
    end
end


end
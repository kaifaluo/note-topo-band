
clc
clear

alpha=0.3

a=1
t1=1;                                 %Ñ¡×ÔVanderbiltÎÄÕÂ
t1_1=t1*(1+alpha);                    %Ñ¡×ÔVanderbiltÎÄÕÂ
t2=1/3;                               %Ñ¡×ÔVanderbiltÎÄÕÂ
M=2/3;                                %Ñ¡×ÔVanderbiltÎÄÕÂ
phi=3*pi/2;                             %Ñ¡×ÔVanderbiltÎÄÕÂ
a0=a/sqrt(3);                         %AÔ­×Ó ºÍ BÔ­×Ó ¼äµÄ¾àÀë
A=[0 0];B=a0./2.*[1,sqrt(3)];         %AÔ­×Ó ºÍ BÔ­×ÓÎ»ÖÃ
GG1=2*pi/sqrt(3)/a*[2,0];             %µ¹¸ñÊ¸
GG2=2*pi/sqrt(3)/a*[-1,sqrt(3)];      %µ¹¸ñÊ¸
n=100;                                %»®·ÖÍø¸ñ´óÐ¡
l_2=1
for ii=0:1:n-1
    l_1=1;
    for jj=0:1:n-1
        k =(jj*GG1+ii*GG2)./n;
        H=Hamiltonian(k,t1,t1_1,t2,M,phi,a,a0);
        [V,E]=eig(H);                                                  %¶Ô½Ç»¯  Hamiltonian
        num=size(E,2)/2;                                               
        VV(:,l_1)=V(:,num);                                            %²¨º¯Êý
        l_1=l_1+1;
    end
    VV(:,l_1)=VV(:,1).*[exp(-1i.*(GG1*A'));exp(-1i.*(GG1*B'))];        %±£³ÖµÚÒ»¸ö²¨º¯ÊýÓë×îºóÒ»¸ö²¨º¯ÊýÒ»ÖÂ
    for ii=1:1:l_1-1
        U(ii)=VV(:,ii)'*VV(:,ii+1);
    end
    theta_1(l_2)=mod(-imag(log(prod(U))),2*pi)-pi;
    l_2=l_2+1;
end
 P = -sum(theta_1/2/pi)/n*100
 x=linspace(0,1,n);
 plot(x,theta_1/pi,'.')
hold on
clc;
clear;
tic;
a=[2.057	1.1876	9.548];
b=[-2.057	1.1876	9.548];    
c=[0	-2.3752	9.548]; 

v=dot(a,cross(b,c));
b1=2*pi*cross(b,c)./v;
b2=2*pi*cross(c,a)./v;
b3=2*pi*cross(a,b)./v;
n=1;
bb1=b1-b2;
bb2=b1-b3;
for i =-0.1:0.001:0.1
	for j =-0.1:0.001:0.1
            KPoints(n,1)=i*b1(1)+j*b2(1);
            KPoints(n,2)=i*b1(2)+j*b2(2);
            KPoints(n,3)=0;
            n=n+1;
		end
end
save KPoints.mat
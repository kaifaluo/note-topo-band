function H=Hamiltonian(k,t1,t1_1,t2,M,phi,a,a0)
    s_0=[1   0;0   1];
    s_x=[0   1;1   0];
    s_y=[0  -1i;1i   0];
    s_z=[1   0;0    -1];
    a1=a.*[sqrt(3)./2 , 1./2];
    a2=a.*[sqrt(3)./2 , -1./2];
    a3=a1-a2;
    k_a1 = k*a1';
    k_a2 = k*a2';
    k_a12 = k*a3';
    delta1=a0./2.*[1,sqrt(3)];
    delta2=a0./2.*[1,-sqrt(3)];
    delta3=a0./2.*[-2,0];
%%----method1£ºBernevig book p105
%     epsilon = 2 * t2 * cos(phi)* (cos(k_a1) + cos(k_a2) + cos(k_a12));
%     d1 = t1 * (cos(k_a1) + cos(k_a2) + 1);
%     d2 = t1 * (sin(k_a1) + sin(k_a2));
%     d3 = M + 2*t2*sin(phi)*(sin(k_a1)-sin(k_a2)-sin(k_a12));
%     H = epsilon*s_0 + d1*s_x+d2*s_y+d3*s_z;   
%%----method2
    epsilon = 2 * t2 * cos(phi)* (cos(k_a1) + cos(k_a2) + cos(k_a12));
    H12=(t1_1.*exp(1i.*(k*delta1'))+t1.*exp(1i.*(k*delta2'))+t1.*exp(1i.*(k*delta3')))./exp(1i.*(k*delta3'));      %the same as method1
    %H12=(t1_1.*exp(1i.*(k*delta1'))+t1.*exp(1i.*(k*delta2'))+t1.*exp(1i.*(k*delta3')));
    H21=conj(H12);
    H_d=[0     H21;
         H12     0];
    d3 = M + 2*t2*sin(phi)*(sin(k_a1)-sin(k_a2)-sin(k_a12));
    H = epsilon*s_0+d3*s_z + H_d;
end











function [H]= get_int_hop(atom1,atom2,es,ep,V_sss,V_sps,V_pss,V_pps,V_ppp,hop,k)

none=zeros(4,4);

%%  onsite energy
onsite=none;

if atom1==atom2
    onsite(1,1)=es(atom1);
    onsite(2,2)=ep(atom1);
    onsite(3,3)=ep(atom1);
    onsite(4,4)=ep(atom1);
else
    onsite=none;
end
H=onsite;

%% Slater-Koster Hamiltonian

SK=none;
for i=1:length(hop(:,1))
    
    dir=hop(i,:)/norm(hop(i,:));
    phase=exp(1i*dot(k,hop(i,:)));
    l=dir(1);
    m=dir(2);
    n=dir(3);
    
    %  slater-koster parameters
    SK(1,1)=V_sss;
    SK(1,2)=l*V_sps;
    SK(1,3)=m*V_sps;
    SK(1,4)=n*V_sps;
    SK(2,1)=l*V_pss;
    SK(2,2)=l*l*V_pps+(1-l*l)*V_ppp;
    SK(2,3)=l*m*(V_pps-V_ppp);
    SK(2,4)=l*n*(V_pps-V_ppp);
    SK(3,1)=m*V_pss;
    SK(3,2)=l*m*(V_pps-V_ppp);
    SK(3,3)=m*m*V_pps+(1-m*m)*V_ppp;
    SK(3,4)=m*n*(V_pps-V_ppp);
    SK(4,1)=n*V_pss;
    SK(4,2)=l*n*(V_pps-V_ppp);
    SK(4,3)=m*n*(V_pps-V_ppp);
    SK(4,4)=n*n*V_pps+(1-n*n)*V_ppp;
    
    H=H+SK*phase; 
end

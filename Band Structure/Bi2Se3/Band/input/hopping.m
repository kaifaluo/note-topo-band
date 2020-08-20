%% intralayer hopping
a=4.114;
a11=[a,0,0];
a12=[-a/2,sqrt(3)*a/2,0];
a13=[-a/2,-sqrt(3)*a/2,0];

hop_11=[a11;a12;a13;-a11;-a12;-a13];
hop_22=[a11;a12;a13;-a11;-a12;-a13];
hop_33=[a11;a12;a13;-a11;-a12;-a13];
hop_44=[a11;a12;a13;-a11;-a12;-a13];
hop_55=[a11;a12;a13;-a11;-a12;-a13];

%% Nearest-Neighbor hopping
h1=sqrt(2.926^2-(a/2)^2-(sqrt(3)*a/6)^2);
h2=sqrt(3.030^2-(a/2)^2-(sqrt(3)*a/6)^2);
h3=sqrt(3.354^2-(a/2)^2-(sqrt(3)*a/6)^2);

a21=[0,sqrt(3)*a/3,h1];
a22=[-a/2,-sqrt(3)*a/6,h1];
a23=[a/2,-sqrt(3)*a/6,h1];

a31=[0,sqrt(3)*a/3,h2];
a32=[-a/2,-sqrt(3)*a/6,h2];
a33=[a/2,-sqrt(3)*a/6,h2aa3];

a41=[0,sqrt(3)*a/3,h3];
a42=[-a/2,-sqrt(3)*a/6,h3];
a43=[a/2,-sqrt(3)*a/6,h3];

hop_12=[a21;a22;a23];
hop_15=-[a41;a42;a43];
hop_23=[a31;a32;a33];
hop_34=[a31;a32;a33];
hop_45=[a21;a22;a23];

%% Second-Neighbour hopping

a61=[0,sqrt(3)*a/3,h1+h2];
a62=[-a/2,-sqrt(3)*a/6,h1+h2];
a63=[a/2,-sqrt(3)*a/6,h1+h2];

a71=[0,sqrt(3)*a/3,h1+h3];
a72=[-a/2,-sqrt(3)*a/6,h1+h3];
a73=[a/2,-sqrt(3)*a/6,h1+h3];

a81=[0,sqrt(3)*a/3,h2+h2];
a82=[-a/2,-sqrt(3)*a/6,h2+h2];
a83=[a/2,-sqrt(3)*a/6,h2+h2];

hop_13=[a61;a62;a63];
hop_14=-[a71;a72;a73];
hop_24=[a81;a82;a83];
hop_25=-[a71;a72;a73];
hop_35=[a61;a62;a63];

%%
for i=1:length(hop_11(:,1))
    load(".\input\para_11.mat");
    for k=1:length(
end


%%
for i=1:5
    for j=i:5
        load(".\input\para_ij.mat");
        hop=hop_ij;
        for k=1:length(hop_ij(:,1))
            dir=hop_ij(k,:)/norm(hop_ij(k,:));
            l=dir(1);
            m=dir(2);
            n=dir(3);
            H(4*i+1:4*i+4,4*j+1:4*j+4)=get_hop_int();
        end
        
    end
end
    
    
end
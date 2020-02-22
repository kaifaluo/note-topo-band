%% Hamil_PBC: function description

function [H] = Hamil_0(ka,kb,kc)

k=[ka,kb,kc];

%% Total Hamiltonian of intralayer hopping with on site potential

H=zeros(20,20); 

% on Site parameters 
es=[-10.7629    -10.7629    -10.9210    -10.9210    -13.1410];
ep=[0.2607  0.2607  -1.5097    -1.5097       -1.1893];

% intralayer parameters
s11=0.2212;  s12=-0.0640;  s13=-0.0878;
s21=-0.3067; s22=0.2833;   s23=-0.2660;
s31=0.3067; s32=-0.2833;   s33=0.2660;
s41=0.3203;  s42=0.3047;   s43=-0.1486;
s51=-0.0510; s52=-0.0035;  s53=-0.0590;

% intralayer distance
a=4.114;
a1=[a,0,0];
a2=[-a/2,sqrt(3)*a/2,0];
a3=[-a/2,-sqrt(3)*a/2,0];

%  intralayer parameters
p11=-0.6670;  p12=-0.2410;  p13=-0.3326;
p21=2.0774; p22=-0.2012;   p23=-0.0150;
p31=-0.4792;  p32=-0.0193;   p33=0.0150;
p41=2.0595; p42=2.0325;  p43=0.9449;
p51=-0.4432; p52=-0.5220;  p53=-0.1050;

% nearest interlayer distance
a=4.114; 
c11=sqrt(2.926^2-(a/2)^2-(sqrt(3)*a/6)^2);
c12=sqrt(3.030^2-(a/2)^2-(sqrt(3)*a/6)^2);
c13=sqrt(3.354^2-(a/2)^2-(sqrt(3)*a/6)^2);

a11=[0,sqrt(3)*a/3,c11];
a12=[-a/2,-sqrt(3)*a/6,c11];
a13=[a/2,-sqrt(3)*a/6,c11];
a14=[0,sqrt(3)*a/3,c12];
a15=[-a/2,-sqrt(3)*a/6,c12];
a16=[a/2,-sqrt(3)*a/6,c12];
a17=[0,sqrt(3)*a/3,c13];
a18=[-a/2,-sqrt(3)*a/6,c13];
a19=[a/2,-sqrt(3)*a/6,c13];

% Next-Nearest intralayer hopping parameters
q11=0.0229;  q12=-0.0567;  q13=0.0333;
q21=-0.0318; q22=-0.2147;   q23=-0.0047;
q31=-0.0778;  q32=0.2147;   q33=0.2503;
q41=-0.0852; q42=0.1227;  q43=-0.1101;
q51=0.0120; q52=-0.0108;  q53=0.1015;

% Next-nearest intralayer distance
c21=sqrt(4.305^2-(a/2)^2-(sqrt(3)*a/6)^2);
c22=sqrt(4.449^2-(a/2)^2-(sqrt(3)*a/6)^2);
c23=sqrt(4.719^2-(a/2)^2-(sqrt(3)*a/6)^2);

a21=[0,sqrt(3)*a/3,c21];
a22=[-a/2,-sqrt(3)*a/6,c21];
a23=[a/2,-sqrt(3)*a/6,c21];
a24=[0,sqrt(3)*a/3,c22];
a25=[-a/2,-sqrt(3)*a/6,c22];
a26=[a/2,-sqrt(3)*a/6,c22];
a27=[0,sqrt(3)*a/3,c23];
a28=[-a/2,-sqrt(3)*a/6,c23];
a29=[a/2,-sqrt(3)*a/6,c23];

%%   Bi1 layer
hop_11=[a1;a2;a3;-a1;-a2;-a3];
% atom1=1;
% atom2=1;
H(1:4,1:4)=get_int_hop(1,1,es,ep,s11,s21,s31,s41,s51,hop_11,k);

%% Bi2 layer
H(5:8,5:8)=H(1:4,1:4);

%% Se1 layer
hop_33=[a1;a2;a3;-a1;-a2;-a3];
H(9:12,9:12)=get_int_hop(3,3,es,ep,s12,s22,s32,s42,s52,hop_33,k);

%% Se2 layer
H(13:16,13:16)=H(9:12,9:12);

%% Se3 layer
hop_55=[a1;a2;a3;-a1;-a2;-a3];
H(17:20,17:20)=get_int_hop(5,5,es,ep,s13,s23,s33,s43,s53,hop_55,k);


%% Total Hamiltonian of Nearest-interlayer hopping

%%   Bi1 layer-Se3 layer(1-3)
hop_13=[a11;a12;a13];
H(1:4,9:12)=get_int_hop(1,3,es,ep,p11,p21,p31,p41,p51,hop_13,k);
H(9:12,1:4)=H(1:4,9:12)';

%% Bi2 layer -Se4 layer (2-4)
hop_24=-[a11;a12;a13];
H(5:8,13:16)=get_int_hop(2,4,es,ep,p11,p21,p31,p41,p51,hop_24,k);
H(13:16,5:8)=H(5:8,13:16)';

%% Bi1 layer - Se5 layer (1-5)
hop_15=-[a14;a15;a16];
H(1:4,17:20)=get_int_hop(1,5,es,ep,p12,p22,p32,p42,p52,hop_15,k);
H(17:20,1:4)=H(1:4,17:20)';

%% Bi2 layer - Se5 layer (2-5)
hop_25=[a14;a15;a16];
H(5:8,17:20)=get_int_hop(2,5,es,ep,p12,p22,p32,p42,p52,hop_25,k);
H(17:20,5:8)=H(5:8,17:20)';

%% Se3 layer- Se4 layer (3-4)
hop_34=[a17;a18;a19];
H(9:12,13:16)=get_int_hop(3,4,es,ep,p13,p23,p33,p43,p53,hop_34,k);
H(13:16,9:12)=H(9:12,13:16)';


%% Hamiltonian of Next Nearest-interlayer hopping

%%   Bi1 layer-Bi2 layer(1-2)
hop_12=-[a24;a25;a26];
H(1:4,5:8)=get_int_hop(1,2,es,ep,q12,q22,q32,q42,q52,hop_12,k);
H(5:8,1:4)=H(1:4,5:8)';

%% Se3 layer- Se5 layer (3-5)
hop_35=-[a21;a22;a23];
H(9:12,17:20)=get_int_hop(3,5,es,ep,q11,q21,q31,q41,q51,hop_35,k);
H(17:20,9:12)=H(9:12,17:20)';

%% Se4 layer- Se5 layer (4-5)
hop_45=[a21;a22;a23];
H(13:16,17:20)=get_int_hop(4,5,es,ep,q11,q21,q31,q41,q51,hop_45,k);
H(17:20,13:16)=H(13:16,17:20)';

%% Bi1 layer -Se4 layer (1-4)
hop_14=[a27;a28;a29];
H(1:4,13:16)=get_int_hop(1,4,es,ep,q13,q23,q33,q43,q53,hop_14,k);
H(13:16,1:4)=H(1:4,13:16)';

%% Bi2 layer - Se3 layer (2-3)
hop_23=-[a27;a28;a29];
H(5:8,9:12)=get_int_hop(2,3,es,ep,q13,q23,q33,q43,q53,hop_23,k);
H(9:12,5:8)=H(5:8,9:12)';
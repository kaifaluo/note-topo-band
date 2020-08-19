function [H] = H_ql2(ka,kb,kc)

k=[ka,kb,kc];

H=zeros(20,20);

%%

% onsite parameters 
es=[-10.7629    -10.7629    -10.9210    -10.9210    -13.1410];
ep=[0.2607  0.2607  -1.5097    -1.5097       -1.1893];

%  intralayer parameters
p13=-0.3326;    p23=-0.0150;    p33=0.0150; p43=0.9449; p53=-0.1050;

% nearest interlayer distance
a=4.114; 
c13=sqrt(3.354^2-(a/2)^2-(sqrt(3)*a/6)^2);

a17=[0,sqrt(3)*a/3,c13];
a18=[-a/2,-sqrt(3)*a/6,c13];
a19=[a/2,-sqrt(3)*a/6,c13];


%% Se3 layer- Se4 layer (3-4)
hop_34=[a17;a18;a19];
H(9:12,13:16)=get_int_hop(3,4,es,ep,p13,p23,p33,p43,p53,hop_34,k);

% Next-Nearest intralayer hopping parameters
q13=0.0333; q23=-0.0047;    q33=0.2503; q43=-0.1101;    q53=0.1015;

% intralayer distance
a=4.114;
c23=sqrt(4.719^2-(a/2)^2-(sqrt(3)*a/6)^2);

a27=[0,sqrt(3)*a/3,c23];
a28=[-a/2,-sqrt(3)*a/6,c23];
a29=[a/2,-sqrt(3)*a/6,c23];

%% Bi1 layer -Se4 layer (1-4)
hop_14=[a27;a28;a29];
H(1:4,13:16)=get_int_hop(1,4,es,ep,q13,q23,q33,q43,q53,hop_14,k);

%% Bi2 layer - Se3 layer (2-3)
hop_23=-[a27;a28;a29];
temp=get_int_hop(2,3,es,ep,q13,q23,q33,q43,q53,hop_23,k);
H(9:12,5:8)=temp';

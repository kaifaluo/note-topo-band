clc; clear all;

E0=0.12; alphap= 0.5; betap=0.2; N=15;
C=0.0;  m=0.05; A=0; B=-0.5;
save paras.mat alphap betap N A B C m;


%%
kz=[0.00000001:0.001:0.7];nb=size(kz,2);
Bz=0.01;
for i=1:nb
    Hmtrx=HBz_mtrx_onering(kz(i),Bz);
    EBz(i,:)=sort(eig(Hmtrx));    
end
save plot1.mat EBz  Bz;
%%

%% fig yz
clc;
Figure=figure(1);clf;
load plot1.mat;
set(Figure,'defaulttextinterpreter','Tex');
yL=-0.1;  yH=0.1;
set(gca,'FontSize',40); grid on;
plot(kz, EBz,  'b-', 'LineWidth',1.0);hold on;
ylabel('\bf{Energy (eV)}')
% xlabel('\bf{Bz(T)}');
% text(max(Bz)*3/5,yH*4/5,'kz=0.2','FontSize',40)
% axis([0, max(kz) yL yH]);
axis([0, max(kz) yL yH]);
saveas(gcf, 'LL', 'pdf');

%%
clear all;
Bzmax=0.03;
Bz=[0.00000001:Bzmax/200:Bzmax];nb=size(Bz,2);
kz=0.0004170;
for i=1:nb
    Hmtrx=HBz_mtrx_onering(kz,Bz(i));
    EBz(i,:)=sort(eig(Hmtrx));
end
save plot1.mat EBz  Bz;
%%

%% fig yz
clc;
Figure=figure(2);clf;
load plot1.mat;
set(Figure,'defaulttextinterpreter','Tex');
yL=-0.1;  yH=0.1;
set(gca,'FontSize',40); grid on;
plot(Bz, EBz,  'b-', 'LineWidth',1.0);hold on;
ylabel('\bf{Energy (eV)}')
% xlabel('\bf{Bz(T)}');
% text(max(Bz)*3/5,yH*4/5,'kz=0.2','FontSize',40)
% axis([0, max(kz) yL yH]);
axis([0, max(Bz) yL yH]);
saveas(gcf, 'LL', 'pdf');

disp('done')

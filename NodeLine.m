% -------------------------------------------------------------------------------
% Name:      Weyl.m
% Purpose:   To calculate and plot the nodal point, slab band, and Berry phase
%            of a two band tight-binding model
% Author:    Kaifa Luo (luokaifa96@gmail.com)
%
% Created:   10-2017
% Licence:   Free
% Version:   0.1  Transforming the procedure into a callable one in order
%              to call them from a higher level script.
% ------------------------------------------------------------------------------

%%1. NodalLine
%%2. Band
%%3. Slab
%%4. BerryPhase

addpath(genpath(pwd));

clc;clear all;
clf;fig=figure(1)
%
%% ==============NODALLINE========NODALLINE=============
%
subplot(2,2,1);
load('input\node.mat');node=NL;
plt_proj_NL(node)
scatter3(node(:,1),node(:,2),node(:,3),2.5,'r','filled'); hold on;
plt_text(PATH)

k_range=[-0.5,0.5;0,1;-0.5,0.5]*2*pi;
plt_frame(k_range)
%text(-pi+2*pi*0.12,2*pi*0.93,pi*0.87,'(a)');
%
%% ===================BAND======BAND==========
%
subplot(2,2,2)
nk=1500;
[E_list,k_list,nk_label,nk] = gene_band(PATH,nk);
for i =2:length(nk_label)-1
    plot([nk_label(i) nk_label(i)],[0 13],'--', ...
        'color',[0.5,0.5,0.5],'linewidth',0.5);hold on;
end

for i =1:2
    plot([1:nk],E_list(:,i),'r','linewidth',2); hold on;
end

y_lim=get(gca,'Ylim');%% get the limitation of y axis
ylabel('$\omega^{-2}\left[(krad)^{-2}\right]$','interpreter','latex');
set(gca,'box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',12, ...
       'xtick',nk_label,'xticklabel',{'\Gamma','M','A','Y','B','M','\Gamma'});
axis([0,nk,0,13]);axis square
%text(nk_label(end)*0.05,y_lim(2)-(y_lim(2)-y_lim(1))*0.1,'(b)');
%
%% ======SLAB=====================SLAB====================
%
subplot(2,2,3)
nk=1500;
n_uc=40;
[eigvalue,nk_label,nk] = gene_slab(n_uc,nk,PATH);
eg_rg=[0.388*nk:0.612*nk];
cl_split=[0.5,0.5,0.5];
lw_split=0.5;
for i =2:length(nk_label)-1
  plot([nk_label(i) nk_label(i)],[0 13],'--', ...
        'color',cl_split,'linewidth',lw_split);hold on;
end
for i=1:2*n_uc
    plot([1:nk],eigvalue(i,:),'color',[0.5,0.5,0.5],'linewidth',0.5);hold on;
    if i == n_uc || i==n_uc+1
        plot(eg_rg,eigvalue(i,eg_rg),'r','Linewidth',2);hold on;
    end
end
toc

fs=12;
set(gca,'box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',fs, ...
        'xtick',nk_label,'xticklabel',{'\Gamma','M','A','Y','B','M','\Gamma'});
ylabel('$\omega^{-2}\left[(krad)^{-2}\right]$','interpreter','latex');
axis([0,nk,4,8]);axis square

%text(nk_label(end)*0.05,y_lim(2)-(y_lim(2)-y_lim(1))*0.1,'(c)');
%
%% =============BERRYPHASE===========BERRYPHASE===============
%
run=1;
if run == 1
    nk=500;
    PATH(:,3)=0;
    [BerryPhase,nk_label,nk] = gene_BerryPhase(PATH,nk);
    save('output\BerryPhase.mat','BerryPhase','nk_label','nk')
end
load('output\BerryPhase.mat');

subplot(2,2,4)
plot([1:nk],BerryPhase,'r','linewidth',1.5); hold on;

ylabel('Berry Phase');
set(gca,'box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',fs, ...
        'xtick',nk_label,'xticklabel',{'\Gamma','M','A','Y','B','M','\Gamma'}, ...
        'ytick',[0 pi 2*pi],'yticklabel',{'0','\pi','2\pi'}');
axis([0,nk,0,2*pi]);axis square
grid on

%text(nk_label(end)*0.05,2*pi-(2*pi/10),'(d)');

%print('output\example', '-dpng', '-r350'); %<-Save as PNG with 350 DPI

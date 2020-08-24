%close all; 
clear all;
clc;

%%
tic

data=load('input\path.mat');
path=data.path;
nk=1500;
[E_list,k_list,nk_label,nk] = gene_band(path,nk);

for i =2:length(nk_label)-1
    plot([nk_label(i) nk_label(i)],[-2,2],':','color',[0.5,0.5,0.5],'linewidth',0.5);hold on;
end

for i =1:40
    scatter([1:nk],E_list(:,i),0.5,[1,0,0]); hold on;
end

ylabel('Energy (eV)','interpreter','latex');
set(gca,'Fontname','Times New Roman','Fontsize',12,'xtick',nk_label,'ytick',[-2,-1,0,1,2],'xticklabel',{'\Gamma','Z','F','\Gamma','L'});
axis([0,nk,-2,2]);
% title('Band structure of Bi2Se3')

toc
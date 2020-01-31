clear all;
clc;

sz_H = 2;
nkx = 1000;
[BP]=gene_WilsonLoop(nkx,sz_H);

%% --------------------------------------------------
fs=14;
lw=1.2;

clf
fig=figure(1)

scatter([1:nkx],BP,5,'r'); hold on;

axis([1 nkx -pi pi]);
ylabel('$\phi(k_x)$','interpreter','latex','fontsize',fs);
xlabel('$k_x$','interpreter','latex','fontsize',fs);
set(gca,'box','on','fontsize',fs,'linewidth',lw, ...
        'xtick',[1 nkx/2 nkx],'xticklabel',{'0','\pi','2\pi'}, ...
        'ytick',[-pi 0 pi],'yticklabel',{'-\pi','0','\pi'});
title('Wilson Loop')
grid on;
%% show_slab: function description
function [] = show_slab()
E_WP=5.8445; %% the energy where the Weyl points lie
nk_label=[0,6.5];
load('input\SLAB.mat')
patch('Faces',tri,'Vertices',[S(:,1),S(:,2)],'FaceVertexCData',S(:,3),...
   'FaceColor','interp','EdgeColor','none'); hold on;
plot(nk_label,[E_WP,E_WP],'--','color',[0,0.6,0],'linewidth',1.0);
caxis([-pi,pi]); %% the range of colormap
y_lim=get(gca,'Ylim');
ylabel('$\omega^{-2}\left[(krad)^{-2}\right]$','interpreter','latex');
set(gca,'Box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',12, ...
        'xtick',[nk_label(1)-0.05,nk_label(2)+0.05],'xticklabel',{'A','B'});
axis([nk_label(1)-0.05,nk_label(2)+0.05,5,7+0.008])
axis square
grid on;
%% plt_surf_dos: function description
function [] = plt_surf_dos(kx,ky,rho)

[KX,KY]=meshgrid(kx,ky);

surf(KX,KY,rho); hold on;

fs=14;
boxlw=1.5;

axis([-pi-0.01,pi,0,2*pi+0.01])
xlabel('$k_x$','interpreter','latex','fontsize',fs)
ylabel('$k_y$','interpreter','latex','fontsize',fs)
set(gca,'box','on','fontsize',fs,'linewidth',boxlw,...
		'xtick',[kx(1),0,kx(end)],'xticklabel',{'-\pi','0','\pi'}, ...
		'ytick',[0:pi:2*pi],'yticklabel',{'0','\pi','2\pi'})

view(0,90)
nc=[5,55];
cm=[ones(nc(1),3);
	linspace(1,1,nc(2))',linspace(192/255,0,nc(2))',linspace(203/255,0,nc(2))'];
colormap(cm)

shading interp
grid on
axis square
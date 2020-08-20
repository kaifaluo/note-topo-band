%% plt_node: function description
function [] = frame(k_range)

boxlw=1.2;
nk=800;
kx=linspace(k_range(1,1),k_range(1,2),nk);
ky=linspace(k_range(2,1),k_range(2,2),nk);
kz=linspace(k_range(3,1),k_range(3,2),nk);

%-----------plot the grey plane----------
[x,y]=meshgrid(kx,ky);
z=x*0;
surf(x,y,z);
cb=[0,0,0; ...
    0.5,0.5,0.5; ...
    1,1,1];
set(gcf,'colormap',cb);
shading interp;
alpha(0.45)
%-----------plot the grey plane----------
plot3([-pi,-pi],[0,2*pi],[pi,pi],'k--','Linewidth',0.6);hold on;
plot3([-pi,pi],[0,0],[pi,pi],'k--','Linewidth',0.6);hold on;
plot3([-pi,-pi],[0,0],[pi,-pi],'k--','Linewidth',0.6);hold on;

xlabel('$k_a[1/a]$','interpreter','latex');
ylabel('$k_b[1/b]$','interpreter','latex');
zlabel('$k_c[1/c]$','interpreter','latex');
axis([kx(1),kx(end),ky(1),ky(end),kz(1),kz(end)]); axis square
set(gca,'box','on','linewidth',boxlw,'Fontname','Times New Roman','Fontsize',12, ...
        'xtick',[kx(1):pi:kx(end)]);set(gca,'xticklabel',{'-\pi','0','\pi'}, ...
        'ytick',[ky(1):pi:ky(end)]);set(gca,'yticklabel',{'0','\pi','2\pi'}, ...
        'ztick',[kz(1):pi:kz(end)]);set(gca,'zticklabel',{'-\pi','0','\pi'});
view(-24,8)
grid on;
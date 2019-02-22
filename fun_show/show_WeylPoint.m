%% show_WeylPoint: function description
function [WP] = show_WeylPoint(k_range,nk,mu0)
load('output\WeylPoint.mat')
kx=linspace(k_range(1,1),k_range(1,2),nk);
ky=linspace(k_range(2,1),k_range(2,2),nk);
kz=linspace(k_range(3,1),k_range(3,2),nk);

%%%%---------plot two green planes and the box-frame lines--------
[x,y]=meshgrid(kx,ky);
kz_Weyl=ones(length(x),length(y))*acos(1+mu0);
surf(x,y,kz_Weyl);hold on;shading interp;
alpha(0.4)
surf(x,y,-kz_Weyl);hold on;shading interp;
alpha(0.4)
plot3([-pi,-pi],[0,2*pi],[pi,pi],'k--','Linewidth',0.6);hold on;
plot3([-pi,pi],[0,0],[pi,pi],'k--','Linewidth',0.6);hold on;
plot3([-pi,-pi],[0,0],[pi,-pi],'k--','Linewidth',0.6);hold on;
%%%%---------plot two green planes--------
scatter3(node(:,1),node(:,2),node(:,3),2.1,'r','filled'); hold on; 

%%%%---------plot the Weyl Points and their projections--------
for i=[1,4]
  plot3(WP(i,1),WP(i,2),WP(i,3),'b p','MarkerSize',8,'MarkerFaceColor','b');
end
for i=2:3
  scatter3(WP(i,1),WP(i,2),WP(i,3),'r','o','filled');
end
plt_proj_WP(WP);

%%%%--------plot the A-B path-----------
path_slice=[-0.2,0,-0.5; ...
            -0.2,1,-0.5]*2*pi;
text={'$A$','$B$'};
plot3(path_slice(:,1),path_slice(:,2),path_slice(:,3),'c--','Linewidth',1);hold on;
scatter3(path_slice(:,1),path_slice(:,2),path_slice(:,3),6,'m','filled'); hold on;

text_shift=[-0.03,0.1,0.02;
            0.01,0.02,-0.05]*2*pi;
path_slice=path_slice+text_shift;
%for i =1:2
% text(path_slice(i,1),path_slice(i,2),path_slice(i,3),text(i), ...
%     'interpreter','latex','Fontsize',10);
%end

%%%%%--------plot the label of Weyl Points---------
WN_lab={'$W_1$','$W_2$','$W_3$','$W_4$'};
WP_shift=[0.08,0.19,0;
          -0.08,0.05,0.04;
          -0.02,-0.05,-0.04;
          -0.08,0.06,-0.06]*2*pi;
WP=WP+WP_shift;
%for i=1:4
%  text(WP(i,1),WP(i,2),WP(i,3),WN_lab(i), ...
%              'interpreter','latex','Fontsize',10);
%end
WP=WP-WP_shift;
xlabel('$k_a[1/a]$','interpreter','latex');
ylabel('$k_b[1/b]$','interpreter','latex');
zlabel('$k_c[1/c]$','interpreter','latex');
axis([kx(1),kx(end),ky(1),ky(end),kz(1),kz(end)]); axis square;
set(gca,'Box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',12, ...
         'xtick',[kx(1):pi:kx(end)],'xticklabel',{'-\pi','0','\pi'}, ...
         'ytick',[ky(1):pi:ky(end)],'yticklabel',{'0','\pi','2\pi'}, ...
         'ztick',[kz(1):pi:kz(end)],'zticklabel',{'-\pi','0','\pi'});
grid on;
az=-21.5;el=9;view(az,el); %% set the view angle
%% plt_text: function description
function [] = plt_text(PATH)

plot3(PATH(:,1),PATH(:,2),PATH(:,3),'c--','Linewidth',0.9);hold on;
scatter3(PATH(:,1),PATH(:,2),PATH(:,3),'m','.');hold on;

shift=[-0.02,0,-0.08;
       0,0.01,0.05;
       0.02,0,0.05;
       -0.02,0.04,0.04;
       -0.01,0,-0.06;
       0,0.08,-0.08;
       -0.03,0,0.06]*2*pi;
PATH_text=PATH+shift;
Cri_P={'$\Gamma$','$M$','$A$','$Y$','$B$','$M$','$\Gamma$'};
for i =1:7
  text(PATH_text(i,1),PATH_text(i,2),PATH_text(i,3),Cri_P(i), ...
             'interpreter','latex','Fontsize',12);
end
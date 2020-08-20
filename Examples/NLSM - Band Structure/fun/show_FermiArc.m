%% show_FermiArc: function description
function [] = show_FermiArc(run)

if run == 1
  tic
  F=load('input\fermi_arc.txt');
  toc
  tic
  LEN=length(F(:,1));
  NL_XY=[NL_order(:,1),NL_order(:,2)]/(2*pi);
  %NL_XY=NL_XY/(2*pi);
  F(:,3)=F(:,3)*10^(16);
  F(:,3)=F(:,3)-min(F(:,3));
  F(:,3)=log(1+F(:,3));
  F(:,3)=F(:,3)/(max(F(:,3)))-0.76;
  toc
  tri=delaunay(F(:,1),F(:,2));
  save('output\FermiArc.mat','tri','F','NL_XY')
end

load('output\FermiArc.mat')
patch('Faces',tri,'Vertices',[F(:,1),F(:,2)],'FaceVertexCData',F(:,3),...
        'FaceColor','interp','EdgeColor','none'); hold on;

%%%========plot the Weyl Points and their labels=========
for i=1:4
  if i==2 || i==3
      scatter(NL_XY(i,1),NL_XY(i,2),12,'r','filled');
  elseif i==1 || i==4 
      plot(NL_XY(i,1),NL_XY(i,2),'b p','MarkerSize',5,'MarkerFaceColor','b');
  end
end
NL_shift=[-0.1,0.02;-0.05,0.05;-0.04,-0.05;0.02,-0.02];
NL_XY=NL_XY+NL_shift;
%for i =1:4
%  text(NL_XY(i,1),NL_XY(i,2),WN_lab(i), ...
%            'interpreter','latex','fontsize',10);
%end
x_lim=get(gca,'Xlim');y_lim=get(gca,'Ylim');
plot(x_lim,[0.5,0.5],'--','color',[0.5,0.5,0.5]);
plot([0,0],y_lim,'--','color',[0.5,0.5,0.5]);

xlabel('$k_a[1/a]$','interpreter','latex');
ylabel('$k_b[1/b]$','interpreter','latex');
set(gca,'Box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',12, ...
        'xtick',[-0.5 0 0.5],'xticklabel',{'-\pi','0','\pi'}, ...
        'ytick',[0 0.5 1],'yticklabel',{'0','\pi','2\pi'});
axis([-0.5-0.005,0.5+0.005,0-0.005,1+0.005]);axis square;
grid on;

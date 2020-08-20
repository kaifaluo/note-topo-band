%% show_ChernNumber: function description
function [] = show_ChernNumber(nk,nk0,run,WP)

kx_list=linspace(-pi,pi,nk);
if run == 1
  tic
  [ChernNum] = gene_ChernNum(kx_list,nk0);
  dlmwrite('output\ChernNumber.txt', ChernNum', ...
        'delimiter', '\t','precision', 18,'newline', 'pc') 
  toc
end

ChernNum = load('output\ChernNumber.txt');
kx_label = ([kx_list(1),WP(1,1),WP(2,1),WP(3,1),WP(4,1),kx_list(end)] ...
            +pi*ones(1,6))*nk/(2*pi);

plot([1:length(ChernNum)],ChernNum,'r','linewidth',1.8);hold on;
axis([0,nk,-1.5,1.5]);axis square;
xlabel('$k_a[1/a]$','interpreter','latex');
ylabel('Chern Number');
set(gca,'box','on','linewidth',1.2,'Fontname','Times New Roman','Fontsize',12, ...
        'xtick',kx_label,'xticklabel',{'-\pi','W_1','W_2','W_3','W_4','\pi'}, ...
        'ytick',[-1 0 1],'yticklabel',{'-1','0','1'});
grid on

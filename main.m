%%TWO BAND SYSTEM:
%%1. Band
%%2. ChernNumber
%%3. BerryPhase
%%4. Slab

clc;
clear all;
% %% ===================BAND======BAND===========
% K_path=[0 0 0;
%         0.5 0 0;
%         0.5 0.320988 -0.320988;
% 	    0.679012  0.500  0.320988;
%         0.500   0.500   0.500;
%         0.000   0.000   0.000;
%         0.410494  0.000  -0.410494;
%     	0.589506  0.410494  0.000;
%         0.500   0.500   0.000;
%         0.589506  0.589506  0.320988;
%         0.500   0.500   0.500;
%    	    0.500   0.000   0.000;
%         0.679012  0.410494  0.410494 ...
%         ]*2*pi;
% % K_path=[-pi,pi,0;pi,pi,0];
% A=[sqrt(3)/2 sqrt(3)/2 0;
%     -1/2 1/2 0;
%     0 0 1];
% for i = 1:length(K_path(:,1))
%    K_path(i,:)=K_path(i,:)*A;
% end
% 
% global nk;
% nk=1000;
% 
% [E1,E2,k_label,title_name] = Band(K_path,nk);
% %%---------------------------------------------
% figure
% scatter([1:k_label(length(K_path(:,1)))],E1,'.'); hold on;
% scatter([1:k_label(length(K_path(:,1)))],E2,'.'); hold on;
% set(gca,'xtick',k_label);
% set(gca,'xticklabel',{'\Gamma','L','B_1','B','Z','\Gamma','X','Q','F','P_1','Z','L','P'});
% xlim([1 k_label(length(K_path(:,1)))]);
% xlabel('k-path in BZ');ylabel('Frequency \omega');
% title(title_name);
% %-----------------------------------------------
% %%Plot the lines to seperate sections
% ylim=get(gca,'Ylim');%% get the limitation of y axis
% for i = 2:length(k_label)-1
%     plot([k_label(i),k_label(i)],ylim,'k--');
% end
% %%===================BAND=======BAND===========


% %% ===========ChernNumber=============ChernNumber===============
% %%Calculate the Chern Number over ka-kb space
% %%For example, when a=2,b=3, that means we will scan Chern Number along
% %%k1-axis.
% a=2;b=3;
% n_k=100;
% [chernNum] = CalChernNum(a,b,n_k);
% % -------------------------------
% figure
% scatter([1:n_k],chernNum,'.','r*');hold on;
% xlim([1 n_k]);
% set(gca,'xtick',[1 floor(n_k/2+1) n_k]);
% set(gca,'xticklabel',{'-\pi','0','\pi'});
% xlim=get(gca,'Xlim');
% plot(xlim,[-1,-1],'k--');hold on;
% plot(xlim,[1,1],'k--');hold on;
% plot(xlim,[0,0],'k--');hold on;
% ylabel('Chern Number');
% % ylim([-1.5 1.5]);
% text_title=['Scanning Chern Number over k_' num2str(a) '-k_' num2str(b) ' plane'];
% title(text_title);
% %saveas(gcf,'\OutputData\chernNumber.fig');
% %saveas(gcf,'\OutputData\chernNumber.png');
% %%==============ChernNumber================ChernNumber===========


% %% =============BERRYPHASE===========BERRYPHASE===============
% global nk;
% nk=300;
% K_path=[-0.5,0.5;
%         0.5,0.5 ...
%         ]*2*pi;
% 
% [berryPhase,nk_label,text_parameter] = berryPhase(K_path,nk);
% n_k=nk_label(end);
%
%
% %% --------------------------------------------------
% figure
% scatter([1:n_k],berryPhase,'.'); hold on;
% %-----------------------------------------
% set(gca,'ytick',[0 pi 2*pi]);
% set(gca,'yticklabel',{'0','\pi','2\pi'});
% xlim([1 n_k]);
% ylim([0 2*pi]);
% ylabel('Berry Phase');
% set(gca,'xtick',[1 floor(n_k/2) n_k]);set(gca,'xticklabel',{'-\pi','0','\pi'});
% title(text_parameter);
% %%------------------------------------------------
% %%==============BERRYPHASE==========BERRYPHASE=============


%% ======SLAB=====================SLAB====================
global nk;
nk=1200;
num_unitcell=15;
K_path=[0 0;
        0 1;
        0.5 0.5;
        0.5 -0.5
        ]*2*pi;
% A=[sqrt(3)/2 sqrt(3)/2;
%     -1/2 1/2];
% for i = 1:length(K_path(:,1))
%    K_path(i,:)=K_path(i,:)*A;
% end
    
[eigvalue,nk_label] = EigSlab(num_unitcell,K_path);
n_k=nk_label(end);
%% ------------------------------------------------------------
figure
for i=1:2*num_unitcell
    plot([1:n_k],eigvalue(i,:));hold on;
end
xlim([1 n_k]);
xlabel('k-path in 2D BZ');
ylabel('\omega^2 C');
%set(gca,'xtick',[1 floor(n_k/2) n_k]);
%set(gca,'xticklabel',{'-\pi','0','\pi'});
toc
ylim=get(gca,'Ylim');
for i = 2:length(nk_label)-1
   plot([nk_label(i),nk_label(i)],ylim,'k--');
end
set(gca,'xtick',[1]);set(gca,'xticklabel',{'\Gamma'});
% %%=========SLAB======================SLAB===============
%% plt_proj: plot the projections of WN on three planes
function [] = plt_proj(WN)

cl=[0,0,1;1,0,0];

plot3(WN(1,1),WN(1,2),(-pi)*ones(1,length(WN(1,1))),'b p','MarkerSize',4,'MarkerFaceColor',cl(1,:));
scatter3(WN(2,1),WN(2,2),(-pi)*ones(1,length(WN(2,1))),15,cl(2,:),'filled');
scatter3(WN(3,1),WN(3,2),(-pi)*ones(1,length(WN(3,1))),15,cl(2,:),'filled');
plot3(WN(4,1),WN(4,2),(-pi)*ones(1,length(WN(4,1))),'b p','MarkerSize',4,'MarkerFaceColor',cl(1,:));
   
plot3(WN(1,1),(2*pi)*ones(1,length(WN(1,1))),WN(1,3),'b p','MarkerSize',4,'MarkerFaceColor',cl(1,:));
scatter3(WN(2,1),(2*pi)*ones(1,length(WN(2,1))),WN(2,3),15,cl(2,:),'filled');
scatter3(WN(3,1),(2*pi)*ones(1,length(WN(3,1))),WN(3,3),15,cl(2,:),'filled');
plot3(WN(4,1),(2*pi)*ones(1,length(WN(4,1))),WN(4,3),'b p','MarkerSize',4,'MarkerFaceColor',cl(1,:));

plot3((pi)*ones(1,length(WN(1,1))),WN(1,2),WN(1,3),'b p','MarkerSize',4,'MarkerFaceColor',cl(1,:));
scatter3((pi)*ones(1,length(WN(2,1))),WN(2,2),WN(2,3),15,cl(2,:),'filled');
scatter3((pi)*ones(1,length(WN(3,1))),WN(3,2),WN(3,3),15,cl(2,:),'filled');
plot3((pi)*ones(1,length(WN(4,1))),WN(4,2),WN(4,3),'b p','MarkerSize',4,'MarkerFaceColor',cl(1,:));
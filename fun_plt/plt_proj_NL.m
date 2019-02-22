%% plt_proj: function description
function [] = plt_proj(pos_node)

cl_proj=[0.5,0.5,0.5];
lw_proj=1;
scatter3(pos_node(:,1),pos_node(:,2),(-pi)*ones(1,length(pos_node(:,1))),lw_proj,cl_proj,'filled');hold on;
scatter3(pos_node(:,1),(2*pi)*ones(1,length(pos_node(:,1))),pos_node(:,3),lw_proj,cl_proj,'filled');hold on;
scatter3((pi)*ones(1,length(pos_node(:,1))),pos_node(:,2),pos_node(:,3),lw_proj,cl_proj,'filled');hold on;

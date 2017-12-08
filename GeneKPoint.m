function [KPoints,nk_label]=GeneKPoint(K)
%This function will return matrix Kpoints and the vector nk_label.
%% ============================
global nk;
%This nk is used to give a rough number of k-points, which is finally
%determined by nk_label(LEN), shown as followed.
Dimension=length(K(1,:));


%% =============3D CASE=========================
if Dimension==3
%%=======================================
%To identify what K_3D contains are high symmetry points in 3D K-space
%%The number of intersections in whole path
LEN=length(K(:,1));
NK=zeros(1,LEN-1);
KPoint_length=zeros(1,LEN-1);
%Attach a label to the intersection of each line segment on the path
nk_label=zeros(1,LEN); 
nk_label(1)=1;
%This loop is used to find the number of points that should be sprinkled on
%each segment of the path. Here sprinkling is almost evenly over the whole
%path.
for i = 1:LEN-1
	KPoint_length(i) = norm(K(i+1,:)-K(i,:));
end
%The number of points we sprink over the whole path
KLength=sum(KPoint_length);
for i = 1:LEN-1
	NK(i) = floor(nk*(KPoint_length(i)/KLength));
	nk_label(i+1) = nk_label(i) + (NK(i)-1);
end
%Pre-allocate space for Matrix "KPoints"
KPoints=zeros(nk_label(LEN),Dimension);
%--------------------------------------------------------
%Get the K coordinate on the entire path
for i = 1:LEN-1
	KPoints(nk_label(i):nk_label(i+1),:) = [linspace(K(i,1),K(i+1,1),NK(i))',...
											linspace(K(i,2),K(i+1,2),NK(i))',...
											linspace(K(i,3),K(i+1,3),NK(i))'];
end
%--------------------------------------------------------
%% =================2D CASE===========================
elseif Dimension==2
LEN=length(K(:,1));
NK=zeros(1,LEN-1);
KPoint_length=zeros(1,LEN-1);

nk_label=zeros(1,LEN); 
nk_label(1)=1;


for i = 1:LEN-1
	KPoint_length(i) = norm(K(i+1,:)-K(i,:));
end

KLength=sum(KPoint_length);
for i = 1:LEN-1
	NK(i) = floor(nk*(KPoint_length(i)/KLength));
	nk_label(i+1) = nk_label(i) + (NK(i)-1);
end

KPoints=zeros(nk_label(LEN),Dimension);

for i = 1:LEN-1
	KPoints(nk_label(i):nk_label(i+1),:) = [linspace(K(i,1),K(i+1,1),NK(i))',...
											linspace(K(i,2),K(i+1,2),NK(i))'];
end

end
%-------------------------------------------------------------
end
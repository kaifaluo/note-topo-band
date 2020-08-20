%% Hamil: function description
function [H] = Hamil(kx,ky,kz)

m = 2.5; %% mass term

vx = 1;
vy = 1;
tx = 1;
ty = 1;

sigma_x = [0,1;
		   1,0];
sigma_y = [0,-1j;
		   1j,0];
sigma_z = [1,0;
	  	   0,-1];

H = vx*sin(kx)*sigma_x ...
  	+ vy*sin(ky)*sigma_y ...
  	+ (m-tx*cos(kx)-ty*cos(ky))*sigma_z;

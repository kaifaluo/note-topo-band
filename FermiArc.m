clc;clear all

nk = 200;

kx = linspace(-pi,pi,nk);
ky = linspace(0,2*pi,nk);
omega = 5.8337;
rho = zeros(nk);
tic
for i=1:nk
    disp(i)
	for j=1:nk
		K=[kx(i),ky(j),0];
		G00=gene_surf_Green(omega,K);
		rho(j,i)=-imag(trace(G00));
	end
end
toc

[KX,KY] = meshgrid(kx,ky);
rho = log(rho-min(min(rho))+10);
save('output\rho.mat','rho')

clf;fig=figure(1)

plt_surf_dos(kx,ky,rho)
clear all;clc

fs=16;
boxlw=1.5;

nkz=200;
kz_list = linspace(0,1,nkz); 
nB=200;
B_list = linspace(0,1,nB);
N = 20; 

lw = 1.5;

kz = kz_list(1);
LL = zeros(2*N,nB);
H00 = [kz,0;0,-kz];
for jj = 1:nB
	Hamil = zeros(2*N,2*N);
	B = B_list(jj);
	Hdia = H00;
	for ii = 1:N-1
		H01 = [0,sqrt(B*ii);0,0];
		Hdia = blkdiag(Hdia,H00);
		Hamil(ii*2-1:ii*2,ii*2+1:ii*2+2) = H01;
	end
	Hamil = Hdia + Hamil + Hamil';
	[v,D] = eig(Hamil);
	LL(:,jj) = diag(D);
end

clf;
fig=figure(1)
subplot(1,2,1)
for ii = 1:2*N
	plot(B_list,LL(ii,:),'linewidth',lw,'color',[0.3,0.3,0.3]); hold on;
end

xlabel('B (T)')
ylabel('E (eV)')
set(gca,'fontsize',fs,'linewidth',boxlw,'xtick',[0,0.5,1],'ytick',[-4:2:4])
grid on
text(0.05,4.5,'$k_{z}=0$','interpreter','latex','fontsize',fs-2)

B = B_list(nB/2);
LL = zeros(2*N,nB);
for jj = 1:nkz
	kz = kz_list(jj);
	H00 = [kz,0;0,-kz];
	Hamil = zeros(2*N,2*N);
	Hdia = H00;
	for ii = 1:N-1
		H01 = [0,sqrt(B*ii);0,0];
		Hdia = blkdiag(Hdia,H00);
		Hamil(ii*2-1:ii*2,ii*2+1:ii*2+2) = H01;
	end
	Hamil = Hdia + Hamil + Hamil';
	[v,D] = eig(Hamil);
	LL(:,jj) = diag(D);
end

subplot(1,2,2)
for ii = 1:2*N
	plot(kz_list,LL(ii,:),'linewidth',lw,'color',[0.3,0.3,0.3]); hold on;
end

axis([0,1,-5,5])
xlabel('$k_{z}$','interpreter','latex')
set(gca,'fontsize',fs,'linewidth',boxlw,'xtick',[0,0.5,1],'ytick',[-4:2:4])
grid on
text(0.05,4.5,'$B=0.5T$','interpreter','latex','fontsize',fs-2)
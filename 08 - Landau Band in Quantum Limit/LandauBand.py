import matplotlib.pyplot as plt
import numpy as np

N = 15; ## the number of subbands of each band
lw = 1;  cl = [0,0,0];  fs = 16;
## === ===

ind_Hamil = 1
##
B_list = np.arange(0,10,0.01);
k3_list = np.array([0]);
LL = MagHamil(N,B_list,k3_list,0,ind_Hamil)[0];
##
for ii in np.arange(0,N*2-1,1):
    plt.plot(B_list,LL[:,ii],color=cl,linewidth=lw)
##
setPlt('$B (T)$','$E$',[0,10,-10,10])
plt.text(0.5,8,'$k_{3}=0$',fontsize=fs,color=[1,0,0])

fig1 = plt.gcf()
plt.show()
fig1.savefig('output/LBWeylVarB.png', dpi=150)
## === ===

k3_list = np.arange(-1,1,0.001)
B_list = np.array([2])
LL = MagHamil(N,B_list,k3_list,0,ind_Hamil)[0];
##
for ii in np.arange(1,N*2,1):
    plt.plot(k3_list,LL[:,ii-1],color=cl,linewidth=lw)
##
setPlt('$k_{3}$','$E$',[-1,1,-8,8])
plt.text(-0.9,6,'$B=2$',fontsize=fs,color=[1,0,0])
plt.show()

## === ===

ind_Hamil = 2;  m=2
##
B_list = np.arange(0,2,0.001)
k3_list = np.array([0.5])
LL = MagHamil(N,B_list,k3_list,m,ind_Hamil)[0];
##
for ii in np.arange(0,N*2-1,1):
    plt.plot(B_list,LL[:,ii],color=cl,linewidth=lw)
##
setPlt('$B (T)$','$E$',[0,2,-10,10])
plt.text(0.1,8,'$k_{3}=0.5$',fontsize=fs,color=[1,0,0])

fig2 = plt.gcf()
plt.show()
fig2.savefig('output/LBNLPerpVarB.png', dpi=150)

## === ===

k3_list = np.arange(-1,1,0.001)
B_list = np.array([3])
LL = MagHamil(N,B_list,k3_list,m,ind_Hamil)[0]
##
for ii in np.arange(1,N*2,1):
    plt.plot(k3_list,LL[:,ii-1],color=cl,linewidth=lw)
##
setPlt('$k_{3}$','$E$',[-1,1,-10,10])
plt.text(-0.8,6,'$B=2.5T$',fontsize=fs,color=[1,0,0])
plt.show()


## === ===

ind_Hamil = 3;  m=2
##
B_list = np.arange(0,1,0.001);
k1_list = np.array([0.5]);
LL = MagHamil(N,B_list,k3_list,m,ind_Hamil)[0];
##
for ii in np.arange(0,N*2-1,1):
    plt.plot(B_list,LL[:,ii],color=cl,linewidth=lw)
##
setPlt('$B (T)$','$E$',[0,1,-5,5])
plt.text(0.05,4,'$k_{3}=0.5$',fontsize=fs,color=[1,0,0])
plt.show()

## === ===

k1_list = np.arange(-1,1,0.001);
B_list = np.array([8]);
LL = MagHamil(N,B_list,k3_list,m,ind_Hamil)[0];
##
for ii in np.arange(1,N*2-1,1):
    plt.plot(k1_list,LL[:,ii-1],color=cl,linewidth=lw)
##
setPlt('$k_{3}$','$E$',[-1,1,-5,5])
plt.text(-0.8,4,'$B=8T$',fontsize=fs,color=[1,0,0])
plt.show()

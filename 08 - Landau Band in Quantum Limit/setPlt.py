def setPlt(xlab,ylab,axis):
    ft1 = {'family' : 'Times New Roman',
       'weight' : 'normal',
       'size'   : fs,}
    plt.xlabel(xlab,ft1); plt.ylabel(ylab,ft1);
    plt.axis(axis)
    plt.xticks(np.arange(axis[0],axis[1]+0.01,(axis[1]-axis[0])/4),fontsize=fs); 
    plt.yticks(np.arange(axis[2],axis[3]+0.01,(axis[3]-axis[2])/4),fontsize=fs)
    return[]
def MagHamil(N,B_list,k3_list,m,ind_Hamil):
    nB = B_list.size;  nk3 = k3_list.size;
    if nB > 1:
        nPara = nB
    else:
        nPara = nk3
    ##
    LL = np.matrix(np.zeros((nPara,N*2)))
    for jj in np.arange(1,nPara,1):
        if nB > 1:
            B = B_list[jj-1]
            k3 = k3_list[0]
        else:
            k3 = k3_list[jj-1]
            B = B_list[0]
        if ind_Hamil == 1:
            MagHamil = MagHamilWeyl(N,B,k3)
        elif ind_Hamil == 2:
            MagHamil = MagHamilNLPerp(N,B,k3,m)
        elif ind_Hamil == 3:
            MagHamil = MagHamilNLPara(N,B,k3,m)
        ##
        D,v = np.linalg.eig(MagHamil)
        D.shape = (N*2,1)
        LL[jj,:] = np.transpose(np.sort(D,axis=0))[0,:]
    return[LL]

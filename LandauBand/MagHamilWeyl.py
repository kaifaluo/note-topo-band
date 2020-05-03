def MagHamilWeyl(N,B,k3):
    MagHamil = np.matrix(np.zeros((N*2,N*2)))
    for ii in np.arange(0,N,1):
            Hn = np.matrix([[k3,np.sqrt(B*(ii+1))],[np.sqrt(B*(ii+1)),-k3]])
            MagHamil[ii*2:ii*2+2,ii*2:ii*2+2] = Hn
    return[MagHamil]
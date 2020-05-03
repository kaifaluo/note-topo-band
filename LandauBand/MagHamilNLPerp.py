def MagHamilNLPerp(N,B,k3,m):
    MagHamil = np.matrix(np.zeros((N*2,N*2)))
    for ii in np.arange(0,N,1):
            Hn = np.matrix([[k3,m-B*ii],[m-B*ii,-k3]])
            MagHamil[ii*2:ii*2+2,ii*2:ii*2+2] = Hn
    return[MagHamil]
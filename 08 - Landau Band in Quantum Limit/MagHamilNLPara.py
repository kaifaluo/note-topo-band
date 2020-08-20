def MagHamilNLPara(N,B,k3,m):
    MagHamil = np.matrix(np.zeros((N*2,N*2)))
    for ii in np.arange(0,N,1):
            H00 = np.matrix([[0,1],[1,0]])*(m-k3**2-B*(ii+1)/2);
            MagHamil[ii*2:ii*2+2,ii*2:ii*2+2] = H00;
    for ii in np.arange(0,N-1,1):
            H01 = np.matrix([[1,0],[0,1]])*(np.sqrt(B*(ii+1)/2));
            MagHamil[ii*2:ii*2+2,ii*2+2:ii*2+4] = H01;
            H01t = np.matrix([[1,0],[0,1]])*(np.sqrt(B*(ii+1)/2));
            MagHamil[ii*2+2:ii*2+4,ii*2:ii*2+2] = H01t;
    for ii in np.arange(0,N-2,1):
            H02 = np.matrix([[0,1],[1,0]])*(-(B/2)*np.sqrt((ii+2)*(ii+1)));
            MagHamil[ii*2:ii*2+2,ii*2+4:ii*2+6] = H02;
            MagHamil[ii*2+4:ii*2+6,ii*2:ii*2+2] = H02;
    return[MagHamil]
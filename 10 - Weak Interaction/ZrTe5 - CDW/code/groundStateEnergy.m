%% groundStateEnergy: function description
function [Eg] = groundStateEnergy(eta,B)
%eta=1;
%B = 2.5;

hbar = 1.05*1E-34;
eps0 = 8.85*1E-12;
e0 = 1.6*1E-19;

n0 = 8.87*1E22;
epsr = 25.3;
gL0 = eta*e0*537.3*1E9;

M0 = e0*(-4.7)*1E-3;
Mp = e0*150*1E-21;
vz = 0.3*1E5;
Mz = 0.01*Mp;

a = 7.25*1E-10;
bz = 2*pi/a;

numKz = 500;
magL = sqrt(hbar/(e0*B));
kF = (2*pi^2)*n0*magL^2;
Lz = numKz*a*(bz/(2*kF));

kzList = linspace(-kF,kF,numKz);

m0 = M0 + Mp/magL^2 + Mz*kzList.^2;
Ek0 = sqrt(m0.^2 + (hbar*vz*kzList).^2);

mu = Ek0(end);
vF = (1/hbar)*(m0(end)*(2*Mz*kF) + hbar^2*vz^2*kF)/Ek0(end);
kappa = sqrt(e0^3*B/(4*pi^2*eps0*epsr*hbar^2*vF));
DeltaL = (hbar*vF*kF)*csch(4*pi^2*hbar^2*vF*((2*kF)^2+kappa^2)^2/(e0*B*gL0));

Egk = -(1/(2*pi*magL^2*Lz))*sqrt((Ek0-mu).^2+DeltaL^2);
Eg = sum(Egk) + DeltaL^2*((2*kF)^2+kappa^2)^2/gL0;
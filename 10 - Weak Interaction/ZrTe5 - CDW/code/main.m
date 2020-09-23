clear all;
eta = 0.5;

numB = 50;
BList = linspace(1,3,numB);
EgList = 0*BList;
for ii = 1:numB
    B = BList(ii);
    EgList(ii) = groundStateEnergy(eta,B);
end

plot(BList,EgList); hold on
axis([1,3,-250,-50])
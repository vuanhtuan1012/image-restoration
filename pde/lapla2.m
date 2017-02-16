function L = lapla2(I, para, K)
% function LAPLA2 returns the Laplacian of image I with weighting factor

[m, n] = size(I);

% following x-axis
GE = I(:,[2:n,n]) - I;
GE = weight(GE, para, K).*GE;
GW = I - I(:,[1,1:n-1]);
GW = weight(GW, para, K).*GW;
Ixx = GE - GW;

% following y-axis
GS = I([2:m,m],:) - I;
GS = weight(GS, para, K).*GS;
GN = I - I([1,1:m-1],:);
GN = weight(GN, para, K).*GN;
Iyy = GS - GN;

L = Ixx + Iyy;
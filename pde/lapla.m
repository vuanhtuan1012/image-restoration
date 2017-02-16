function L = lapla(I)
% function LAPLA returns the Laplacian of image I following 2 directions

[m, n] = size(I);

% horizontal Laplacian
GE = I(:,[2:n,n]) - I;
GW = I - I(:,[1,1:n-1]);
Ixx = GE - GW;

% vertical Laplacian
GS = I([2:m,m],:) - I;
GN = I - I([1,1:m-1],:);
Iyy = GS - GN;

L = Ixx + Iyy;
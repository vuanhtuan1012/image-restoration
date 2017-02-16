function res = decompose(s, h0)
% function DECOMPOSE returns decomposed signal s
% using Daubechies'D4 Filter

H0 = h0;
G0 = [h0(4) -h0(3) h0(2) -h0(1)];
tmp = pconv(H0, s);
c1 = tmp(1:2:length(tmp)); % downsampling
tmp = pconv(G0, s);
d1 = tmp(1:2:length(tmp)); % downsampling
res = [c1 d1];
function res = reconstruct(s, h0)
% function RECONSTRUCT returns reconstructed signal s
% using Daubechies'D4 Filter

H1 = [h0(4) h0(3) h0(2) h0(1)];
G1 = [-h0(1) h0(2) -h0(3) h0(4)];
n = length(s)/2;
c1 = s(1:n);
d1 = s(n+1:2*n);
% upsampling c1
n = length(c1);
tmp = zeros(1,2*n);
tmp(1:2:2*n) = c1;
upc1 = pconv(H1, tmp);
% upsampling d1
n = length(d1);
tmp = zeros(1,2*n);
tmp(1:2:2*n) = d1;
upd1 = pconv(G1, tmp);
res = upc1 + upd1; % reconstructed signal
n = length(res);
res = res([4:n 1:3]); % delay 3
function res = filterbank(s, l, h0, direction)
% function FILTERBANK allows to do the decomposition/reconstruction of a
% signal along a bank of filters

% initial
res = s;
n = length(res);

if direction == 0 % decomposition
    while l > 0
        res(1:n) = decompose(res(1:n), h0);
        n = ceil(n/2);
        l = l-1;
    end
end

if direction == 1 % reconstruction
    l = l - 1;
    m = ceil(n/2^l);
    while l >= 0
        res(1:m) = reconstruct(res(1:m), h0);
        m = m*2;
        l = l-1;
    end
end
function W = weight(G, para, K)
% function WEIGHT returns value of weighting factor

switch para
    case 0
        [m, n] = size(G);
        W = ones(m, n);
    case 1
        tmp = (G/K).^2;
        W = exp(-tmp);
    case 2
        tmp = (G/K).^2;
        W = 1./(1 + tmp);
end
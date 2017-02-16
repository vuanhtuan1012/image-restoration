function H = vatHist(I)
% function vatHistogram returns histogram of grayscale image I
% This function is written by VU Anh Tuan, so it's called vatHist

if size(I,3) > 1
    fprintf('This function works only on grayscale image.\n');
    return;
end

[m, n] = size(I);
H = zeros(1, 256);
for i = 1:m
    for j = 1:n
        H(I(i,j)+1) = H(I(i,j)+1) + 1;
    end
end
function EI = equalization(I)
% function EQUALIZATION returns equalized image of image I
% following uniform histogram

H = vatHist(I); % compute histogram
Prob = H/sum(H(:)); % probability of gray levels

% compute LookUp Table
LUT = zeros(1, 256);
LUT(1) = Prob(1);
for i=2:256
    LUT(i) = LUT(i-1) + Prob(i);
end

% equalize image
[m, n] = size(I);
EI = zeros(m, n);
for i = 1:m
    for j = 1:n
        EI(i,j) = 255*LUT(I(i,j)+1) + 0.5;
        EI(i,j) = floor(EI(i,j));
    end
end
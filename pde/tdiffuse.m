function E = tdiffuse(I, N, lambda)
% function TDIFFUSE apply isotropic diffusion filtering on image I
% This function is written by VU Anh Tuan, so it's called tdiffuse

% set default value to lambda
if nargin == 2
    lambda = 0.2;
end

% initial
E = double(I);
dims = size(E,3);

switch dims
    case 1 % grayscale image
        for i = 1:N
            E = E + lambda*lapla(E);
        end
        if max(E(:)) > 1 % E is out of range [0;1]
            E = E/max(E(:));
        end
    case 3 % color image
        E(:,:,1) = tdiffuse(E(:,:,1), N, lambda);
        E(:,:,2) = tdiffuse(E(:,:,2), N, lambda);
        E(:,:,3) = tdiffuse(E(:,:,3), N, lambda);
end
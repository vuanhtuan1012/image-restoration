function E = tdiffusion(I, para, N, lambda, K)
% function TDIFFUSION apply anisotropic diffusion filtering on image I
% This function is written by VU Anh Tuan, so it's called tdiffuse

% initial
E = double(I);
dims = size(E,3);

switch dims
    case 1 % grayscale image
        for i=1:N
            E = E + lambda*lapla2(E, para, K);
        end
        if max(E(:)) > 1 % E is out of range [0;1]
            E = E/max(E(:));
        end
    case 3 % color image
        E(:,:,1) = tdiffusion(E(:,:,1),para, N, lambda, K);
        E(:,:,2) = tdiffusion(E(:,:,2),para, N, lambda, K);
        E(:,:,3) = tdiffusion(E(:,:,3),para, N, lambda, K);
end
function IP = inpainting(I, M, iter, N, lambda)
% function INPAINT reconstructs lost or deteriorated parts M of an image I

% initial
I = im2double(I);
M = im2double(M);
dims = size(I,3);

switch dims
    case 1 % grayscale image
        Y = I.*(M>0); % y(x)
        F = Y;
        for i=1:iter
            F = tdiffuse(F, N, lambda);
            F = Y.*(M>0) + F.*(M==0);
        end
        IP = F;
    case 3 % color image
        IP = I;
        IP(:,:,1) = inpainting(I(:,:,1), M, iter, N, lambda);
        IP(:,:,2) = inpainting(I(:,:,2), M, iter, N, lambda);
        IP(:,:,3) = inpainting(I(:,:,3), M, iter, N, lambda);
end
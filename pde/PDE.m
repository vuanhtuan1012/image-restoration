function PDE(q)
% function PDE is to answer questions in the TP of PDE

close all; % close all figures

if nargin < 1
    q = 0;
end

switch q
    %% Part 1: isotropic diffusion filtering
    case 1 % fix N = 30, vary lambda in [0.05; 0.3]
        I = imread('img_bruit.ppm');
        N = 30;
        lambda = [0.05, 0.1, 0.15, 0.2, 0.25, 0.27, 0.3];
        for i = 1:length(lambda)
            E = tdiffuse(I, N, lambda(i));
            figure; imshow(E);
            fname = sprintf('bruit-lam-%d.eps', lambda(i)*100);
            print(fname, '-depsc');
        end
        
    case 2 % fix lambda = 0.15 and vary N in [2; 150]
        I = imread('img_bruit.ppm');
        lambda = 0.15;
        N = [2, 10, 20, 30, 50, 100, 150];
        for i = 1:length(N)
            E = tdiffuse(I, N(i), lambda);
            figure; imshow(E);
            fname = sprintf('bruit-N-%d.eps', N(i));
            print(fname, '-depsc');
        end
        
    %% Part 2: anisotropic diffusion filtering    
    case 3 % compare isotropic and anisotropic diffusion filtering
        I = imread('img_bruit.ppm');
        N = 100; lambda = 0.2; K = 10;
        E = tdiffuse(I, N, lambda);
        figure; imshow(E);
        print('bruit-iso.eps','-depsc');
        E = tdiffusion(I, 1, N, lambda, K);
        figure; imshow(E);
        print('bruit-ani1.eps','-depsc');
        E = tdiffusion(I, 2, N, lambda, K);
        figure; imshow(E);
        print('bruit-ani2.eps','-depsc');
        
    case 4 % influence of weighting functions
        I = imread('img_bruit.ppm');
        N = 100; lambda = 0.2;
        K = [5 10];
        for i = 1:length(K)
            E = tdiffusion(I, 1, N, lambda, K(i));
            figure; imshow(E);
            fname = sprintf('bruit-ani1-%d.eps', K(i));
            print(fname,'-depsc');
            E = tdiffusion(I, 2, N, lambda, K(i));
            figure; imshow(E);
            fname = sprintf('bruit-ani2-%d.eps', K(i));
            print(fname,'-depsc');
        end
        
    case 5 % influence of K
        I = imread('img_bruit.ppm');
        N = 100; lambda = 0.2;
        K = [0.5 10 20 50];
        for i = 1:length(K)
            E = tdiffusion(I, 1, N, lambda, K(i));
            figure; imshow(E);
            fname = sprintf('bruit-ani1-K%d.eps', K(i)*10);
            print(fname,'-depsc');
            E = tdiffusion(I, 2, N, lambda, K(i));
            figure; imshow(E);
            fname = sprintf('bruit-ani2-K%d.eps', K(i)*10);
            print(fname,'-depsc');
        end
        
    case 6 % influence of N
        I = imread('img_bruit.ppm');
        lambda = 0.2; K = 10;
        N = [3, 25, 45, 300];
        for i = 1:length(N)
            E = tdiffusion(I, 1, N(i), lambda, K);
            figure; imshow(E);
            fname = sprintf('bruit-ani1-N%d.eps', N(i));
            print(fname,'-depsc');
            E = tdiffusion(I, 2, N(i), lambda, K);
            figure; imshow(E);
            fname = sprintf('bruit-ani2-N%d.eps', N(i));
            print(fname,'-depsc');
        end
        
    %% Part 3: inpainting    
    case 7
        I = imread('parrot.png');
        M = imread('parrot-mask.png');
        N = 100; lambda = 0.25;
        iter = [3, 10, 20, 30, 50, 100];
        for i = 1:length(iter)
            X = inpainting(I, M, iter(i), N, lambda);
            figure; imshow(X);
            fname = sprintf('parrot-%d.eps', iter(i));
            print(fname,'-depsc');
        end
        
    otherwise % help
        fprintf('function PDE is to answer questions ');
        fprintf('of the lab Image Restoration by PDE.\n');
        fprintf('Struct: PDE(q)\n');
        fprintf('- q = 1 => isotropic diffusion filtering, N = 30, lambda in [0.05; 0.3]\n');
        fprintf('- q = 2 => isotropic diffusion filtering, lambda = 0.15, N in [2; 150]\n');
        fprintf('- q = 3 => compare isotropic and anisotropic diffusion\n');
        fprintf('- q = 4 => anisotropic diffusion filtering, influence of weighting functions\n');
        fprintf('- q = 5 => anisotropic diffusion filtering, influence of K\n');
        fprintf('- q = 6 => anisotropic diffusion filtering, influence of N\n');
        fprintf('- q = 7 => inpainting\n');
end
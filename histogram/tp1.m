function tp1(q)
% function TP1 is to answer questions of the lab Histogram Modifications.
% q is the order of question.
% Student: VU Anh Tuan

if nargin < 1
    q = 0;
end

switch q
    case 1 % Q.1.
        mus = imread('muscle.bmp');
        lena = imread('lena.jpg');
        fprintf('images muscle.bmp and lena.jpg are read\n');
        fprintf('in variable mus, lena respectively.\n');
    case 2 % Q.2.
        mus = imread('muscle.bmp');
        lena = imread('lena.jpg');
        figure; imshow(mus);
        figure; imshow(lena);
    case 3 % Q.3.
        mus = imread('muscle.bmp');
        lena = imread('lena.jpg');
        fprintf('Size of image muscle is: %dx%dx%d\n', size(mus,1), size(mus,2), size(mus,3));
        fprintf('Size of image lena is: %dx%dx%d\n', size(lena,1), size(lena,2), size(lena,3));
        fprintf('=> muscle is a grayscale image because it has only 1 dimension.\n');
        fprintf('   lena is a color image because it has 3 dimensions.\n');
    case 4 % Q.4.
        fprintf('The computation of histogram is implemented in ');
        fprintf('the function vatHist.\n');
        fprintf('Please view the file vatHist.m\n');
    case 5 % Q.5.
        mus = imread('muscle.bmp');
        H = vatHist(mus);
        figure; displayHist(H);
        title('Histogram of muscle.bmp');
        fprintf('Based on the histogram I found that gray level of ');
        fprintf('the image muscle.bmp is in range [44, 249].\n');
    case 6 % Q.6.
        mus = imread('muscle.bmp');
        n_classes = max(mus(:)) - min(mus(:)) + 1;
        figure; hist(double(mus(:)), n_classes);
        title('Histogram of muscle.bmp');
        fprintf('Benefit of hist function is easy to display histogram ');
        fprintf('of an image.\nDo not need to build function to do this.\n');
    case 7 % Q.7.
        fprintf('Flowchart for performing histogram equalization of an image:\n');
        fprintf('Start -> Read image -> Convert to grayscale image(if needed) ');
        fprintf('-> Compute Histogram\n');
        fprintf(' -> Compute Probability of gray levels -> Compute LookUpTable (LUT) ');
        fprintf('for equalization\n -> Equalize image by using LUT -> End\n');
    case 8 % Q.8.
        fprintf('The function equalization is implemented in ');
        fprintf('the file equalization.m\n');
        fprintf('Please view this file.\n');
    case 9 % Q.9.
        aqt = imread('aquitain.bmp');
        figure; imshow(aqt);
    case 10 % Q.10.
        aqt = imread('aquitain.bmp');
        H = vatHist(aqt);
        figure; displayHist(H);
        title('Histogram of aquitain.bmp');
        fprintf('The histogram shows that gray levels of image is in ');
        fprintf('range [10;40].\nThat is why this image is very dark (tp1(9)).\n');
    case 11 % Q.11.
        aqt = imread('aquitain.bmp');
        eaqt = equalization(aqt);
        figure; imshow(eaqt/max(eaqt(:)));
        fprintf('The result is fine. I can see objects in the image aquitain.\n');
    case 12 % Q.12.
        a = 20; b = 35; va = 15; vb = 180;
        [alpha, beta, omega] = getCoefficients(a, b, va, vb);
        U = 0:255;
        V = transform(U, alpha, beta, omega, a, b, va, vb);
        figure; plot(U, V); xlabel('u'); ylabel('v');
        title('v = T(u)');
    case 13 % Q.13.
        fprintf('Coefficients alpha, beta, omega is computed\n');
        fprintf('by the function getCoefficients, based on a, b, va, vb.\n');
        fprintf('Please view the file getCoefficients.m\n');
    case 14 % Q.14.
        fprintf('Function stretch is implemented in the file stretch.m\n');
    case 15 % Q.15.
        aqt = imread('aquitain.bmp');
        a = 20; b = 35; va = 15; vb = 180;
        res = stretch(aqt, a, b, va, vb);
        fprintf('Transformation of image aquitain.bmp is in variable res.\n');
    case 16 % Q.16
        aqt = imread('aquitain.bmp');
        a = 20; b = 35; va = 15; vb = 180;
        res = stretch(aqt, a, b, va, vb);
        figure; imshow(res/max(res(:)));
        fprintf('The image of this transformation is darker than the one\n');
        fprintf('of uniform transformation in Q.11 (tp(11)) and the');
        fprintf(' contour seems sharper.\n');
    case 17 % Q.17
        mus = imread('muscle.bmp');
        H = vatHist(mus);
        figure; displayHist(H);
        title('Histogram of muscle.bmp');
        fprintf('Based on the histogram I choose value of threshold is 81 \n');
        fprintf('for discrimination between two cell types.\n');
    case 18 % Q.18
        mus = imread('muscle.bmp');
        T = 81;
        bin = mus>T;
        figure; imshow(mus);
        figure; imshow(bin);
    otherwise
        fprintf('function TP1 is to answer questions ');
        fprintf('of the lab Histogram Modifications.\n');
        fprintf('Struct: tp1(q)\n');
        fprintf('- q is in [1, 18] => to answer question q.\n');
        fprintf('- otherwise => to help.\n');
end
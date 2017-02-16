function res = stretch(img, a, b, va, vb)
% function STRETCH returns linear tranformation of image img

[alpha, beta, omega] = getCoefficients(a, b, va, vb); % get coefficients
res = transform(img, alpha, beta, omega, a, b, va, vb); % transform image
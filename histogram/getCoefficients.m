function [alpha, beta, omega] = getCoefficients(a, b, va, vb)
% function getCoeffficient returns coefficients of linear transformation
% alpha, beta, omega based on a, b, va, vb

alpha = va/a;
beta = (vb - va)/(b - a);
omega = (255 - vb)/(255 - b);
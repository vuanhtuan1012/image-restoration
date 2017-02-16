function V = transform(U, alpha, beta, omega, a, b, va, vb)
% function TRANSFORM transforms matrix U into matrix V
% following linear tranformation

[m, n] = size(U);
V = zeros(m, n);

for i = 1:m
    for j = 1:n
        if U(i,j) <= a
            V(i,j) = alpha*U(i,j);
        elseif U(i,j) <= b
            V(i,j) = beta*(U(i,j) - a) + va;
        else
            V(i,j) = omega*(U(i,j) - b) + vb;
        end
    end
end
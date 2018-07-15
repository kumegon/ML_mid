function [ Y ] = prox_nuclear(lambda, X)
%prox_nuclear nuclear normのprox
[U,S,V] = svd(X);
Y = U * prox_l1(lambda,S) * (V.');
end

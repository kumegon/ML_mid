function [ y ] = prox_l1(lambda, x)
%prox_l1 l1 normのprox
y = wthresh(x,'s',lambda);
end


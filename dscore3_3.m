function [y] = dscore3_3(lambda,a,K,n)
y = -a.'*K*a/(4*lambda) + ones(1,n)*a;
end

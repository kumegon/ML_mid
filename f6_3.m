function [y] = f6_3(Q,A,Z)
% f6_3 目的関数
T = A - Z;
T(Q) = 0;
[U,S,V] = svd(Z);
y = pow2(norm(T,'fro')) + sum(diag(S));
end

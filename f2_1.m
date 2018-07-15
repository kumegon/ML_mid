function [y] = f2_1(lambda,w,u,A)
% 目的関数
y = (w-u).'*A*(w-u) + lambda*norm(w,1);
end

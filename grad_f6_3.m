function [Y]  = grad_f(Q,A,X)
% grad_f fの微分値
% aaa
Y = 2*(X-A);
Y(Q) = 0;
end

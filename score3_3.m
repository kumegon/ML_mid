function [y] = score3_3(lambda,z,w,n)
y = sum(max(zeros(n,1),ones(n,1)-z*(w.')))+lambda*pow2(norm(w));
end

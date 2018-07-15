function [ a ] = proj_01(a)
%proj_01 [0,1]^n¿¿¿¿¿¿¿
a(a>1) = 1;
a(a<0) = 0;
end

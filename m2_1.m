A = [3,0.5;0.5,1];
u = [1;2];
lambda = 1;
gamma = 2*norm(A,2);
eta = 1/gamma;
w = rand(2,1);
lambda = 6;
cnt = 0;
y = f2_1(lambda,w,u,A);
prev = 0;
score = y;
eps = 0.00000;

while abs(prev-score) > eps
  cnt = cnt+1;
  prev = score;
  w = prox_l1(lambda/gamma, w-eta*grad_f2_1(w,u,A));
  score = f2_1(lambda,w,u,A);
  y = [y,score];
end

x = 0:1:cnt;
semilogx(x,y);

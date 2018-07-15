m = 20;
n = 40;
r = 2;

A = rand(m,r) * rand(r,n);
ninc = 100;
Q = randperm(m * n,ninc);
A(Q) = NaN;
Z = rand(m,r) * rand(r,n);
lambda = 0.01;
gamma = 2;
eta = 1/gamma;
cnt = 0;
y = f6_3(Q,A,Z);
prev = 0;
score = y;
eps = 0.00001;

while abs(prev-score) > eps
  cnt = cnt+1;
  prev = score;
  Z = prox_nuclear(lambda/gamma, Z-eta*grad_f6_3(Q,A,Z));
  score = f6_3(Q,A,Z);
  y = [y,score];
end

x = 0:1:cnt;
plot(x,y);

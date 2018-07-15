n = 40;
omega = randn(1,1);
noise = 0.8*randn(n,1);
x = randn(n,2);
y = 2*(omega * x(:,1) + x(:,2) + noise>0) -1;
z = diag(y)*x;
K = z*(z.');
a = randn(n,1);
lambda = 0.00003;
gamma = norm(K,'fro')/(2*lambda);
eta = 1/gamma;

cnt = 0;
w = sum(1/(2*lambda)*diag(a)*z);
score = score3_3(lambda,z,w,n);
d_score = dscore3_3(lambda,a,K,n);
y_s = score;
y_ds = d_score;
eps = 0.1;
loop = 100000;

while abs(score-d_score) > eps
  cnt = cnt+1;
  a = proj_01(a - eta*(K*a/(2*lambda) - ones(n,1)));
  w = sum(1/(2*lambda)*diag(a)*z);
  score = score3_3(lambda,z,w,n);
  d_score = dscore3_3(lambda,a,K,n);
  if mod(cnt,loop) == 0
    y_s = [y_s,score];
    y_ds = [y_ds,d_score];
    score
    d_score
  end
end

f1 = figure;
f2 = figure;

figure(f1);
xs = 0:loop:cnt;
plot(xs,y_s-y_ds,xs,y_s,xs,y_ds);

figure(f2);
xs = linspace(-5,5);
ys = linspace(-5,5);
[X,Y] = meshgrid(x,y);
gscatter(x(:,1),x(:,2),y,'br','xo')
hold on;
Z = w(1,1)*X + w(1,2)*Y;
contour(X,Y,Z,1);


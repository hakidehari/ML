A = csvread("linear-regression.train.csv");
display(A);

theta0 = 1;
theta1 = 1;

m = size(A, 1);
O = [];

x = A(:, 1);
y = A(:, 2);
display(x);
display(y);

theta = [theta1; theta0];
alpha = .01;
tol = .001;

for i=1:1000
  temp0 = theta0 - (1./m)*alpha*sum(A*theta-y);
  temp1 = theta1 - (1./m)*alpha*sum((A*theta-y).*x);
  theta1 = temp1;
  theta0 = temp0;
  theta = [theta1; theta0];
  e=A*theta-y;
  errorValue = sum(e.*e);
  O(i) = errorValue;
  display(errorValue);
  display(theta1);
  display(theta0);
  if ((i > 1) && (abs(O(i)-O(i-1))< tol))
    break;
  endif
endfor

figure 1;
plot(O);
figure 2;
scatter(A(:, 1), A(:, 2));
hold on
plot(x, theta1*x + theta0);

display(errorValue);
display(theta1);
display(theta0);

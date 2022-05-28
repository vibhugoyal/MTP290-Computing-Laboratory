syms x;
f=@(x) x^4-16*(x^3) + 89*(x^2) - 194*x + 120;

h = zeros(1,1000);
h(1)= 1.5;
tol= 1e-10;
iteration=0;
e = zeros(1,1000);

 
for i=2:1000
    y = h(i-1);
    z = y+ f(y);
    d = (f(z) - f(y))/f(y);
    h(i) = y - f(y)/d;
    e(i) = h(i)-h(i-1);
    iteration=iteration+1;
   
    if abs((h(i)-h(i-1))/h(i))< tol
        root=h(i);
        break
    end
end

for i = 4:iteration
   t = (log(e(i)) - log(e(i-1)))/(log(e(i-1))-log(e(i-2)));
   fprintf('order of convergence is %.2f \n',t);
end

fprintf('root is %.4f \n',root);
fprintf('iteration %d\n',iteration);
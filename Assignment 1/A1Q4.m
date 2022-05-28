syms x
f = @(x) tanh(x) ;
df = matlabFunction( diff(f(x)) );

a=-10;
b=15;
c=(a+b)/2;
s=0.1;
error=1e-10;
limit = s*(b-a);

while abs(f(c))> error && (b-a)>=limit
    if f(c)<0&&f(a)<0
        a=c;
    else
        b=c;
    end
    c=(a+b)/2;
end


c = (a+b)/2;
fprintf('value of c after bisection method is %.10f\n',c);
% start of newton method now

x=c;   %initial gues
x_old = 100;
while abs(x_old-x) > 1e-10 %x ~= 0
    x_old = x;
    x = x - f(x)/df(x);
    
end

fprintf('root is %.10f\n',x);




a=7;        % provide the value of a

syms x
f = @(x) 1/x - a ;   % choose function to be 1/x - a = f(x) to find root/ solution
df = matlabFunction( diff(f(x)) );

x = 0.25;           %x is initial guess
tol=1e-10;

x_old = 100;

while abs(x_old-x) > tol %x ~= 0
    x_old = x;
    x = x - f(x)/df(x);
    
end

fprintf('%.20f\n',x);


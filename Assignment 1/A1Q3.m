syms x
f = @(x) tan(x);

u = zeros(1,10);
v = zeros(1,10);
u(1)= 1;
v(1)= 2;  %initial guesses for opposite sign



for i=2:10
    w = (u(i-1)*f(v(i-1)) - v(i-1)*f(u(i-1)) )/(f(v(i-1)) - f(u(i-1)));
    if f(w)*f(u(i-1))>0
       u(i)=w;
       v(i)=v(i-1);
    else
       u(i)=u(i-1);
       v(i)=w;
    end
    
end

for i=1:10
    fprintf(' iteration: %d, value of u(i): %.10f , value of f(u(i)): %.5f\n',i ,u(i),f(u(i)));
    fprintf(' iteration: %d, value of v(i): %.10f , value of f(v(i)): %.5f\n',i ,v(i),f(v(i)));
    
end
        
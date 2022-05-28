n=10;

h=1/n;   %step size
arr = 0:h:1;

y=zeros(n+1,1);

g0=1;
g1=5;

y(1)=g0;
y(n+1)=g1;
%choosing p,q,f

p = @(x) cos(x);
q = @(x) x^3 ;
f = @(x) x^2 ;

%orignal equation is -u'' + p(x)u' + q(x)u = f(x)
A = zeros(n-1,n-1);
b= zeros(n-1,1);

%forming the matrix 

%first equation

A(1,1)=2+q(0.1)*h*h ;
A(1,2)=p(0.1)*h/2 - 1;
b(1,1)=(1+0.5*p(0.1)*h)*g0 + h*h*f(0.1) ;

% last equation
b(n-1,1) = (1- 0.5*h*p(h*(n-1)))*g1 + h*h*f(h*(n-1));
A(n-1,n-1) = 2+ q(h*(n-1))*h*h  ;
A(n-1,n-2) = -1-0.5*h*p(h*(n-1)) ;

%2-(n-2) equations

for i=2:n-2
    A(i,i-1) = -1-0.5*h*p(i*h);
    A(i,i)=  2+ q(i*h)*h*h;
    A(i,i+1)=0.5*h*p(i*h)-1;
    b(i,1)=h*h*f(i*h);
end

sol = A\b;

for i=2:n
    y(i)= sol(i-1);
end

% displaying the results

y
plot(arr,y);






 
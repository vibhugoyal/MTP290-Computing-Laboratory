f = @(x,y) y/x - (y/x)^2;   %f(x,y) = y' is our function

%initial parameters given in our question

h= 0.01;                                             % step size
x = 1:h:2;                                           % values of x
len_array = length(x);                               % array length
y = zeros(len_array,1);                              % array y to store the approximated values
y(1) = 1;                                            

% loop to store approximated values

for i=1:(len_array-1)                              
    k1 = f(x(i),y(i));
    k2 = f(x(i)+0.5*h,y(i)+0.5*h*k1);
    k3 = f((x(i)+0.5*h),(y(i)+0.5*h*k2));
    k4 = f((x(i)+h),(y(i)+k3*h));

    y(i+1) = y(i) + (1/6)*h*(k1+2*k2+2*k3+k4);  
end

%value of y(2)

y_approximated = y(len_array);
y_approximated                 %no semicolon to display

%plotting value of y vs x

plot(x,y)
f = @(x) 1/(1+x^2);       %f(x,y) = y' is our function

a=-4.0;     %limits
b=4.0;
n=10.0;     %no. of rectangles

%defining some things to make calculation easy
g = (b-a)/2;
y = 1/sqrt(3);
o =  -1/sqrt(3);
p = (a+b)/2;
h = (b-a)/(n);  

% 1. Trapezoidal rule

I_trapezoid = g*(f(a) + f(b)) ;

I_trapezoid 

% 2. Simpson rule

I_simpson = g*(f(a) + f(b) + 4*f((a+b)/2) )/3 ;

I_simpson

% 3. Composite trapezoidal rule

I_composite_trapezoidal = 0.0; 
 
for i = 1:n+1
    if ( i == 1 || i == n+1)
        I_composite_trapezoidal= I_composite_trapezoidal + h*(f(a + (i-1)*h))/2.0 ;
    else
        I_composite_trapezoidal = I_composite_trapezoidal + h*f(a + (i-1)*h) ;
    end
        
end
 
 
I_composite_trapezoidal    %no semicolon to display 

% 4 .composite simpson rule

even_terms_sum=0;
odd_terms_sum=0;


for z=1:1:n-1
    if rem(z,2)==0
       even_terms_sum=even_terms_sum+f(a+z*h);
     else
       odd_terms_sum=odd_terms_sum+f(a+z*h); 
    end
end

I_composite_simpson = h/3*(f(a)+4*odd_terms_sum+2*even_terms_sum+f(b));
I_composite_simpson


% 5 . two point Gauss-Legendre quadrature

I_gauss = g*(f(g*y+p) + f(g*o+p));

I_gauss

%  The conclusions

fun = @(x) 1./(1+x.*x);
I_actual = integral(fun,-4,4);
I_actual

%the conclusions

%1. The composite simpson and trapezoidal rule give fairly accurate results
%2.The gauss Quardrature is giving a result with error
%3.simson and trazoidal normal rule are also showing significant errors

%errors in all the methods are (in percentages)

error_trapez = abs(I_trapezoid - I_actual)/I_actual *100

error_simpson = abs(I_simpson - I_actual)/I_actual *100

error_gauss= abs(I_gauss - I_actual)/I_actual *100

error_composite_trap = abs(I_composite_trapezoidal - I_actual)/I_actual *100

error_composite_simpson = abs(I_composite_simpson - I_actual)/I_actual *100




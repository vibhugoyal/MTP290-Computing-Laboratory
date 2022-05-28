% part 1. Gauss Seidel method (in seidel, updated values are used)

%initial guess

x=[0.5 0.5]' ;  

% initial norm value set to a high value
norm_value = 100; 

% set tolerance limit in the question

tolerance=1e-4; 

% matrix A and b for the equation Ax=b

A=[10 1; 1 10]  ;
b=[11 11]'  ;

iteration=0;
[q,w] = size(A);


while norm_value>tolerance
    x_stored = x;
    
    for i=1:q
        x(i)=(1/A(i,i))*b(i);
        for j=1:q 
            if j~=i
                x(i)=x(i)- A(i,j)*x(j)/A(i,i);
            end
        end
    end
    
    norm_value=norm(x - x_stored,inf);
    iteration=iteration+1;
end


%displaying results
disp("part 1: gauss-seidel results");

x1 = x(1)
x2 = x(2)
iteration



% part 2 . Gauss Jacobi method (in jacobi, stored values used)

%initial guess
x=[0 0 0 ]' ;
% initial norm value set to a high value
norm_value = 100; 

% set tolerance limit in the question

tolerance=1e-4; 

% matrix A and b for the equation Ax=b


A=[4 1 -1;2 7 1;1 -3 12] ;
b=[3 19 31]' ;


[q,w]=size(A);
iteration=0;

while norm_value>tolerance
    x_stored = x;
    
    for i=1:q
        x(i)=(1/A(i,i))*b(i);
        for j=1:q 
            if j~=i
                x(i)=x(i)- A(i,j)*x_stored(j)/A(i,i);
            end
        end
    end
    
    norm_value=norm(x - x_stored,inf);
    iteration=iteration+1;
    
end

%displaying results
disp("part 2: gauss-jacobi results");

x1 = x(1)
x2 = x(2)
x3 = x(3)

iteration
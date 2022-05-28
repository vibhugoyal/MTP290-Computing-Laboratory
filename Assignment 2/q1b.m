% A =LU 
% we have to solve Ax=b i.e. LUx=b 
% it is equivalent to solving Lz=b and Ux=z
% Lz=b is solved using forward substitution
% Ux=z is solved using backward substitution

A = [1 2 3;4 3 6; 7 8 5];
b =[1 2 3];

%step 1 - check if A is a square matrix or not

[a,p] = size(A);
if a~=p
    disp("invalid matrix : not square ")
end

%step -2 check if determinant is non singular

if det(A)==0
    disp("invalid matrix: singular")
end

%step -3 define a L matrix

L = zeros(a,a);
for i=1:a
    L(i,i)=1;
end

% step -4 transformation of our matrix

for j=1:a-1
    for i=j+1:a
        factor = A(i,j)/A(j,j);
        L(i,j)= factor;
        for m=j:a
            A(i,m)=A(i,m) - A(j,m)*factor;
        end
    end
end
        
% step -5 renaming A to U

U = A;

% step -6 checking A=LU

A=L*U;

% step -7 Lz=b is solved using forward substitution


x=zeros(1,a);
x(1,1)=b(1)./L(1,1);


for k=2:a
   
  
        x1=1/L(k,k).*(b(k)-sum(L(k,k-1:-1:1).*x(k-1:-1:1)));
        x(1,k)=x1;
end

z=x';

% step -8 Ux=z is solved using backward substitution


y=zeros(1,a);
y(1,a)=z(end)./U(a,a);

for k=a-1:-1:1
   
  
        x1=1/U(k,k).*(z(k)-sum(U(k,k+1:end).*y(k+1:end)));
        y(k)=x1;
end

% x is answer

x=y 

% hence we solved the equation Ax=b

% confirmating we write the value of inv(A)*b

confirm_ans = (A\b')' 
        





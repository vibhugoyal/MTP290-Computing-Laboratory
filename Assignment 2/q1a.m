A = [1 2 3;4 5 6; 7 8 5]; % input a matrix

%step 1 - check if A is a square matrix or not

[a,b] = size(A);
if a~=b
    disp("invalid matrix")
end

%step -2 define a L matrix

L = zeros(a,a);
for i=1:a
    L(i,i)=1;
end


% step -3 transformation of our matrix

for j=1:a-1
    for i=j+1:a
        factor = A(i,j)/A(j,j);
        L(i,j)= factor;
        for m=j:a
            A(i,m)=A(i,m) - A(j,m)*factor;
        end
    end
end
        
% step - 4 renaming A to U

U = A;
% step - 5 checking A=LU
L      %display L
U      %display U
A=L*U  %display A and we cross check if it is orignal input matrix A
    


        





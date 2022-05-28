%step -1 taking input of a , b, c
% a(1)=0 c(n)= 0 , n is the number of unknowns or columns 

a=[0 1 2 5];  %input a(1) to a(n) here , in this case n=4
b=[1 3 4 3];  %input b(1) to b(n) here , in this case n=4
c=[2 3 4 0];  %input c(1) to c(n) here , in this case n=4
d=[6 8 5 1];  %input d(1) to d(n) here , in this case n=4

[row,col] = size(a);

%input can be 4*n matrix with 4 rows where first row is a,second row is b
%, third row is c, forth row is d.The logic remains same.

%step -2 finding values of c prime

ci = zeros(1,col-1);

ci(1)=c(1)/b(1);

for i=2:col-1
    ci(i)=c(i)/(b(i)-a(i)*ci(i-1));
end


%step -2 finding values of d prime

di = zeros(1,col);

di(1)=d(1)/b(1);

for i=2:col
    di(i)=(d(i)-a(i)*di(i-1))/(b(i)-a(i)*ci(i-1));
end


%step-3 finding the solutions

x=zeros(1,col);


x(col)=di(col);


for i=col-1:-1:1
    x(i)=di(i)-(ci(i).*x(i+1));
end


% our solution is stored in x

x      % no semicolon to display the value of x

%confirming the answers

value_d = zeros(1,col);
value_d(1)= b(1)*x(1)+c(1)*x(2);

for i=2:col-1
    value_d(i) = a(i)*x(i-1)+b(i)*x(i)+c(i)*x(i+1);
end

value_d(col)= a(col)*x(col-1)+b(col)*x(col) ;

%displaying value of value_d

value_d

%hence we verified our answer
    
    

    




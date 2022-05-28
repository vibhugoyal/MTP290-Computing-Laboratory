
for n=3:6   % n can be 3,4,5,6
    
%step 1 is forming the matrix 

    h=zeros(n,n);
    for i=1:n
        for j =1:n
            h(i,j)=1/(i+j-1);
        end
    end
    % step 2 define the inverse of matrix

    g = inv(h);

    % step 3 finding euclidian norm

    x=0;
    y=0;
    for i=1:n
        for j=1:n
            x=x+h(i,j)*h(i,j);
            y=y+g(i,j)*g(i,j);
        end
    end

    cond_euc = sqrt(x)*sqrt(y)

    % step 4 finding row norm

    a=zeros(1,n);
    b=zeros(1,n);

    sum1=0;
    sum2=0;
    for i=1:n
        for j=1:n
            sum1=sum1+abs(h(i,j));
            sum2=sum2+abs(g(i,j));
        end
        a(1,i)=sum1;
        b(1,i)=sum2;
        sum1=0;
        sum2=0;
        
    end

    cond_row = max(a)*max(b)
    
    % step 5 finding columns norm

    a=zeros(1,n);
    b=zeros(1,n);

    sum1=0;
    sum2=0;
    for j=1:n
        for i=1:n
            sum1=sum1+abs(h(i,j));
            sum2=sum2+abs(g(i,j));
        end
        a(1,j)=sum1;
        b(1,j)=sum2;
        sum1=0;
        sum2=0;
       
    end

    cond_column = max(a)*max(b) %no semicolon - ; so that it displays it

    %our code is end
end


% observations - 
%1.the value of condition numbers are increasing as n increases
%2. the value of conditional numbers of row and column norm are the same
%for the above matrices.



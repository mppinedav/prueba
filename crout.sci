function [L,U]= crout(A)
    [m,n]=size(A); 
    L=eye(A);
    U=zeros(A);
    for j=2:n 
        A(1,j)=A(1,j)/A(1,1); 
    end 
    for j=2:n-1 
        for i=j:m 
            suma=0; 
            for k=1:j-1 
                suma=suma+A(i,k)*A(k,j); 
            end 
            A(i,j)=A(i,j)-suma; 
        end 
        for k=j+1:n 
            suma=0; 
            for i=1:j-1 
                suma=suma+A(j,i)*A(i,k); 
            end 
            A(j,k)=(A(j,k)-suma)/A(j,j); 
        end 
    end 
    suma=0; 
    for k=1:n-1 
        suma=suma+A(n,k)*A(k,n); 
    end 
    A(n,n)=A(n,n)-suma; 
    U=triu(A);
    L=tril(A) 
    for i=1:n 
        U(i,i)=1; 
    end 
endfunction


function [y] = solve_d(L, B)
[m n]=size(L);
y=zeros(m,1); 
y(1)=B(1)/L(1,1);
for i=2:m
     y(i)=-L(i,1)*y(1);
      for k=2:i-1
          y(i)=y(i)-L(i,k)*y(k);
      end;
      y(i)=(B(i)+y(i))/L(i,i);
end;
endfunction

function  [x] = solve_x(U, y)
[m n]=size(U);
x=zeros(m,1);
x(m)=y(m)/U(m,m);
i=m-1;
q=0;
while  (i~= 0)
  x(i)=-U(i,m)*x(m);
   q=i+1;
      while (q~=m)
          x(i)=x(i)-U(i,q)*x(q);
          q=q+1;
      end;
    x(i)=(y(i)+x(i))/U(i,i);
    i=i-1;
end;
x
endfunction

A=[1,0,-3,0,5;
   0,2,-1,4,0;
   2,2, 0,0,-5;
   0,0,-1,2,-1;
   1,1, 0,0,0];

b= [17;17;21;0;3];
[L,U]=crout(A)
d = solve_d(L,b);
x= solve_x(U,d);
disp(x)

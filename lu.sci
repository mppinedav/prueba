function  y = solve_d(L, B)
[m,n]=size(L);
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


function  x = solve_x(U, y)
[m,n]=size(U);
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


function [L,U,x]=FLU(A,b)
fila= size(A,1);
L=eye(fila,fila); 
U=A;
for j=1:fila
    for i=j+1:fila
        L(i,j) = (U(i,j)/U(j,j));
        U(i,:) =U(i,:)-(U(i,j)/U(j,j))*U(j,:);
    end
end
d = solve_d(L,b);
x= solve_x(U,d);
endfunction


A=[1,0,-3,0,5;
   0,2,-1,4,0;
   2,2, 0,0,-5;
   0,0,-1,2,-1;
   1,1, 0,0,0];

b= [17;17;21;0;3];

[M,P,x]=FLU(A,b)
disp(x)
//disp(M)
//disp(P)



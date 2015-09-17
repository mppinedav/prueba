function[L,U,X]=LU_Parker(A,B)



  % Now use a vector y to solve 'Ly=b'
  y=zeros(m,1);
  y(1)=B(1)/L(1,1);
  for i=2:m
  y(i)=-L(i,1)*y(1);
  for k=2:i-1
  y(i)=y(i)-L(i,k)*y(k);
  y(i)=(B(i)+y(i))/L(i,i);
  end;
  end;

% Now we use this y to solve Ux = y
x=zeros(m,1);
x(1)=y(1)/U(1,1);

for i=2:m
x(i)=-U(i,1)*x(1);

for k=i:m

      x(i)=x(i)-U(i,k)*x(k);

      x(i)=(y(i)+x(i))/U(i,i);

end;

   end

A = [12,-1,3; 4,-4,9;1,7,-4]; b = [8;62;-51];
[B,C,D]=lu(A)


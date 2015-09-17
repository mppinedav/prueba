function [x] = cramer(A, b)
    [m, n] = size(A);
    if det(A) == 0
        error('Matrix is singular.')
    end
    if m ~= n
        error('Matrix is not square.') 
    end
    for i = 1:n
        B = A;
        B(:, i) = b;
        x(i) = det(B) / det(A);
    end
    x = x';
endfunction


A=[1,0,-3,0,5;
   0,2,-1,4,0;
   2,2, 0,0,-5;
   0,0,-1,2,-1;
   1,1, 0,0,0];

b= [17;17;21;0;3];
x= cramer(A,b)
disp(x)

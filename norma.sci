function S=norma(A,p);
    [f,c]= size(A);
    S=0
    for i=1:f
        for j=1:c
            S=S+abs(A(i,j))^(p)
        end
    end
    S=S^(1/p)
endfunction

function [L,U] = LU_decomposition(A)
% Funkcja rozbija macierz A na dwie macierze L i U
% L - macierz dolna trójkątna z jedynkami na przekątnej
% U - macierz górna trójkątna

size_a = size(A);
p = size_a(1);

L = eye(p,p);
U = A;
cols = 1:p-1;
for c = cols
    L_temp = eye(p,p);
    rows = c+1:p;
    for r = rows
        wsp = U(r,c)/U(c,c);
        L_temp(r,c) = -wsp;
        L(r,c) = wsp;
    end
    U = L_temp*U; 
end

end


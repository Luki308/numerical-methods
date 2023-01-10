function [x] = solve_triangle(A,b,option)
% Funkcja ta rozwiązuje równanie Ax=b, gdzie:
% A - macierz trójkątna,
% b - wektor wartości,
% option - przyjmuje wartosci 'upper' i 'lower' opisujące typ macierzy
% trójkątnej
% x - wyliczony wektor rozwiązań równania
if(nargin == 2)
    option = "upper";
end

A_size = size(A);
p = A_size(1);
x = zeros(1,p);

if(option == "upper")
    rows = p:-1:1;
else
    rows = 1:p;
end

for r = rows
    if(option == "upper")
        c = p:-1:r+1;
    else
        c = 1:r-1;
    end
    if(~isempty(c))
        x_r = (b(r) - sum(A(r,c).*x(c)))./A(r,r);
    else
        x_r = b(r)./A(r,r);
    end
    x(1,r) = x_r;
end








end


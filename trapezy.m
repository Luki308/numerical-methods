function [wartosc] = trapezy(funkcja,a,b,c,d,n,m)
% Opis parametrów:
% funkcja - funkcja, którą całkujemy
% a,b,c,d - wartosci skrajne prostokata [a,b],[c,d], po którym całkujemy
% n,m - ilość kroków,

% Wspolczynniki kwadratury trapezowej
A = repmat(2,n+1,1);
A(1) = 1;
A(n) = 1;

B = repmat(2,m+1,1);
B(1) = 1;
B(m) = 1;

% Wyznaczanie długości kroku
H1 = (b-a)/n;
H2 = (d-c)/m;

% Macierz współczynników złożenia kwadratur składowych

C = H1*H2*B*A'/4;

% Macierz wartosci funkcji w wezlach
x = linspace(a,b,n+1);
y = linspace(c,d,m+1);
W(n+1,m+1) = 0;
for i=1:n+1
    for j=1:m+1
        W(i,j) = funkcja(x(i),y(j));
    end
end

% Wynik dla kwadratury złożonej trapezów
wartosc = sum(dot(C,W));
end


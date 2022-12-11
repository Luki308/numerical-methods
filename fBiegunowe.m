function [wartosc] = fBiegunowe(r, fi, f)
% Zamiana funkcji we współrzędnych kartezjańskich
% na funkcję we współrzędnych biegunowych

% Jeśli nie jest podana funkcja, to bierzemy domyślną z pliku
if nargin == 2
   f = @f;
end

wartosc = r.*f(r.*cos(fi), r.*sin(fi));
end


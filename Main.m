% Skrypt, w którym liczone są poszczególne całki oraz rysowany jest wykres

% Wartosc wbudowanej funkcji
dokladna = integral2(@fBiegunowe,0,1,0,2*pi);

% Inicjalizacja parametrów

a = 0;
b = 1;
c = 0;
d = 2*pi;
n = 100;
m = 100;

% Liczenie numeryczne
wynik_trapezy = trapezy(@fBiegunowe,a,b,c,d,n,m);
blad_bezwzgledny = wynik_trapezy - dokladna;
blad_wzgledny = abs(wynik_trapezy - dokladna)/abs(dokladna);

% Tworzenie siatki do wykresu
r = linspace(a,b);
phi = linspace(c,d);

[R, PHI] = meshgrid(r, phi);

X = R.*cos(PHI);
Y = R.*sin(PHI);
Z = f(X,Y);

% Rysowanie wykresu
figure
mesh(X,Y,Z)
title('f(x,y) = $log(x^2+y^2+0.0001)$','Interpreter','latex','FontSize',22)
xlabel('x');
ylabel('y');
zlabel('f(x,y)')
annotation('textbox', [0.65, 0.85, 0.1, 0.1], 'String', "Dokładna całka =  " + dokladna)
annotation('textbox', [0.65, 0.75, 0.1, 0.1], 'String', "Przybliżona całka = " + wynik_trapezy)
annotation('textbox', [0.65, 0.7, 0.1, 0.1], 'String', "Błąd wzgledny= " + blad_wzgledny)
annotation('textbox', [0.65, 0.65, 0.1, 0.1], 'String', "Błąd bezwzgledny= " + blad_bezwzgledny)
grid on
% Główny skrypt

%{
temp = gallery('lehmer',n);
temp = gallery('minij',n)
A = inv(temp);

temp = full(gallery('tridiag',3,1,2,1));
A = temp;
temp = full(gallery('tridiag',50,9,20,9));
R = chol(temp);
%}
rng(0)
p = 3;
A_1 = full(gallery('tridiag',p,9,20,9));
A_2 = rand(p,p)*10;
A_3 = rand(p,p)*10;
A_4 = rand(p,p)*10;
A_5 = full(gallery('tridiag',p,9,20,9));

Z = zeros(p,p);
I = eye(p,p);

A = [A_1 Z Z;
     A_2 I Z;
     A_3 A_4 A_5];

x = zeros(1,3*p);

b = 1:3*p;

[L,U,P] = lu(A);
[L_my,U_my] = LU_decomposition(A);
%x(1:p) = solve_triangle(L,b(1:p),'lower');

U = [A_1 Z Z;
     Z I Z;
     Z Z A_5];
L_21 = A_2*inv(A_1);
L_31 = A_3*inv(A_1);
L = [I Z Z;
     L_21 I Z;
     L_31 A_4 I];

y = solve_triangle(L,b,'lower');
x = solve_triangle(U,y,'upper');

%x(p+1:2*p) = solve_triangle(I, b(p+1:2*p)'-A(p+1:2*p,1:p)*(x(1:p)'),'lower');

x_test = linsolve(A,b');

%{
blad1 = zeros(1,length(n));
blad2 = zeros(1,length(n));
blad3 = zeros(1,length(n));
blad4 = zeros(1,length(n));

p=1:50
for i = p
    lehmer = gallery('lehmer',i);
    A = inv(lehmer);
    A2 = full(gallery('tridiag',i,9,20,9));
    b = rand(i,1);
    
    %%% linsolve = LU + GEPP
    
    x = linsolve(A,b);
    blad1(1,i) = mean(abs(A*x-b));

    x = lehmer*b;
    blad2(1,i) = mean(abs(A*x-b));

    x = linsolve(A2,b);
    blad3(1,i) = mean(abs(A2*x-b));

    x = inv(A2)*b;
    blad4(1,i) = mean(abs(A2*x-b));
end

figure
plot(p,blad1,p,blad2)
title('Lehmer')
legend('linsolve','(no)inv')

figure
plot(p,blad3,p,blad4)
title('Basic triangular matrix')
legend('linsolve','inv')
%}


function [is_it] = check_sym_pos_def(A)
%Funkcja sprawdza czy dana macierz jest symetryczna i dodatnio określona

try chol(A);
    disp('Macierz jest symetryczna i dodatnio określona.')
    is_it = 1;
catch ME
    disp('Macierz NIE jest symetryczna i dodatnio określona.')
    is_it = 0;
end
end


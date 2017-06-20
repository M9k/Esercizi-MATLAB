function [x, fl] = triinf(L, b)
%TRIINF risolve il sistema lineare triangolare inferiore Lx=b
% con le sostituzioni in avanti.
%
% Uso:
% [x, fl] = triinf(L, b)
%
% Dati di ingresso:
% L : matrice quadrata triangolare inferiore
% b : vettore colonna termine noto
%
% Dati di uscita:
% x : vettore colonna soluzione del sistema (se fl=0)
% fl: indicatore che assume il valore 1 se L e' singolare,
% 0 altrimenti

% deve calcolare al suo interno la dimensione n del sistema
n = size(L,1);

% deve verificare che la matrice L sia quadrata (altrimenti si usi il comando error);
if size(L,1) ~= size(L,2)
    error('L non quadrata');
end
% deve verificare che la matrice L sia triangolare inferiore (altrimenti si usi il comando error);
if any(any(triu(L) - diag(diag(L))))
    error('L non è triangolare inferiore');
end
% deve verificare che la dimensione della matrice L e la lunghezza del vettore b siano uguali
if size(b,1) ~= size(L,1)
    error('b ha dimensioni errate');
end
% deve verificare che la matrice sia non singolare (altrimenti si pone fl uguale ad 1)
if prod(diag(L)) == 0
    % singolare
    fl = 1;
    x = [];
else
    % non singolare
    fl = 0;
    for i=1:n
        x(i) = b(i);
        for j=1:i-1
            x(i) = x(i) - L(i,j).*x(j);
        end
        x(i) = x(i)/L(i,i);
    end
    x = x';
end
end

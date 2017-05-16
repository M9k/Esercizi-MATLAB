function c = polnewton (x,y)
% POLNEWTON Calcola i coefficienti del polinomio interpolatore
% utilizzando la forma di Newton con le differenze divise
%
% Uso:
% c = polnewton (x,y)
%
% Dati di ingresso:
% x vettore dei nodi
% y vettore dei valori della funzione da interpolare nei nodi
%
% Dati di uscita:
% c vettore colonna dei coefficienti ordinati per indici
% crescenti (c_0, c_1, ... )

n = length(x); % lunghezza di x, y e c
c(1) = y(1); % primo elemento
disp(x);
for i = 2:n % completo c
    d = x(i) - x(i-1);
    u = c(i-1);
    for j = i-2:-1:1 % calcolo iterazioni precedenti
        u = u * (x(i) - x(j)) + c(j);
        d = d * (x(i) - x(j));
    end
    c(i) = (y(i) - u)/d;
end 

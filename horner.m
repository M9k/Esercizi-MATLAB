function fxstar = horner (x,c,xstar)
% HORNER Calcola il valore del polinomio interpolatore in x^*
% utilizzando la forma di Newton e l�algoritmo di Horner
%
% Uso:
% fxstar = horner (x,c,xstar)
%
% Dati di ingresso:
% x vettore dei nodi
% c vettore dei coefficienti della forma di Newton
% ordinati per indici crescenti (c_0, c_1, ... )
% xstar valore in cui si vuole valutare il polinomio
%
% Dati di uscita:
% fxstar valore di P(x^*)

n = length(x);
u = c(n);
for j = n-1:-1:1
    u = u .* (xstar - x(j)) + c(j);
end
fxstar = u;

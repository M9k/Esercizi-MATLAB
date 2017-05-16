function [xv, fxv, n, flag] = newtonfun (f, f1, x0, toll, nmax)
%NEWTONFUN Metodo di Newton
% Uso:
% [xv, fxv, n, flag] = newtonfun (f, f1, x0, toll, nmax)
%
% Dati di ingresso:
% f: funzione
% f1: derivata prima
% x0: valore iniziale
% toll: tolleranza richiesta per il valore assoluto
% della differenza di due iterate successive
% nmax: massimo numero di iterazioni permesse
%
% Dati di uscita:
% xv: vettore contenente le iterate
% fxv: vettore contenente i corrispondenti residui
% n: numero di iterazioni effettuate
% flag: Se flag = 1 la derivata prima si e� annullata

% DEBUG
% format long g
% [xv, fxv, n, flag] = newtonfun(inline('x^3-x+1'), inline('3*x^2-1'), -1, 1e-10, 20)

n = 1; % contatore di iterazioni
flag = 0; % flag derivata = 0
xv = [x0]; % array residui
fxv = [f(x0)]; % array 
step = toll+1; % distanza tra i risultati
while (step >= toll) && (n < nmax) && (flag == 0)
    if f1(xv(n)) == 0
        flag = 1;
    else
        step = -f(xv(n))/f1(xv(n));
        xv(n+1) = xv(n)+step;
        fxv(n+1) = f(xv(n+1));
        step = abs(step);
        n = n+1;
    end
end
end

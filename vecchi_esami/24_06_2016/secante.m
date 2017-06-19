function [xv, fxv, n] = secante (f, x0, x1, toll, nmax)
%SECANTE Metodo della secante per equazione non lineare
%
% [xv, fxv, n] = secante(f, x0, x1, toll, nmax)
%
% Dati di ingresso:
% f: funzione (inline function)
% x0: prima iterata iniziale
% x1: seconda iterata iniziale
% toll: tolleranza richiesta per il valore assoluto
% tra due iterate successive
% nmax: massimo numero di iterate permesse
%
% Dati di uscita:
% xv: vettore contenente le iterate
% fxv: vettore contenente i corrispondenti residui
% n: numero di iterate della successione

% non ci sono indicazioni di condizioni necessarie da controllare

% inizializzo i dati
xv = [x0, x1];
fxv = [f(x0) f(x1)];
n = 0;
while(toll < abs(xv(end) - xv(end-1)) && nmax > n)
    % calcolo l'iterata e il residuo
    x = xv(end) - fxv(end)*((xv(end) - xv(end-1))/(fxv(end)-fxv(end-1)));
    fx = f(x);
    
    % aggiungo le informazioni ai vettori
    xv = [xv x];
    fxv = [fxv fx];
    
    n = n+1;
end
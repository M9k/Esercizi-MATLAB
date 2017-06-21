function [xv, fxv, n] = schroder (f, f1, f2, x0, toll, nmax)
%SCHRODER Metodo di Schroder per equazione non lineare
%
% [xv, fxv, n] = schroder (f, f1, f2, x0, toll, nmax)
%
% Dati di ingresso:
% f: funzione (inline function)
% f1: funzione derivata prima (inline function)
% f2: funzione derivata seconda (inline function)
% x0: iterata iniziale
% toll: tolleranza richiesta per il valore assoluto
% tra due iterate successive
% nmax: massimo numero di iterate permesse
%
% Dati di uscita:
% xv: vettore colonna contenente le iterate
% fxv: vettore colonna contenente i corrispondenti residui
% n: numero di iterate della successione

xv = [x0];
fxv = [f(x0)];
n = 0;
newtoll = 1;
while n < nmax && newtoll > toll
    newx = xv(end) - (f(xv(end))*f1(xv(end)))/((f1(xv(end)))^2-(f(xv(end))*f2(xv(end))));
    xv = [xv newx];
    fxv = [fxv f(newx)];
    newtoll = abs(xv(end) - xv(end-1));
    n = n+1;
end

end


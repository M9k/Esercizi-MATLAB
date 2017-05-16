function [ xv, fxv, n ] = bisezfun(f, a, b, toll, nmax)
%DEBUG: [a , b, c ] = bisezfun(inline('sin(x)*x'), 2, 5, 1e-8, 100)

%BISEZFUN Metodo di Bisezione
%
% Uso:
% [xv, fxv, n] = bisezfun(f, a, b, toll, nmax)
%
% Dati di ingresso:
%   f:      funzione (inline function)
%   a:      estremo sinistro
%   b:      estremo destro
%   toll:   tolleranza richiesta per l'ampiezza
%           dell'intervallo
%   nmax:   massimo indice dell'iterata permesso
%
% Dati di uscita:
%   xv:     vettore contenente le iterate
%   fxv:    vettore contenente i corrispondenti residui
%   n:      indice dell'iterata finale calcolata


if f(a)*f(b)>0
    n = 0;
elseif f(a)*f(b) == 0
    % ho gia' la soluzione
    if f(a) == 0
        xv = [a];
        fxv = [0];
        n = 1;
    else
        xv = [b];
        fxv = [0];
        n = 1;
    end
else
    cont = 1;
    xv = [];
    fxv = [];
    n = 0;
    while abs(a-b) > toll && cont < nmax;
        c = (a+b)/2;
        xv = [xv c];
        fxv = [fxv f(c)];
        if f(a)*f(c) > 0
            a = c;
        else
            b = c;
        end
        cont = cont + 1;
    end
    n = cont;
end
disp('fine');
%fine
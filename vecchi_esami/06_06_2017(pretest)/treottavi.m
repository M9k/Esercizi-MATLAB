function [int, h] = treottavi(f, a, b, m)
% TREOTTAVI Metodo composto dei 3/8
%
% [int, h] = treottavi (f, a, b, m)
%
% Dati di ingresso:
%   f: funzione integrande
%   a: estremo sinistro
%   b: estremo destro
%   m: numero di sottointervalli
%
% Dati di uscita:
%   int: aprossimazione dell'integrale definito
%   h: passo di integrazione

int = f(a) + f(b);
h = (b-a)/m;
for i=1:m-1
    if mod(i, 3) == 0
        int = int + 2*f(a+i*h);
    else
        int = int + 3*f(a+i*h);
    end
end
int = int*3*h/8;


end


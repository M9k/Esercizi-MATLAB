function [xv, flag] = triinf(L, b)
%TRIINF Determina la soluzione di un sistema triangolare inferiore
%
% Uso:
% xv = triinf(L, b)
%
% Dati di ingresso:
% L: matrice triangolare inferiore quadrata
% b: vettore COLONNA termine noto
%
% Dati di uscita:
% xv: vettore COLONNA contenente la soluzione

n = size(b,1); % solo altezza
if prod(diag(L)) == 0
    flag = true;
    xv = [];
else
    flag = false;
    for i=1:n
        xv(i) = b(i,1);
        for j=1:i-1
            xv(i) = xv(i) - (L(i,j).*xv(j));
        end
        xv(i) = xv(i)./L(i,i);
    end
end

xv = xv';

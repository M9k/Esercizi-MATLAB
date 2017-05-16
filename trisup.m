function [xv, flag] = trisup(U, b)
%TRISUP Determina la soluzione di un sistema triangolare superiore
%
% Uso:
% xv = trisup(U, b)
%
% Dati di ingresso:
% U: matrice triangolare superiore quadrata
% b: vettore COLONNA termine noto
%
% Dati di uscita:
% xv: vettore COLONNA contenente la soluzione

n = size(b,1); % solo altezza
if prod(diag(U)) == 0
    flag = true;
    xv = [];
else
    flag = false;
    for i=n:-1:1
        xv(i) = b(i,1);
        for j=i+1:n
            xv(i) = xv(i) - (U(i,j).*xv(j));
        end
        xv(i) = xv(i)./U(i,i);
    end
end

xv = xv';


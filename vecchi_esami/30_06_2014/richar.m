function [xk, res, k] = richar (A, b, alfa, x0, toll, kmax)
% RICHAR Metodo iterativo di Richardson per sistema lineare Ax=b
%
% Uso:
% [xk, res, k] = richar (A, b, alfa, x0, toll, kmax)
%
% Dati di ingresso:
% A matrice
% b vettore termine noto
% alfa parametro del metodo di Rihardson
% x0 vettore iniziale
% toll tolleranza richiesta per il test di arresto
% kmax massimo numero di iterate
%
% Dati di uscita:
% xk vettore ultima iterata calcolata
% res vettore contenente le norme dei residui
% k numero di iterate

    k = 1;
    xk = x0;
    rk = +inf;
    res =  [norm(A*b-xk)];
    while k<kmax && toll<norm(rk)/norm(b)
        rk = b - A*xk;
        xk = xk + alfa*rk;
        res = [res, norm(rk)];
        k=k+1;
    end
    res = res';
end

% alfa ottimale = 0.25, maggiorazione = 0.4547575649
% per il grafico scelgo alpa = 0.3
% semilogy(0:n1,nres)
% title('residui con alpha=0.3')


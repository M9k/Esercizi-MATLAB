clear all;
f = inline('1./(1+x.^2)');

% decido i nodi da usare, equispaziati
if(true) %                                    <-- PER CAMBIARE NODI
    xn = linspace(-5,5,11);
else
% ALTERNATIVA - con n nodi di Chebyshev
    a = -5; %#ok<UNRCH>
    b = 5;
    n = 11;
    for i = 1:n;
        xn(i) = ((a+b)./2) + ((b-a)./2).*cos(pi.*(2.*i+1)/(2.*n+2));
    end
end

% genero la tabulazione
fxn = f(xn);
% genero i coefficenti
c = polnewton(xn,fxn);

% utilizzo honer per trovare le x nei 11 punti
% horner (xn, c, x*) con x* dove devo valutarlo
fxstar = horner (xn,c,xn);

% ricalcolo usando honer per piu' punti
xnhd = linspace(-5,5,201);
fxstarhd = horner(xn,c,xnhd);

%punti precisi per la funzione
fxnhd = f(xnhd);

% EXTRA uso comandi di matlab per avere lo stesso risultato
polyfitmat = polyfit(xn, fxn, length(fxn)-1);
polyvalmat = polyval(polyfitmat, xnhd);

% disegno
clf;
hold on;
plot(xnhd, fxnhd, 'b'); %funzione
scatter(xn, fxstar, 'ro'); %punti aprossimati
plot(xnhd, fxstarhd, 'r--'); %aprossimata hd
plot(xnhd, polyvalmat, 'k+:'); %aprossimata da matlab
title('Interpolazione polinomiale');
text(2.8,-0.4,'Cailotto Mirco');
hold off;
clear all;

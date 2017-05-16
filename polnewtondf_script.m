clear all;
f = inline('1./(1+x.^2)');

% decido i nodi da usare, equispaziati
if(true) %                                    <-- PER CAMBIARE NODI
    xn = linspace(-5,5,11);
else
% ALTERNATIVA - con n nodi di Chebyshev
    a = -5;
    b = 5;
    n = 11;
    xn = ((a+b)./2) + ((b-a)./2).*cos(pi.*(2.*(1:n)+1)/(2.*n+2));
end

% genero la tabulazione
fxn = f(xn);
% genero i coefficenti
c = polnewtondf(xn,fxn);

% utilizzo honer per trovare le x nei 11 punti
% horner (xn, c, x*) con x* dove devo valutarlo
fxstar = horner (xn,c,xn);

% ricalcolo usando honer per piu' punti
xnhd = linspace(-5,5,201);
fxstarhd = horner(xn,c,xnhd);

%punti precisi per la funzione
fxnhd = f(xnhd);

% EXTRA uso comandi di matlab per avere lo stesso risultato
%polyfitmat = polyfit(xn, fxn, length(fxn)-1);
%polyvalmat = polyval(polyfitmat, xnhd);

% disegno
clf();
subplot(3,1,1); %figure(1);
hold on;
title('Interp. polinomiale Newton diff. finite in avanti');
plot(xnhd, fxnhd, 'k'); %funzione
scatter(xn, fxstar, 'bo'); %punti aprossimati
plot(xnhd, fxstarhd, 'b--'); %aprossimata hd
text(3.2,-0.4,'Cailotto Mirco');
hold off;
subplot(3,1,2); %figure(2);
hold on;
title('Funzione errore');
plot(xnhd, xnhd.*0);
plot(xnhd, fxnhd - fxstarhd,'r');
hold off;
subplot(3,1,3); %figure(3);
hold on;
title('Funzione errore secondo MATLAB');
plot(xnhd, xnhd.*0, 'Color',[0.1 0.1 0.1]);
plot(xnhd, f(xnhd)-polyval(polyfit(xn, fxn, 10), xnhd), 'Color',[rand() rand() rand()]); %aprossimata da matlab
hold off;

clear all;

%-------------------------------------------
% si richiede a, b, la funzione e la tolleranza
% epsilon, se f(a)*f(b)<0 si applica la bisezione
% secondo il teorema degli zeri di Bolzano per
% trovare l'intervallo di una radice
%
% si suppone f:[a,b] --> R continua
%-------------------------------------------

clear all;
%chiedo i dati
a = input('inserisci il punto a: ');
b = input('inserisci il punto b: ');
strf = input('inserisci la funzione: ','s');
f = inline(strf);
epsilon = input('inserisci la tolleranza: ');
nmax = input('inserisci il numero massime di iterazioni: ');

%lancio bisezione
[xv, fxv, n] = bisezfun(f, a, b, epsilon, nmax);

%disp ultima soluzione, residuo e l'indice
disp( ['Radice: '  num2str(xv(end)) ' Residuo: ' num2str(fxv(end)) ' trovata dopo ' num2str(n) ' iterazioni.' ] );
%stampa il grafico del valore assoluto di fxv, y scala logaritmica
clf;
hold on;
x = 0:n-1;
plot(x, abs(fxv), 'r');
y = x.*0;
plot(x, y, 'b');
set(gca,'yscale','log');

hold off;
%clear all;
%fine
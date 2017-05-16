clear all;
% chiedo i dati
%exprf = input('inserisci la funzione: ','s');
%f = inline(exprf);
f = inline('x.^2-1+exp(-x)');

% grafico extra
x = -1:0.1:1;
y = f(x);
clf;
hold on;
plot(x,y, 'b');
y = 0.*x;
plot(x,y, 'r');
hold off;

%exprf1 = input('inserisci la derivata: ','s');
%f1 = inline(exprf1);
f1 = inline('2*x - exp(-x)');
x0 = input('inserisci il punto x0: ');
toll = input('inserisci la tolleranza: ');
nmax = input('inserisci il numero massime di iterazioni: ');

% lancio newton
[xv, fxv, n, flag] = newtonfun(f, f1, x0, toll, nmax);

if flag || n == nmax
    disp('la derivata ha assunto valore zero, impossibile continuare.');
else
    % disp ultima soluzione, residuo e l'indice
    disp( ['Radice: '  num2str(xv(end)) ' Residuo: ' num2str(fxv(end)) ' trovata dopo ' num2str(n) ' iterazioni.' ] );
    format long g;
    % stampa il grafico del valore assoluto di fxv, y scala logaritmica
    clf;
    hold on;
    x = 0:n-1;
    plot(x, abs(fxv), 'r');
    y = x.*0;
    plot(x, y, 'b');
    set(gca,'yscale','log');
    hold off;
end
clear all;
% fine

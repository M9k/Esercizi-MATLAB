clear all;
f = inline('x.^6-x-1');
% prima parte
% p(x) = x^6 - x - 1 = 0
% n = numero cambi di segno = 1
%  le soluzioni k sono 0 o 1, n-k pari, quindi esiste una unica soluzione
%  positiva

% seconda parte 
% |x*| <= 1 + 1  ->  |x*| <= 2
% quindi -2 <= |x*| <= 2
% quindi 0 <= x* <= 2 se cerco la soluzione positiva
 
% terza parte  - togliere i commenti per generare l'immagine richiesta
% figure(1);
% clf;
% hold on;
% plot(0.5:0.1:1.5, f(0.5:0.1:1.5), 'k');
% plot(0.5:0.1:1.5, 0.*(0.5:0.1:1.5), 'r');
% hold off;
% la radice si trova tra 1.1 e 1.2

% eseguo la funzione
[xv, fxv, n] = secante(f, 1.1, 1.2, 10e-8, 100);

% stampo i risultati su tabella.txt
f = fopen('tabella.txt','w+');
fprintf(f,'iterata\t\tvalore\t\t\tresiduo\n');
% stampo i primi due valori, che non fanno parte delle iterate
for i=0:n
    fprintf(f,'%d\t\t\t%.10f\t%.15f\n',i,xv(i+1),fxv(i+1));
end
    
fclose(f);

figure(1);
clf;
% NIENTE hold on o la scala si fissa su lineare e non logaritmica!
semilogy(0:size(fxv,2)-1, abs(fxv), 'k');
title('Residui in valore assoluto');
xlabel('Iterata');
ylabel('Residuo');
text(4.8,0.2,'Cailotto Mirco');






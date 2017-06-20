clear all;

f = inline('1-x-exp(-2*x)');

% figure(1);
% clf;
% hold on;
% i = 0:0.1:1;
% plot(i, i.*0, 'r');
% plot(i, f(i), 'k');
% hold off;

% intervallo con la soluzione -> [0.7, 0.9]

[xv, fxv, n] = metodo(f, 0.7, 0.9, 1e-15, 15);

f = fopen('tabella.txt','w+');
fprintf(f,'n:\tx:\t\t\t\t\tresiduo:\n');
for i=0:n
    fprintf(f,'%d\t%.16f\t%.10e\n',i, xv(i+1), fxv(i+1));
end
fclose(f);


figure(1);
clf;
semilogy(0:n, abs(fxv(2:n+2)), 'k*-');
title('Residui in valore assoluto');
xlabel('iterata');
ylabel('residuo');
text(4,10e-2,'Cailotto Mirco');

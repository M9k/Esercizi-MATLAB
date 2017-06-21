% 
f = inline('(x.^3)-(1.4.*x.^2)-(0.96.*x)+1.44');
f1 = inline('(3.*x.^2)-(2.8.*x)-0.96');
f2 = inline('(6.*x)-2.8');

% figure(1);
% clf;
% hold on;
% i = 1:0.01:1.4;
% plot(i,f(i),'k');
% plot(i,i.*0,'r');
% hold off;

% la soluzione è in [1.15, 1.25]
% la soluzione è anche in [1.0, 1.5]
% parto comunque da 1.5 per avere qualche risultato in più per creare il
% grafo, se parto troppo vicino ho poche iterate e il grafico non esce
% molto indicativo

[xv, fxv, n] = schroder(f, f1, f2, 1.5, 1e-16, 25);

file = fopen('tabella.txt','w+');
fprintf('n\tx\t\t\t\t\tresiduo\n');
fprintf(file,'n\tx\t\t\t\t\tresiduo\n');
for i=0:n
    fprintf('%d\t%.16f\t%.10e\n',i, xv(i+1),fxv(i+1));
    fprintf(file,'%d\t%.16f\t%.10e\n',i, xv(i+1),fxv(i+1));
end
fclose(file);

figure(1);
clf;
semilogy(0:n, abs(fxv));

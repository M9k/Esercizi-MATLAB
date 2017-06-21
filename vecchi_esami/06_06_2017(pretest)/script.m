clear all;

f = inline('sin(x.^2)');

intvec = [];
i=0;
while i<2 || abs(intvec(end) - intvec(end-1)) > 10e-15
    [int, h] = treottavi(f, 0, pi/4, 3*2^i);
    intvec = [intvec, int];
    i = i+1;
end

% calcolo la soluzione esatta di riferimento
q = quadl(f, 0, pi/4, 1e-15);

% stampo a video e su file
file = fopen('tabella.txt','w+');
fprintf('iterata\tintegrale\t\t\terrore assoluto\n');
fprintf(file,'iterata\tintegrale\t\t\terrore assoluto\n');
for k=1:i
    fprintf('%d\t\t%.16f\t%.1e\n',k, intvec(k), abs(intvec(k)-q));
    fprintf(file,'%d\t\t%.16f\t%.1e\n',k, intvec(k), abs(intvec(k)-q));
end

fclose(file);

%disegno il grafico
figure(1);
clf;
semilogy(1:i, abs(intvec-q),'r*-');


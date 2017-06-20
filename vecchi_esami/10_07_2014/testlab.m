%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ATTENZIONE!!!!! NON MODIFICARE NULLA DI QUESTO SCRIPT
%====================================================================
% Script per il Metodo di Cavalieri Simpson
% Necessita della Function simpson.m
%====================================================================
clear all
file = fopen('tabella.txt','w');
disp('=======================================================')
fun = 'sin(x)';
f = inline(fun);
a = 0;
b = pi;
sol = 2;
fprintf('Funzione integranda = %s \n', fun);
fprintf(file,'Funzione integranda = %s \n', fun);
fprintf('Intervallo di integrazione = [ %d , %18.16f ] \n', a,b);
fprintf(file,'Intervallo di integrazione = [ %d , %18.16f ] \n', a,b);
fprintf('Soluzione esatta = %3.0f \n\n',sol);
fprintf(file,'Soluzione esatta = %3.0f \n\n',sol);
% Parte esecutiva
fprintf('%s \t %s \t\t %s \n\n',' m',' Integrale',' Errore');
fprintf(file, ...
'%s \t %s \t\t %s \n\n',' m',' Integrale',' Errore');
n = 1;
for m = 2:2:40
    OUT(n,1) = m;
    In(n) = simpson(f,a,b,m);
    err(n) = abs(In(n)-sol);
    fprintf('%4.0f %19.16f %11.4e \n',[m,In(n),err(n)]);
    fprintf(file,'%4.0f %19.16f %11.4e \n',[m,In(n),err(n)]);
    n = n+1;
end
OUT(:,2) = In(:);
OUT(:,3) = err(:);
function [int,h] = simpson (f,a,b,m)
%TRAPEZI Metodo Cavalieri-Simpson
% [int,h] = simpson (f,a,b,m);
%
% Dati di ingresso:
% f: funzione integranda
% a: estremo sinistro dell’intervallo di integrazione
% b: estremo destro dell’intervallo di integrazione
% m: numero di sottointervalli
%
% Dati di uscita:
% int: approssimazione dell’integrale definito
% h: passo di integrazione

h=(b-a)/m;
int=f(a)+f(b);
for i=1:2:m-1
    x=a+i*h;
    int=int+4*f(x);
end
for i=2:2:m-2
    x=a+i*h;
    int=int+2*f(x);
end
int=h*int/3;

end
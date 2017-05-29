function [int,h] = trapezi (f,a,b,m)
%TRAPEZI Metodo dei Trapezi composto
% [int,h] = trapezi (f,a,b,m);
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
for i=1:m-1
    x=a+i*h;
    int=int+2*f(x);
end
int=h*int/2;

end
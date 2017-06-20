function I = simpson (f, a, b, m)
%SIMPSON Formula di Simpson composta per il calcolo di integrali definiti
%
% Uso:
% I = simpson (f, a, b, m)
%
% Dati di ingresso:
% f funzione da integrare (inline function)
% a, b estremi di integrazione
% m numero di sottointervalli
%
% Dati di uscita:
% I integrale approssimato

    if mod(m,2) == 1
        I = NaN;
        error('m è dispari, impossibile continuare\n');
    end
    
    h = (b-a)/m;
    I = f(a) + f(b);
    for i=1:2:m-1
        x = a+i*h;
        I = I + 4*f(x);
    end
    for i=2:2:m-2
        x = a+i*h;
        I = I + 2*f(x);
    end
    I = h*I/3;

end


% semilogy(getcolumn(OUT,1),getcolumn(OUT,3))

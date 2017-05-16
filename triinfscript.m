clear all;

L = [3.5  , 0   , 0;
     4.04 , 26.4, 0;
     6.08 , 37.8, 100.6];
b = [2.46; 11.55; 31.1];

if (any(any(L - tril(L))) == 0) && (size(L,1) == size(L,2)) && (size(L,1) == size(b,1))
    disp('matrice diagonale inferiore');
    
    n = size(b,1);
    disp(['dimensione: ', num2str(n)]);

    [xv, flag] = triinf(L, b);

    disp('Matrice L:');
    disp(L);
    disp('Vettore b:');
    disp(b);
    disp('Soluzione:');
    disp(xv);
else
    disp('matrice non valida');
end

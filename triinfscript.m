clear all;

L = [3.5 , 0   , 0;
     4.04 , 26.4, 0;
     6.08 , 37.8, 100.6];
b = [2.46; 11.55; 31.1];

n = size(b,1);
disp(['dimensione: ', num2str(n)]);

if all(all(L - tril(L))) == 0
    disp('matrice diagonale inferiore');
else
    disp('matrice non valida');
end

[xv, flag] = triinf(L, b);

disp('Matrice L:');
disp(L);
disp('Vettore b:');
disp(b);
disp('Soluzione:');
disp(xv);
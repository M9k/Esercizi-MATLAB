clear all;

U = [1.75, 2.02, 3.04;
     0   , 13.2, 18.9;
     0   , 0   , 50.3];
b = [4.92; 23.1; 62.2];

if any(any(U - triu(U))) == 0 && (size(U,1) == size(U,2)) && (size(U,1) == size(b,1))
    disp('matrice diagonale superiore');
    
    n = size(b,1);
    disp(['dimensione: ', num2str(n)]);

    [xv, flag] = trisup(U, b);

    disp('Matrice U:');
    disp(U);
    disp('Vettore b:');
    disp(b);
    disp('Soluzione:');
    disp(xv);
else
    disp('matrice non valida');
end

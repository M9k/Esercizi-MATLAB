clear all;

% inizializzo i dati di input
A = [ 2  4  6  ;
      2  7  0  ;
     -3 -4 -12 ];
B = [12 9 19]';

if size(A,1) == size(A,2) && size(A,1) == size(B,1) && A(1,1) ~= 0
    % chiamo la funzione
    [L, U] = luGC(A, size(A,1));

    % calcolo x e xx
    y = L\B;
    x = U\y;
    xx = A\B;
    test = L*U;
    
    % stampo
    f = fopen('risultati.txt','w+');
    fprintf(f,'Matrice A:\n%s\n',mat2str(A));
    fprintf(f,'Vettore B:\n%s\n',mat2str(B));
    fprintf(f,'Termine noto:\n%d\n',A(1,1));
    fprintf(f,'Matrice L:\n%s\n',mat2str(L));
    fprintf(f,'Matrice U:\n%s\n',mat2str(U));
    fprintf(f,'Matrice LxU:\n%s\n',mat2str(test));
    fprintf(f,'Soluzione:\n%s\n',mat2str(x));
    fprintf(f,'Soluzione fornita da matlab:\n%s\n',mat2str(xx));
    normadiff = norm(x-xx);
    fprintf(f,'Norma della differenza dei due vettori:\n%d\n',normadiff);
    
    fclose(f);
    
else
    % messaggio di errore
    fprintf('Impossibile eseguire la fattorizzazione'\n);
end
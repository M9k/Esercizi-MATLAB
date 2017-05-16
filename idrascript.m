clear all;
% esercizio 2 di labor7.pdf

A = [ -0.370  0.050  0.050  0.070;
       0.050 -0.116      0  0.050;
       0.050      0 -0.116  0.050;
       0.070  0.050  0.050 -0.202
    ];
b = [ -2; 0; 0; 0];

disp('A:');
disp(A);
disp('b:');
disp(b);
disp('Dimensione:');
disp(size(A,1));

[L,U,P]=lu(A);
% P*A = L*U
% A*x=b
% L*U*x=P*b
% SISTEMA:  U*x=y
%           L*y=P*b

%trovo y
[y, flag] = triinf(L, P*b);
%trovo x
[x, flag] = trisup(U, y);
disp('Soluzione secondo le mie funzioni:');
disp(x);

%ricalcolo usando la funzione matlab
pMat = A\b;
disp('Soluzione secondo matlab:');
disp(pMat);

disp('Errore secondo la mia soluzione');
disp(norm(A*x-b));
disp('Errore secondo la soluzione matlab');
disp(norm(A*pMat-b));

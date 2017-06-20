clear
format short
% Soluzione
sol = [1, 2, 3, 2, 1]';
% definizione del sistema lineare Lx = b
% con L triangolare inferiore
% matrice L
L = [0.54 0 0 0 0
1.01 0.93 0 0 0
0.36 1.02 1.23 0 0
1.10 1.78 0.13 1.01 0
1.56 1.02 1.05 0.34 1.89]
% termine noto b
b = [0.54 2.87 6.09 7.07 9.32]'
% Risolve il sistema
[x, fl] = triinf(L,b);
if fl ~= 0
error('La matrice e'' singolare')
end
format long
% presentazione dei risultati
disp(['Vettore soluzione: x = '])
disp(['[',num2str(x', '\n%20.15e'), ']'])
disp(' ')
disp(['Norma Euclidea del residuo: ||b-Lx|| = ', num2str(norm(b-L*x))])
disp(['Norma Euclidea dell’’errore: ||x-sol|| = ', num2str(norm(x-sol))])
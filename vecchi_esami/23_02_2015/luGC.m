function [L, U] = luGC(A, n)
% LUGC Fattorizzazione di Gauss Crout
%
% [L, U] = luGC(A, n)
%
% Dati di ingresso:
%   A:  matrice quadrata
%   n:  dimensione della matrice
% 
% Dati di uscita:
%   L:  matrice triangolare inferiore
%   U:  matrice triangolare superoiore a diagonale unitaria

for i = 1:n
    L(i,1) = A(i,1);
    U(1,i) = A(1,i)/L(1,1);
end

for j=2:n
   L(1,j) = 0;
   U(j,1) = 0;
   U(j,j) = 1;
   for i=j:n
       L(j,i) = 0;
       L(i,j) = A(i,j);
       for k=1:j-1
           L(i,j) = L(i,j) - L(i,k)*U(k,j);
       end
   end
   
   for i=j+1:n
       U(i,j) = 0;
       U(j,i) = A(j,i);
       for k=1:j-1
           U(j,i) = U(j,i)-L(j,k)*U(k,i);
       end
       U(j,i) = U(j,i)/L(j,j);
   end
   
end
end


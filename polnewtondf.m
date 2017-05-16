function c = polnewtondf (x,y)
% POLNEWTONDF Calcola i coefficienti del polinomio interpolatore
% utilizzando la forma di Newton con le differenze finite
% Uso:
% c = polnewtondf (x,y)
%
% Dati di ingresso:
% x vettore dei nodi
% y vettore dei valori della funzione da interpolare nei nodi
%
% Dati di uscita:
% c vettore colonna dei coefficienti ordinati per indici
% crescenti (c_0, c_1, ... )
h = x(2)-x(1);
n = length(x);
if any(diff(x)-h) | (size(x) ~= size(y)) | (~isequal(sort(x),x))
    error('Input errato!');
else
    
    % FORMULA DI NEWTON ADATTATA A PUNTI EQUISPAZIATI
%     d=1;
%     c(1) = y(1);
%     for i = 2:n % completo c
%         u = c(i-1);
%         for j = i-2:-1:1 % calcolo iterazioni precedenti
%             u = u * (x(i) - x(j)) + c(j);
%         end
%         c(i) = (y(i) - u)/d;
%         d=d*h*i;
%     end 
    
    % DIFFERENZE DIVISE IN AVANTI
    differenze = y;
    delta = [];
    for i=1:n
        delta = [delta differenze(1)];
        differenze = diff(differenze);
    end
    c = delta./(factorial((1:n)-1).*h.^((1:n)-1));
    
end


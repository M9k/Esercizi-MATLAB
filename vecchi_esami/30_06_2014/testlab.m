%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ATTENZIONE!!!!! NON MODIFICARE NULLA DI QUESTO SCRIPT
%====================================================================
% Script per il Metodo iterativo di Richardson
% Necessita della Function richar.m
%====================================================================
clear
% Definizione dati
n = 30;
A = diag(4*ones(n,1)) + diag(-0.2*ones(n-1,1),1) + diag(-0.2*ones(n-1,1),-1);
sol = ones(n,1);
b = A*sol;
% parametri di controllo del metodo iterativo
toll = 1.e-10; % tolleranza sul residuo
kmax = 100; % numero massimo di iterazioni
x0 = zeros(size(A,1),1); % vettore iniziale
% Parte esecutiva
% Stima del parametro ottimale e dell'intervallo
lmin = eigs(A,1,'sm');
lmax = eigs(A,1,'lm');
alfaopt = 2/(lmin+lmax);
alfamax = 2/lmax;
% Visualizzazione valori
fprintf('\n\n Maggiorazione per alfa %20.10g \n',alfamax);
fprintf(' alfa ottimale %20.10g \n\n',alfaopt);
% Inserimento valore alfa
alfa = input (' Inserisci il valore di alfa desiderato: ');
if abs(alfa - alfaopt)<eps
    error('Il valore di alfa non deve essere uguale ad alfa ottimale')
end
% chiede l'esecuzione della function che implementa il metodo iterativo
[xk, nres, k] = richar(A, b, alfa, x0, toll, kmax);
% Visualizza la tabella dei risultati
nres=nres(:);
n1=k-1;
fprintf('\n Metodo di Richardson per la risoluzione del sistema lineare Ax=b');
fprintf('\n\n test arresto toll*norm(b) = %g \n Numero massimo iterate nmax = %g \n', toll*norm(b),kmax);
fprintf(' alfa = %g \n\n', alfa);
fprintf(' Norme dei residui');
fprintf('\nk \t || r_k ||\n\n');
fprintf('%d\t %10.4e\n',[0:n1;nres']);
fprintf('\n Numero di iterate n = %g \n', k);
if k == kmax
    fprintf('\n Massimo numero di iterate raggiunto \n');
end
% Scrive su file la tabella dei risultati
file1= fopen('tabella.txt','w');
fprintf(file1, '\n Metodo di Richardson per la risoluzione del sistema lineare Ax=b');
fprintf(file1, '\n\n test arresto toll*norm(b) = %g \n Numero massimo iterate nmax = %g \n', toll*norm(b),kmax);
fprintf(file1, ' alfa = %g \n\n', alfa);
fprintf(file1, 'Norme dei residui');
fprintf(file1, '\nk \t || r_k ||\n\n');
fprintf(file1, '%d\t %10.4e\n',[0:n1;nres']);
fprintf(file1, '\n Numero di iterate n = %g \n',k);
if k == kmax
fprintf(file1, '\n Massimo numero di iterate raggiunto \n');
end
fclose(file1);
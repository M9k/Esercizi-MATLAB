clear all;
sudd = 3;
toll = 1e-8;
diff = inf;
prec = 0;
cont = 1;
file = fopen('tabella.txt','w+');
risultati = [];
errori = [];
fprintf(file,'┌───────────┬──────────────────────┬───────────────┬─────────────────────────────┐\n');
fprintf(file,'│ iterata:  │       valore:        │  intervallo:  │ differenza dal precedente:  │\n');
fprintf(file,'├───────────┼──────────────────────┼───────────────┼─────────────────────────────┤\n');

while (diff > toll || cont<2)
    [int, h] = simpson(@(x) sin(x.^2), 0, pi/4, sudd*2^(cont-1));
    diff = abs(int-prec);
    %disp(['passaggio numero: ', num2str(cont), ' valore:', num2str(int,'%.20f'), ' intervallo:', num2str(h), ' differenza dal precendete ' num2str(diff)]);

    fprintf('passaggio numero: %d valore: %.15d intervallo: %d differenza dal precendete %.15d \n', cont, int, h, diff);
    fprintf(file,'│\t%d\t\t│%.15d │ %d  │    %.15d    │\n', cont, int, h, diff);
    risultati = [risultati int];
    errori = [errori diff];
    
    prec = int;
    cont = cont+1;
end
fprintf(file,'└───────────┴──────────────────────┴───────────────┴─────────────────────────────┘\n');

fclose(file);

sol = quadl(@(x) sin(x.^2), 0, pi/4, 1e-8);
figure(1);
clf;
hold on;
plot(1:size(risultati,2), risultati, 'b');
plot([0,size(risultati,2)],[sol,sol],'k');
title('Risultati calcolati');
hold off;
figure(2);
clf;
semilogy(1:size(errori,2), errori, 'r');
title('Errori');

disp(['soluzione esatta:', num2str(sol,'%.20f')]);
% lo script richiede tre valori, a, b e c, che sono i coefficenti della
% equazione ax^2+bx+c
% come output viene stampato a video le possibili soluzioni ricavate con un
% algoritmo stabile e uno instabile e il relativo errore assoluto

clear all;
% mai si sa
format short e;

a = input('inserisci a:');
b = input('inserisci b:');
c = input('inserisci c:');
if a==0 || b==0 || c==0
    if a==0
        disp('a uguale a zero');
        % bx+c = 0
        if(b~=0)
            x = -c/b;
            disp(['x1 e x2: ', num2str(x,'%e')]);
        else
            disp('non risolvibile');
        end
    elseif b==0
        disp('b uguale a zero');
        % ax^2+c = 0, a diverso da 0, c possibile sia 0
        if -c/a >= 0
            x = sqrt(-c/a);
            if(x~=0)
                disp(['x1: -',  num2str(x,'%e'), 'x2: ', num2str(x,'%e')]);
            else
                disp(['x1: ',  num2str(x,'%e'), 'x2: ', num2str(x,'%e')]);
            end
        else
            disp('non risolvibile');
        end
    else % sottointeso c==0
        disp('c uguale a zero');
        % ax^2+bx = 0, a e b diversi da 0
        x = -b/a;
        disp(['x1: 0 x2: ', num2str(x,'%e')]);
    end
else
    % procedo con il calcolo
    % stampo i valori
    disp(['a:', num2str(a,'%e'), ' b:', num2str(b,'%e'), ' c:', num2str(c,'%e')]);
    dscr = (b*b) - (4*a*c);
    disp(['discriminante: ', num2str(dscr,'%e')]);
    if dscr<0
        disp('discriminante negativo, impossibile proseguire');
    else
        % procedo con il calcolo
        ix1 = (-b + sqrt(dscr)) / (2*a);
        ix2 = (-b - sqrt(dscr)) / (2*a);
        sx1 = (-b -sign(b)*sqrt(dscr)) / (2*a);
        sx2 = c / (a*sx1);
        
        % se sono invertiti li scambio
        if sign(ix1-ix2) ~= sign(sx1-sx2) 
            t = sx1;
            sx1 = sx2;
            sx2 = t;
        end
        
        disp('algoritmo instabile:');
        disp(['x1:', num2str(ix1,'%e'), ' x2:', num2str(ix2,'%e')]);
        disp('algoritmo stabile:');
        disp(['x1:', num2str(sx1,'%e'), ' x2:', num2str(sx2,'%e')]);

        disp('errori relativi:');
        erx1 = abs(sx1-ix1)/abs(sx1);
        erx2 = abs(sx2-ix2)/abs(sx2);
        disp(['er x1: ', num2str(erx1,'%e'), ' er x2: ', num2str(erx2,'%e')]);

    end
end

clear all;
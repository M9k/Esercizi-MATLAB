
%T = input('inserisci T: '); %in Kelvin
T = 300;
%p = input('inserisci p: ');
p = 3.5e7;
%nmol = input('inserisci N nmol: ');
nmol = 1000;
%alpha = input('inserisci alpha: ');
alpha = 0.401;
%beta = input('inserisci beta: ');
beta = 42.7e-6;
k = 1.3806503e-23;

exprf = ['(',num2str(p),'+',num2str(alpha),'.*((',num2str(nmol),...
    './x).^2)).*(x-',num2str(nmol),'*',num2str(beta),')-(',...
    num2str(k,'%15.8e'),'*',num2str(nmol),'*',num2str(T),')'];
f = inline(exprf);

x = 0.01:0.01:0.2;
y = f(x);
clf;
hold on;
plot(x,y);
plot(x, y.*0, 'r');
hold off;

%a = input('inserisci il punto iniziale dell-intervallo: ');
a = 0.02;
b = a+0.06;
%toll = input('inserisci la tolleranza: ');
toll = 1e-10;
nmax = input('inserisci il numero massime di iterazioni: ');

[ xv, fxv, n ] = bisezfun(f, a, b, toll, nmax);

if n==nmax
    disp('raggiunto il numero massimo di iterazioni permesse.');
else
    disp(['T: ', num2str(T)]);
    disp(['p: ', num2str(p)]);
    disp(['N: ', num2str(nmol)]);
    disp(['alpha: ', num2str(alpha)]);
    disp(['beta: ', num2str(beta)]);
    disp(['soluzione: ', num2str(xv(end))]);
    disp(['tolleranza: ', num2str(toll)]);
    disp(['iterazioni: ', num2str(n)]);
    disp(['intervallo: ', num2str(a), ' - ', num2str(b)]);
end

clear all;

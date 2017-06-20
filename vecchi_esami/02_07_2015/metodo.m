function [xv, fxv, n] = metodo(f, x0, x1, toll, nmax)

n = 0;
xv = [x0, x1];
fxv = [f(x0), f(x1)];

while toll < abs(xv(end)-xv(end-1)) && n < nmax
    newx = xv(end) - fxv(end)*((xv(2)-xv(1))/(fxv(2)-fxv(1)));
    xv = [xv newx];
    fxv = [fxv f(newx)];
    n = n+1;
end
end


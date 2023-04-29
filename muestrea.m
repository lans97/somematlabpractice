function vs = muestrea(v, fs, inter)
linf = inter(1);
lsup = inter(2);
deltat = lsup - linf;
nmuestras = fs*deltat;
indices = floor(linspace(0, size(v, 2), nmuestras))+1;
indices(end) = [];
vs = v(indices);
end
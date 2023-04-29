function ys = decodifica(vco, fs, n)

ys = reshape(vco, n, [])';
ys= bin2dec(ys);

niveles = 2^n;
nv = linspace(-1, 1, niveles+1);
nv = (nv + (nv(2) - nv(1))/2);
nv(end) = [];

ys = nv(ys+1);

end
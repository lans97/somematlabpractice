function vcu = cuantiza(vs, n)

niveles = 2^n;
nv = linspace(-1, 1, niveles+1);
nv = (nv + (nv(2) - nv(1))/2);
nv(end) = [];

vcu = zeros(size(vs));

for i = 1:size(vs, 2)
    [val, ind] = min(abs(nv - vs(i)));
    vcu(i) = nv(ind);
end


end
function vco = codifica(vcu)

valores = unique(vcu);

vco = zeros(size(vcu));

for i = 1:size(vcu, 2)
    vco(i) = find(vcu(i) == valores) - 1;
end

vco = dec2bin(vco);
vco = reshape(vco.', [], 1)';

end
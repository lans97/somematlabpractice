function vs = pam(t, v, fs, d)
s = (square(2*pi*fs*t, d*100) + 1)/2;
vs = v .* s;
end
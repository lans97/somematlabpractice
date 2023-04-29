function y = filtra(ys, fs)

[B, A] = butter(6, 0.08);
y = filter(B, A, ys);

end
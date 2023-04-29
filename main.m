fsv = 100000/0.5;

t = linspace(0, 0.5, 10000);
v = sin(5*2*pi*t);

fs = 60; % frecuencia de muestreo PAM

vs50 = pam(t, v, fs, 0.5);
vs40 = pam(t, v, fs, 0.4);
vs30 = pam(t, v, fs, 0.3);
vs20 = pam(t, v, fs, 0.2);
vs10 = pam(t, v, fs, 0.1);
vs5 = pam(t, v, fs, 0.05);

f = linspace(-10, 10, 10000);

fo = fftshift(fft(v));
figure()
plot(f, abs(fo))

f50 = fftshift(fft(vs50));
f40 = fftshift(fft(vs40));
f30 = fftshift(fft(vs30));
f20 = fftshift(fft(vs20));
f10 = fftshift(fft(vs10));
f5 = fftshift(fft(vs5));

figure()
subplot(2, 3, 1)
plot(f, abs(f50))
subplot(2, 3, 2)
plot(f, abs(f40))
subplot(2, 3, 3)
plot(f, abs(f30))
subplot(2, 3, 4)
plot(f, abs(f20))
subplot(2, 3, 5)
plot(f, abs(f10))
subplot(2, 3, 6)
plot(f, abs(f5))

% Para el filtro, es necesario normalizar sobre la frecuencia del vectro,
% no sobre la frecuencia de muestreo PAM

fn = fsv/2; % nyquist v
fc = fs; % La mitad de la frecuencia de muestreo PAM debe ser el punto medio entre cada réplica
fcn = fc/fn; % corte normalizada

[B, A] = butter(6, 0.0016);
figure()
subplot(2, 3, 1)
hold on
plot(t, v)
plot(t, filter(B, A, vs50))
subplot(2, 3, 2)
hold on
plot(t, v)
plot(t, filter(B, A, vs40))
subplot(2, 3, 3)
hold on
plot(t, v)
plot(t, filter(B, A, vs30))
subplot(2, 3, 4)
hold on
plot(t, v)
plot(t, filter(B, A, vs20))
subplot(2, 3, 5)
hold on
plot(t, v)
plot(t, filter(B, A, vs10))
subplot(2, 3, 6)
hold on
plot(t, v)
plot(t, filter(B, A, vs5))
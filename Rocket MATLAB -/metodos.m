% Parámetros
Fs = 10000;             % Frecuencia de muestreo (Hz)
T = 1/Fs;              % Periodo de muestreo
L = 1000;              % Longitud de la señal
t = (0:L-1)*T;         % Vector de tiempo

% Número de armónicos (coeficientes de la serie de Fourier)
num_arm = 20;

% Coeficientes de la serie de Fourier para la onda diente de sierra
a0 = 0;
ak = zeros(1, num_arm);
bk = zeros(1, num_arm);
for k = 1:num_arm
    ak(k) = 0;
    bk(k) = (2*(-1)^k)/(pi*k);
end

% Calcular la serie de Fourier
x_fourier = a0 * ones(size(t));
for k = 1:num_arm
    x_fourier = x_fourier + ak(k) * cos(2*pi*k*50*t) + bk(k) * sin(2*pi*k*50*t);
end

% Graficar la onda diente de sierra y su serie de Fourier
figure;
subplot(2,1,1);
plot(t, sawtooth(2*pi*50*t), 'b', 'LineWidth', 2);
title('Onda Diente de Sierra Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, x_fourier, 'r', 'LineWidth', 2);
title('Reconstrucción utilizando Serie de Fourier');
xlabel('Tiempo (s)');
ylabel('Amplitud');

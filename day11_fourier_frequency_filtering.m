clc;
clear;
close all;

%% Day 11: Fourier Transform and Frequency Domain Filtering

f = imread('cameraman.tif');
F = fft2(f);
F_shifted = fftshift(F);
S = log(1 + abs(F_shifted));

figure('Name', 'Day 11 - FFT Spectrum', 'NumberTitle', 'off');
imshow(S, []);
title('FFT Spectrum (Log Scaled)');

[M, N] = size(f);
[u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(u.^2 + v.^2);
D0 = 80;
H_LPF = double(D <= D0);

G_LPF = F_shifted .* H_LPF;
g_LPF = ifft2(ifftshift(G_LPF));

figure('Name', 'Day 11 - Frequency Filtering', 'NumberTitle', 'off');
subplot(1, 2, 1);
imshow(f);
title('Original');

subplot(1, 2, 2);
imshow(uint8(abs(g_LPF)));
title('Low-Pass Filtered');

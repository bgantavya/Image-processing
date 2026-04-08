clc;
clear;
close all;

%% Day 11: Fourier Transform and Frequency Domain Filtering
% THEORY (short):
% FFT converts image from spatial domain to frequency domain.
% - Low frequencies: smooth/slow variations
% - High frequencies: edges/fine details/noise
% A low-pass filter keeps low frequencies and suppresses high frequencies.

% Step 1: Read image and compute 2D FFT
f = imread('cameraman.tif');
F = fft2(f);

% Shift zero-frequency component to center for visualization/filter design
F_shifted = fftshift(F);

% Log-scaled magnitude spectrum for display
S = log(1 + abs(F_shifted));

figure('Name', 'Day 11 - FFT Spectrum', 'NumberTitle', 'off');
imshow(S, []);
title('FFT Spectrum (Log Scaled)');

% Step 2: Build ideal circular low-pass filter mask
[M, N] = size(f);
[u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(u.^2 + v.^2);
D0 = 80;
H_LPF = double(D <= D0);

% Step 3: Apply filter in frequency domain and inverse FFT
G_LPF = F_shifted .* H_LPF;
g_LPF = ifft2(ifftshift(G_LPF));

% Step 4: Display original and low-pass filtered image
figure('Name', 'Day 11 - Frequency Filtering', 'NumberTitle', 'off');
subplot(1, 2, 1);
imshow(f);
title('Original');

subplot(1, 2, 2);
imshow(uint8(abs(g_LPF)));
title('Low-Pass Filtered');

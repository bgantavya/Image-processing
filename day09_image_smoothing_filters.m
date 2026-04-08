clc;
clear;
close all;

%% Day 09: Image Smoothing and Noise Filtering

A = imread('eight.tif');

B = imnoise(A, 'salt & pepper');
C = imnoise(A, 'gaussian');
D = imnoise(A, 'speckle');

H1 = (1 / 9) * ones(3, 3);
H2 = (1 / 25) * ones(5, 5);

B_avg3 = conv2(double(B), H1, 'same');
B_avg5 = conv2(double(B), H2, 'same');

H_weighted = [1 2 1; 2 4 2; 1 2 1];
H_weighted = H_weighted / sum(H_weighted(:));
B_weighted = conv2(double(B), H_weighted, 'same');

B_min = ordfilt2(B, 1, ones(3, 3));
B_max = ordfilt2(B, 9, ones(3, 3));
B_median = ordfilt2(B, 5, ones(3, 3));

figure('Name', 'Day 09 - Smoothing Filters', 'NumberTitle', 'off');
subplot(4, 3, 1); imshow(A); title('Original');
subplot(4, 3, 2); imshow(B); title('Salt & Pepper Noise');
subplot(4, 3, 3); imshow(C); title('Gaussian Noise');
subplot(4, 3, 4); imshow(D); title('Speckle Noise');
subplot(4, 3, 5); imshow(uint8(B_avg3)); title('Average 3x3');
subplot(4, 3, 6); imshow(uint8(B_avg5)); title('Average 5x5');
subplot(4, 3, 7); imshow(uint8(B_weighted)); title('Weighted Average');
subplot(4, 3, 8); imshow(B_min); title('Min Filter');
subplot(4, 3, 9); imshow(B_max); title('Max Filter');
subplot(4, 3, 10); imshow(B_median); title('Median Filter');

clc;
clear;
close all;

%% Day 10: Laplacian Edge Detection and Sharpening

A = imread('cameraman.tif');
A = double(A);

L4 = [0 -1 0; -1 4 -1; 0 -1 0];
L8 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

edge_L4 = conv2(A, L4, 'same');
edge_L8 = conv2(A, L8, 'same');

sharpen_L4 = A - edge_L4;
sharpen_L8 = A - edge_L8;

figure('Name', 'Day 10 - Laplacian', 'NumberTitle', 'off');
subplot(2, 3, 1); imshow(uint8(A)); title('Original');
subplot(2, 3, 2); imshow(uint8(edge_L4)); title('Edge L4');
subplot(2, 3, 3); imshow(uint8(edge_L8)); title('Edge L8');
subplot(2, 3, 5); imshow(uint8(sharpen_L4)); title('Sharpened L4');
subplot(2, 3, 6); imshow(uint8(sharpen_L8)); title('Sharpened L8');

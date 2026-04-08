clc;
clear;
close all;

%% Day 10: Laplacian Edge Detection and Sharpening
% THEORY (short):
% The Laplacian is a second-order derivative operator.
% It highlights rapid intensity changes (edges).
% Sharpening can be done using: sharpened = original - laplacian_response.
% L4 uses 4-neighborhood, L8 uses 8-neighborhood.

% Step 1: Read image and convert to double for convolution arithmetic
A = imread('cameraman.tif');
A = double(A);

% Step 2: Define Laplacian masks
L4 = [0 -1 0; -1 4 -1; 0 -1 0];
L8 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Step 3: Compute edge responses
edge_L4 = conv2(A, L4, 'same');
edge_L8 = conv2(A, L8, 'same');

% Step 4: Sharpen using subtraction of Laplacian response
sharpen_L4 = A - edge_L4;
sharpen_L8 = A - edge_L8;

% Step 5: Display original, edge maps, and sharpened outputs
figure('Name', 'Day 10 - Laplacian', 'NumberTitle', 'off');
subplot(2, 3, 1); imshow(uint8(A)); title('Original');
subplot(2, 3, 2); imshow(uint8(edge_L4)); title('Edge L4');
subplot(2, 3, 3); imshow(uint8(edge_L8)); title('Edge L8');
subplot(2, 3, 5); imshow(uint8(sharpen_L4)); title('Sharpened L4');
subplot(2, 3, 6); imshow(uint8(sharpen_L8)); title('Sharpened L8');

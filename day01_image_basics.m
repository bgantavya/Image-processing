clc;
clear;
close all;

%% Day 01: Image Basics
% THEORY (short):
% Digital images are arrays of intensity values.
% - RGB image: 3 channels (Red, Green, Blue)
% - Grayscale image: 1 channel (brightness only)
% This script demonstrates basic reading, conversion, channel separation,
% synthetic image creation, and pseudocolor visualization.

% Step 1: Read an RGB sample image
img = imread('peppers.png');

% Step 2: Display original and resized versions
figure('Name', 'Day 01 - Image Basics', 'NumberTitle', 'off');
subplot(3, 3, 1);
imshow(img);
title('Original Image');

% Resize by scale factor 0.3 (30% of original size)
img_resize = imresize(img, 0.3);
subplot(3, 3, 2);
imshow(img_resize);
title('Resized (30%)');

% Step 3: Convert RGB to grayscale and show result
img_gray = rgb2gray(img);
subplot(3, 3, 3);
imshow(img_gray);
title('Grayscale');

% Convert grayscale to double in [0,1] for numeric processing
img_double = im2double(img_gray);
disp('First 5 grayscale pixel values (double):');
disp(img_double(1, 1:5));

% Step 4: Extract individual RGB channels
R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);

figure('Name', 'Day 01 - RGB Channels', 'NumberTitle', 'off');
subplot(1, 3, 1);
imshow(R);
title('Red Channel');

subplot(1, 3, 2);
imshow(G);
title('Green Channel');

subplot(1, 3, 3);
imshow(B);
title('Blue Channel');

% Step 5: Create a synthetic image (black background + red square)
S_img = zeros(256, 256, 3, 'uint8');
S_img(80:180, 80:180, 1) = 255;

figure('Name', 'Day 01 - Synthetic Image', 'NumberTitle', 'off');
imshow(S_img);
title('Synthetic Red Square');

% Step 6: Pseudocolor (false color mapping of grayscale intensities)
figure('Name', 'Day 01 - Pseudocolor', 'NumberTitle', 'off');
imagesc(img_gray);
colormap(jet);
colorbar;
title('Pseudocolor Image');

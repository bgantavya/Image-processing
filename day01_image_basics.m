clc;
clear;
close all;

%% Day 01: Image Basics
% Topics:
% 1) Read image
% 2) Resize image
% 3) Convert to grayscale and double
% 4) Extract RGB channels
% 5) Create synthetic image
% 6) Pseudocolor visualization

img = imread('peppers.png');

figure('Name', 'Day 01 - Image Basics', 'NumberTitle', 'off');
subplot(3, 3, 1);
imshow(img);
title('Original Image');

img_resize = imresize(img, 0.3);
subplot(3, 3, 2);
imshow(img_resize);
title('Resized (30%)');

img_gray = rgb2gray(img);
subplot(3, 3, 3);
imshow(img_gray);
title('Grayscale');

img_double = im2double(img_gray);
disp('First 5 grayscale pixel values (double):');
disp(img_double(1, 1:5));

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

S_img = zeros(256, 256, 3, 'uint8');
S_img(80:180, 80:180, 1) = 255;

figure('Name', 'Day 01 - Synthetic Image', 'NumberTitle', 'off');
imshow(S_img);
title('Synthetic Red Square');

figure('Name', 'Day 01 - Pseudocolor', 'NumberTitle', 'off');
imagesc(img_gray);
colormap(jet);
colorbar;
title('Pseudocolor Image');

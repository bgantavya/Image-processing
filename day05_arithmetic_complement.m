clc;
clear;
close all;

%% Day 05: Arithmetic Operations and Complement
% THEORY (short):
% Arithmetic operations adjust intensity values:
% - Addition increases brightness
% - Subtraction decreases brightness
% Complement inverts intensities (bright <-> dark for grayscale).

% Part A: Arithmetic on a single image
a = imread('onion.png');

% Add and subtract constant intensity value
add_img = imadd(a, 75);
sub_img = imsubtract(a, 75);

figure('Name', 'Day 05 - Arithmetic on Single Image', 'NumberTitle', 'off');
subplot(3, 2, 1);
imshow(a);
title('Original');

subplot(3, 2, 2);
imhist(a);
title('Histogram Original');

subplot(3, 2, 3);
imshow(add_img);
title('Added +75');

subplot(3, 2, 4);
imhist(add_img);
title('Histogram +75');

subplot(3, 2, 5);
imshow(sub_img);
title('Subtracted -75');

subplot(3, 2, 6);
imhist(sub_img);
title('Histogram -75');

% Part B: Arithmetic between two images
img1 = imread('cameraman.tif');
img2 = imread('rice.png');

% Resize second image to match first image size
img2_resize = imresize(img2, size(img1));

% Pixel-wise addition and subtraction
img_add = imadd(img1, img2_resize);
img_sub = imsubtract(img1, img2_resize);

figure('Name', 'Day 05 - Arithmetic on Two Images', 'NumberTitle', 'off');
subplot(2, 2, 1);
imshow(img1);
title('Image 1');

subplot(2, 2, 2);
imshow(img2_resize);
title('Image 2 (Resized)');

subplot(2, 2, 3);
imshow(img_add);
title('Addition');

subplot(2, 2, 4);
imshow(img_sub);
title('Subtraction');

% Part C: Image complement (negative in uint8 domain)
img_comp = imcomplement(img1);

figure('Name', 'Day 05 - Image Complement', 'NumberTitle', 'off');
subplot(1, 2, 1);
imshow(img1);
title('Original');

subplot(1, 2, 2);
imshow(img_comp);
title('Complement');

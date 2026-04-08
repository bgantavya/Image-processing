clc;
clear;
close all;

%% Day 06: Negative Transformation
% THEORY (short):
% Negative transformation inverts grayscale intensities:
%                 s = (L - 1) - r
% For 8-bit images, L = 256 and range is [0, 255].
% Useful for enhancing white/gray details in dark regions.

% Step 1: Read two sample images
img1 = imread('DIP2.tif');
img2 = imread('DIP5.tif');

% Step 2: Convert to grayscale if needed
if size(img1, 3) == 3
    img1 = rgb2gray(img1);
end
if size(img2, 3) == 3
    img2 = rgb2gray(img2);
end

% Step 3: Apply negative transformation
L = 256;
neg1 = (L - 1) - img1;
neg2 = (L - 1) - img2;

% Step 4: Show original/negative with histograms for image 1
figure('Name', 'Day 06 - DIP2 Negative', 'NumberTitle', 'off');
subplot(2, 2, 1);
imshow(img1);
title('Original DIP2');

subplot(2, 2, 2);
imhist(img1);
title('Histogram DIP2');

subplot(2, 2, 3);
imshow(neg1);
title('Negative DIP2');

subplot(2, 2, 4);
imhist(neg1);
title('Histogram Negative DIP2');

% Step 5: Show original/negative with histograms for image 2
figure('Name', 'Day 06 - DIP5 Negative', 'NumberTitle', 'off');
subplot(2, 2, 1);
imshow(img2);
title('Original DIP5');

subplot(2, 2, 2);
imhist(img2);
title('Histogram DIP5');

subplot(2, 2, 3);
imshow(neg2);
title('Negative DIP5');

subplot(2, 2, 4);
imhist(neg2);
title('Histogram Negative DIP5');

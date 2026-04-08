clc;
clear;
close all;

%% Day 07: Log Transformation
% THEORY (short):
% Log transformation is given by:
%                 s = c * log(1 + r)
% It expands dark pixel values and compresses bright values.
% This is useful when image details are concentrated in dark regions.

% Step 1: Read image
img = imread('DIP2.tif');

% Step 2: Convert to grayscale if input is RGB
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Step 3: Convert to double and compute scale constant c
img_double = double(img);
c = 255 / log(1 + max(img_double(:)));

% Step 4: Apply log transform and cast back to uint8 for display
log_img = c * log(1 + img_double);
log_img = uint8(log_img);

% Step 5: Display original/transformed images and histograms
figure('Name', 'Day 07 - Log Transformation', 'NumberTitle', 'off');
subplot(2, 2, 1);
imshow(img);
title('Original');

subplot(2, 2, 2);
imhist(img);
title('Histogram Original');

subplot(2, 2, 3);
imshow(log_img);
title('Log Transformed');

subplot(2, 2, 4);
imhist(log_img);
title('Histogram Log');

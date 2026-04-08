clc;
clear;
close all;

%% Day 02: Image Cropping
% THEORY (short):
% Cropping selects a region of interest (ROI) from an image.
% ROI format in MATLAB: [x y width height], where (x,y) is top-left corner.

% Step 1: Read image
img = imread('peppers.png');

% Step 2: Define ROI and crop
roi = [280 250 170 170];
cropped = imcrop(img, roi);

% Step 3: Show original and cropped outputs
figure('Name', 'Day 02 - Image Cropping', 'NumberTitle', 'off');
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(cropped);
title('Cropped Region');

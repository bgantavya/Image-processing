clc;
clear;
close all;

%% Day 02: Image Cropping
% Crop region format: [x y width height]

img = imread('peppers.png');
roi = [280 250 170 170];
cropped = imcrop(img, roi);

figure('Name', 'Day 02 - Image Cropping', 'NumberTitle', 'off');
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(cropped);
title('Cropped Region');

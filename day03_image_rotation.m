clc;
clear;
close all;

%% Day 03: Image Rotation
% THEORY (short):
% Rotation changes image orientation around its center.
% Positive angle rotates counterclockwise, negative angle clockwise.

% Step 1: Read image
img = imread('peppers.png');

% Step 2: Rotate with +90 and -90 degrees
rot_90 = imrotate(img, 90);
rot_m90 = imrotate(img, -90);

% Step 3: Display results
figure('Name', 'Day 03 - Image Rotation', 'NumberTitle', 'off');
subplot(1, 3, 1);
imshow(img);
title('Original');

subplot(1, 3, 2);
imshow(rot_90);
title('Rotated +90');

subplot(1, 3, 3);
imshow(rot_m90);
title('Rotated -90');

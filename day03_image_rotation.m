clc;
clear;
close all;

%% Day 03: Image Rotation

img = imread('peppers.png');
rot_90 = imrotate(img, 90);
rot_m90 = imrotate(img, -90);

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

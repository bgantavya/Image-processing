clc;
clear;
close all;

%% Day 08: Power Law (Gamma) Transformation
% Formula: s = c * r^gamma

img = imread('DIP2.tif');
if size(img, 3) == 3
    img = rgb2gray(img);
end
img = im2double(img);

gamma1 = 0.5;
gamma2 = 1.5;

out1 = img .^ gamma1;
out2 = img .^ gamma2;

figure('Name', 'Day 08 - Gamma Transformation', 'NumberTitle', 'off');
subplot(1, 3, 1);
imshow(img);
title('Original');

subplot(1, 3, 2);
imshow(out1);
title('Gamma = 0.5');

subplot(1, 3, 3);
imshow(out2);
title('Gamma = 1.5');

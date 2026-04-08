clc;
clear;
close all;

%% Day 07: Log Transformation
% Formula: s = c * log(1 + r)

img = imread('DIP2.tif');
if size(img, 3) == 3
    img = rgb2gray(img);
end

img_double = double(img);
c = 255 / log(1 + max(img_double(:)));
log_img = c * log(1 + img_double);
log_img = uint8(log_img);

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

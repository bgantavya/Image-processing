clc;
clear;
close all;

%% Day 08: Power Law (Gamma) Transformation
% THEORY (short):
% Power-law (gamma) transformation maps input intensity (r) to output (s):
%                 s = c * r^gamma
% where r and s are usually normalized in [0, 1].
% - gamma < 1  -> brightens dark regions (useful when image looks dim)
% - gamma > 1  -> darkens bright regions (useful when image looks washed out)
% - gamma = 1  -> output is same as input
% Here we keep c = 1, so only gamma controls the mapping behavior.

% Read image from disk
img = imread('DIP2.tif');

% If image is RGB, convert to grayscale so we apply transformation to one channel
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert to double in [0,1] because gamma formula is applied on normalized intensity
img = im2double(img);

% Two example gamma values for comparison
gamma1 = 0.5;
gamma2 = 1.5;

% Apply gamma correction: s = r^gamma (c = 1)
out1 = img .^ gamma1;
out2 = img .^ gamma2;

% Display original and transformed outputs
figure('Name', 'Day 08 - Gamma Transformation', 'NumberTitle', 'off');

% Original image
subplot(1, 3, 1);
imshow(img);
title('Original');

% Gamma < 1: output appears brighter
subplot(1, 3, 2);
imshow(out1);
title('Gamma = 0.5');

% Gamma > 1: output appears darker
subplot(1, 3, 3);
imshow(out2);
title('Gamma = 1.5');

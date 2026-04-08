clc;
clear;
close all;

%% Day 04: Logical Operations (NOT, AND, OR, XOR)
% THEORY (short):
% Logical operations are performed on binary images (0/1):
% NOT(A): invert bits, AND: common 1s, OR: either 1, XOR: different bits.

% Step 1: Read input images
a = imread('black2.png');
b = imread('white.png');

% Step 2: Convert to grayscale if needed
if size(a, 3) == 3
    a = rgb2gray(a);
end
if size(b, 3) == 3
    b = rgb2gray(b);
end

% Step 3: Convert grayscale to binary using threshold 0.5
a1 = imbinarize(a, 0.5);
b1 = imbinarize(b, 0.5);

% Step 4: Match sizes before pairwise operations
[r, c] = size(a1);
b1 = imresize(b1, [r c]);

% Step 5: Perform logical operations
not_a = not(a1);
and_ab = and(a1, b1);
or_ab = or(a1, b1);
xor_ab = xor(a1, b1);

% Step 6: Display all results
figure('Name', 'Day 04 - Logical Operations', 'NumberTitle', 'off');
subplot(2, 3, 1);
imshow(a1);
title('Binary A');

subplot(2, 3, 2);
imshow(b1);
title('Binary B');

subplot(2, 3, 3);
imshow(not_a);
title('NOT A');

subplot(2, 3, 4);
imshow(and_ab);
title('AND');

subplot(2, 3, 5);
imshow(or_ab);
title('OR');

subplot(2, 3, 6);
imshow(xor_ab);
title('XOR');

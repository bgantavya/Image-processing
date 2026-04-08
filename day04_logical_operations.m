clc;
clear;
close all;

%% Day 04: Logical Operations (NOT, AND, OR, XOR)

a = imread('black2.png');
b = imread('white.png');

if size(a, 3) == 3
    a = rgb2gray(a);
end
if size(b, 3) == 3
    b = rgb2gray(b);
end

a1 = imbinarize(a, 0.5);
b1 = imbinarize(b, 0.5);

[r, c] = size(a1);
b1 = imresize(b1, [r c]);

not_a = not(a1);
and_ab = and(a1, b1);
or_ab = or(a1, b1);
xor_ab = xor(a1, b1);

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

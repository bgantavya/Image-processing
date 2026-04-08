clc;
clear;
close all;

%% Day 12: Morphological Operations (Dilation, Erosion, Opening, Closing)
% THEORY (short):
% Morphological operations process shapes in binary images using a
% structuring element (SE).
% - Dilation: grows foreground objects
% - Erosion: shrinks foreground objects
% - Opening: erosion followed by dilation (removes small bright noise)
% - Closing: dilation followed by erosion (fills small holes/gaps)

%% Part A: Dilation and Erosion
% Step 1: Read image and convert to binary
img1 = imread('blac.jpeg');
bin1 = imbinarize(rgb2gray(img1));

% Step 2: Define structuring element
se1 = strel('square', 3);

% Step 3: Apply dilation and erosion
dilated = imdilate(bin1, se1);
eroded = imerode(bin1, se1);

% Step 4: Display outputs
figure('Name', 'Day 12 - Dilation and Erosion', 'NumberTitle', 'off');
subplot(1, 3, 1); imshow(bin1); title('Binary Image');
subplot(1, 3, 2); imshow(dilated); title('Dilation');
subplot(1, 3, 3); imshow(eroded); title('Erosion');

%% Part B: Opening and Closing
% Step 1: Read second image and convert to binary
img2 = imread('medpix2.png');
if size(img2, 3) == 3
    img2 = rgb2gray(img2);
end
bin2 = imbinarize(img2);

% Step 2: Define structuring element (5x5 square)
se2 = strel('square', 5);

% Step 3: Apply opening and closing
opened_img = imopen(bin2, se2);
closed_img = imclose(bin2, se2);

% Step 4: Display outputs
figure('Name', 'Day 12 - Opening and Closing', 'NumberTitle', 'off');
subplot(1, 3, 1); imshow(bin2); title('Binary Image');
subplot(1, 3, 2); imshow(opened_img); title('Opened Image');
subplot(1, 3, 3); imshow(closed_img); title('Closed Image');

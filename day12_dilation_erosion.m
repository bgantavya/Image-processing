


% perform opening and closing in the given image
clc;
clear;
close all;
a=imread("medpix2.png");
b=im2bw(a);
SE=ones(5,5);
i_open=imopen(b,SE);
i_closed=imclose(b,SE);
subplot(1,3,1);
imshow(b);
title("binary image");
subplot(1,3,2);
imshow(i_open);
title("opened image");
subplot(1,3,3);
imshow(i_closed);
title("closed image");
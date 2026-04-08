clc; all clear; close all;

% step1 fourier transform 
x=[1,2,3,4];
y=fft(x);
x1=ones(4,4);
y1_shifted=fftshift(x1);

% step2 read img
a = imread('cameraman.tif');

f = fft(a);
fshift=fftshift(f);
s = log(1+abs(fshift));
imshow(s, []);

[M N]= size(f);
d0=50;
[u v] = meshgrid(-n/2:N/2-1, -M/2:M/2-1);
d=sqrt(u.^2+v.^2);
hlpf=double(d<=d0)
%DIP19 Assignment 3
%Character Recongnition

clc; clear all;
imgInput = imread('../asset/image/example.png');
% imgInput = imread('../asset/image/1.png');
% imgInput = imread('../asset/image/2.png');
% imgInput = imread('../asset/image/3.png');
% imgInput = imread('../asset/image/4.png');
% imgInput = imread('../asset/image/5.png');
imgOutput = my_calculator(imgInput);

subplot(1, 2, 1);
imshow(imgInput);
subplot(1, 2, 2);
imshow(imgOutput);
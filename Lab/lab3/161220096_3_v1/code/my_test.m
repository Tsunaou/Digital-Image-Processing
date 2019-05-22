%DIP19 Assignment 3
%Character Recongnition

clc; clear all;
imgInput = imread('../asset/image/1.png');
imgOutput = my_calculator(imgInput);

subplot(1, 2, 1);
imshow(imgInput);
subplot(1, 2, 2);
imshow(imgOutput);
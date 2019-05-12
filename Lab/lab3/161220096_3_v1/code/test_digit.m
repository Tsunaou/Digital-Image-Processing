clc; clear all;
imgInput = imread('../asset/image/test1.jpg');
% imgInput = imread('../asset/image/no3.png');
I = imgInput;
H = fspecial('unsharp');
sharpened = imfilter(I,H,'replicate');
imshow(sharpened);
digitOutput = my_digit(sharpened);
display(digitOutput.Words)

clc; clear all;
imgInput = imread('../asset/image/test2.jpg'); 
imgInput = im2bw(imgInput);

[m,n] = size(imgInput);
I = imgInput;
digitOutput = my_operator(I);
display(digitOutput)



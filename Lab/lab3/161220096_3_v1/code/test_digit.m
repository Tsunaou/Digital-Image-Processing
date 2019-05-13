clc; clear all;
imgInput = imread('../asset/image/test5.jpg'); 
imgInput = im2bw(imgInput);
[m,n,dim] = size(imgInput);
I = imgInput;
H = fspecial('unsharp');
sharpened = imfilter(I,H,'replicate');
imshow(sharpened);
digitOutput = my_digit(sharpened);
display(digitOutput.Words)

function [i,j]= getIndex(index,m,n)
    i = mod(index,m);
    j = rem(index,n);
end

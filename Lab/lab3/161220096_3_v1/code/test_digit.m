clc; clear all;
input_image = imread('../asset/image/test5.jpg'); 
input_image = im2bw(input_image);

[m,n] = size(input_image);
I = clear_boundary(input_image);
% 分割为最小外接
digitOutput = my_operator(I);
display(digitOutput)



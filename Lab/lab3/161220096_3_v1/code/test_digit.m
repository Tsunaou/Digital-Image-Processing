clc; clear all;
input_image = imread('../asset/image/test5.jpg'); 
input_image = im2bw(input_image);

[m,n] = size(input_image);
I = clear_boundary(input_image);
% �ָ�Ϊ��С���
digitOutput = my_operator(I);
display(digitOutput)



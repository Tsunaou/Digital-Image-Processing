clc; clear all;
input_image = imread('../asset/image/test5.jpg'); 
input_image = im2bw(input_image);

[m,n] = size(input_image);
I = clear_boundary(input_image);
subplot(1,2,1);imshow(input_image);
subplot(1,2,2);imshow(I);

p = pblack(I);
display(p)

% 分割为最小外接
digitOutput = my_operator(I);
display(digitOutput)

function out = pblack(img)
    [m,n] = size(img);
    cnts = 0;
    for i=1:m
        for j=1:n
            if img(i,j)==0
                cnts = cnts+1;
            end
        end
    end
    out = cnts/(m*n);
end


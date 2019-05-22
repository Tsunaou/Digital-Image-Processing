clc; clear all;
input_image = imread('../asset/image/numbers/0.png'); 
input_image = im2bw(input_image);

[m,n] = size(input_image);
I = clear_boundary(input_image);
subplot(1,2,1);imshow(input_image);
subplot(1,2,2);imshow(I);

p = pblack(I);
display(p)

% 分割为最小外接
% digitOutput = my_operator(input_image);
digitOutput = true_digit(input_image);
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

function genNormal()
    for i=0:9
        address = strcat('../asset/image/numbers/',int2str(i),'.png');
        input_image = imread(address); 
        input_image = im2bw(input_image);
        I = clear_boundary(input_image);
        [m,n] = size(I);
        subplot(10,2,2*i+1);imshow(input_image);
        subplot(10,2,2*(i+1));imshow(I);
        I = clear_boundary(input_image);
        imwrite(I,strcat('../asset/image/normal/',int2str(i),'.png'));   
        p = pblack(I);
%         display(['i=', num2str(i), ' p=', num2str(p),' m=',num2str(m),' n=',num2str(n)]);
    end
end

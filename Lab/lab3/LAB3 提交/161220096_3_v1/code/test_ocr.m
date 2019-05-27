clc; clear all;
% testOperators()
testNumbers()

function testOperators()
    %印刷体
    input_image = imread('../asset/image/operators/plus.jpg'); 
%     input_image = imread('../asset/image/operators/equal.jpg'); 
%     input_image = imread('../asset/image/operators/minus.jpg'); 
    
    %手写体
%     input_image = imread('../asset/image/operators/plus_w.jpg'); 
%     input_image = imread('../asset/image/operators/equal_w.jpg'); 
%     input_image = imread('../asset/image/operators/minus_w.jpg'); 
    
    input_image = im2bw(input_image);

    I = clear_boundary(input_image);
    subplot(1,2,1);imshow(input_image);
    subplot(1,2,2);imshow(I);

    p = pblack(I);
    display(p)

    % 分割为最小外接
    digitOutput = my_operator(input_image);
    display(digitOutput)
end

function testNumbers()

    %对单幅图片测试
%     input_image = imread('../asset/image/numbers/4.png'); 
%     input_image = im2bw(input_image);
% 
%     I = clear_boundary(input_image);
%     subplot(1,2,1);imshow(input_image);
%     subplot(1,2,2);imshow(I);
%     % 分割为最小外接
%     digitOutput = my_digit(input_image);
%     display(digitOutput-'0')
    %对测试集测试
    testAllNumbersMatch();
end

function testAllNumbersMatch()
    for i=0:9
%         address = strcat('../asset/image/numbers/',int2str(i),'.png');
        address = strcat('../asset/image/write/',int2str(i),'.png');
        input_image = imread(address); 
        input_image = im2bw(input_image);
        I = clear_boundary(input_image);
        subplot(2,10,i+1);imshow(input_image);
        subplot(2,10,(i+11));imshow(I);
        digitOutput = my_digit(input_image);
        display(digitOutput-'0')
    end
end

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

function output = my_digit(input_image)
%in this function, you should finish the digit recognition task.
%the input parameter is a matrix of an image which contains a digit.
%the output parameter represents which digit it is.

%     output = true_digit(input_image);
    output = func_digit(input_image);
end

function [output] = func_digit(input_image)
    % 使用
    word = ocr(input_image,'TextLayout','Word','CharacterSet','1234567890');
    if isempty(word.Words)
        output = word.Words;
    else
        output = word.Words{1};
    end    
end

function [output] = true_digit(input_image)
%TRUE_DIGIT 用匹配的方法来匹配数字
%   此处显示详细说明
    I = clear_boundary(input_image);
    I = imresize(I,[40,25]);
    res = 0;
    sim = match(I,0);
    for i=1:9
        tmp = match(I,i);
        if tmp > sim
            res = i;
            sim = tmp;
        end
    end
    output = res + '0';
end

function [output] = match(A,k)
    normal = imread(strcat('../asset/image/normal/',int2str(k),'.png')); 
    B=imresize(normal,[40,25]);
    if ~islogical(A)
        A = im2bw(A);
    end
    if ~islogical(B)
        B = im2bw(B);
    end
    cnts = 0;
    for i = 1:40
        for j=1:25
            if A(i,j)==B(i,j)
                cnts = cnts+1;
            end
        end
    end
%     display(['i=', num2str(k), ' p=', num2str(cnts/(40*25))]);
    output = cnts;
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


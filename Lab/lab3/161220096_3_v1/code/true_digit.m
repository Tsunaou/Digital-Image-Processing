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
        A = im2bw(B);
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


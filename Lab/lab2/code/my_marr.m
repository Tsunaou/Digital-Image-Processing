function [output] = my_marr(input_image,sigma)
%MY_MARR Marr-Hildreth边缘检测算法
%   此处显示详细说明
[m,n] = size(input_image);
res = zeros(m,n);
nsize = ceil(3*sigma)*2+1; % 滤波器尺寸n为大于等于6sigma的最小奇整数
% 产生LoG滤波器,并使得滤波器的系数之和为0
LoG = fspecial('log',nsize,sigma);
LoG = LoG - mean(LoG(:));%矩阵每一项减去均值，则滤波器系数之和为0
% 利用Log滤波器对图像滤波
b = filter2(LoG,input_image);
% 设置零交叉阈值（基于均值或者最大值的百分比）
% thresh =  0.75*mean(abs(b(:)));
thresh = 0.05*max(abs(b(:)));
% 寻找滤波后的零交叉点：寻找零交叉的一种方法是以p为中心的一个3*3邻域，如果g(x,y)的值与一个阈值比较，
% 则不仅相对邻域的符号不同，并且他们数值差的绝对值还超过阈值
op1 = [0,-1; -1,0; -1,-1; -1, 1]; %分别代表左右、上下和两个对角
op2 = [0, 1;  1,0;  1, 1;  1,-1];
for i = 2:m-1
    for j = 2:n-1
        p = [i,j];
        for k = 1:4
            xy1 = p + op1(k,:);
            xy2 = p + op2(k,:);
            x = b(xy1(1),xy1(2)); %相对邻域的两个值
            y = b(xy2(1),xy2(2));
            t = b(i,j);
%             if (x*y<0)&&(abs(x-y)>thresh) %相对邻域的符号不同，并且他们数值差的绝对值还超过阈值
%                 res(i,j)=1;
%                 break;
%             end
            if (t<0&&x>0)&&(abs(x-t)>thresh) %相对邻域的符号不同，并且他们数值差的绝对值还超过阈值
                res(i,j)=1;
                break;
            end
            if (t<0&&y>0)&&(abs(y-t)>thresh) %相对邻域的符号不同，并且他们数值差的绝对值还超过阈值
                res(i,j)=1;
                break;
            end
        end
    end
end

output = logical(res);

end


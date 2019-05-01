function [output] = my_canny(input_image)
%MY_CANNY Canny边缘检测算法
%   此处显示详细说明
imgsrc = im2uint8(input_image);
[y, x, dim] = size(imgsrc);

%转换为灰度图
if dim>1
    imgsrc = rgb2gray(imgsrc);
end

sigma = 1;
gausFilter = fspecial('gaussian', [3,3], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

zz = double(img);

%----------------------------------------------------------
%自己的边缘检测函数
[m,theta,sector,canny1,canny2,bin] = canny1step(img, 22);
output = logical(bin);
end


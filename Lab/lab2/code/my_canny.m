function [output] = my_canny(input_image)
%MY_CANNY Canny��Ե����㷨
%   �˴���ʾ��ϸ˵��
imgsrc = im2uint8(input_image);
[y, x, dim] = size(imgsrc);

%ת��Ϊ�Ҷ�ͼ
if dim>1
    imgsrc = rgb2gray(imgsrc);
end

sigma = 1;
gausFilter = fspecial('gaussian', [3,3], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

zz = double(img);

%----------------------------------------------------------
%�Լ��ı�Ե��⺯��
[m,theta,sector,canny1,canny2,bin] = canny1step(img, 22);
output = logical(bin);
end


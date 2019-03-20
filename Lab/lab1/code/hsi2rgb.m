function [IMG_RGB] = hsi2rgb(IMG_HSI)
%HSI2RGB 把HSI的图像转换为RGB图像
%   此处显示详细说明
HSV = hsi2hsv(IMG_HSI);
IMG_RGB = hsv2rgb(HSV);
end


function [IMG_RGB] = hsi2rgb(IMG_HSI)
%HSI2RGB ��HSI��ͼ��ת��ΪRGBͼ��
%   �˴���ʾ��ϸ˵��
HSV = hsi2hsv(IMG_HSI);
IMG_RGB = hsv2rgb(HSV);
end


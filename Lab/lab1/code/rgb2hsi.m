function [IMG_HSI] = rgb2hsi(IMG_RGB)
%RGB2HSI 把RGB的图像转化为HSI的图像
%   此处显示详细说明
if numel(size(IMG_RGB)) == 3
    %彩色图
    r=IMG_RGB(:,:,1);
    v=IMG_RGB(:,:,2);
    b=IMG_RGB(:,:,3);
    HSV = rgb2hsv(IMG_RGB);
    I = (r+v+b)/3;
    HSV(:,:,3) = I;
    IMG_HSI = HSV;    
else
    %灰度图，直接返回
    [IMG_HSI] = IMG_RGB;
end

end


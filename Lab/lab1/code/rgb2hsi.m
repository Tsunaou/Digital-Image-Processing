function [IMG_HSI] = rgb2hsi(IMG_RGB)
%RGB2HSI 把RGB的图像转化为HSI的图像
%   此处显示详细说明
if numel(size(IMG_RGB)) == 3
    %彩色图
    
    %实现思路1：从RGB得到HSV后，再从HSV得到HSI
    %用库函数得到HSV
    IMG_RGB = im2double(IMG_RGB);
    HSV = rgb2hsv(IMG_RGB);
    IMG_HSI = hsv2rgb(HSV);

    
    
    %自己实现的HSI
    %归一化
%     IMG_RGB = im2double(IMG_RGB);
%     r = IMG_RGB(:,:,1);
%     g = IMG_RGB(:,:,2);
%     b = IMG_RGB(:,:,3);
%     r = r/255;
%     g = g/255;
%     b = b/255;
%     %
%     x = (r-g+r-b)/2;
%     y = ((r-g).^2+(r-b).*(g-b)).^(1/2);
%     theta = acos(x./(y+eps)); %弧度值
%     H = theta;
%     if b>g
%         H = 2*pi - theta;
%     end
%     H = H/(2*pi);
%     min_rgb = min(r,g);
%     min_rgb = min(min_rgb,b);
%     S = 1-(3*min_rgb)./(r+g+b);
%     I = (r+b+g)/3;
%     HSI = cat(3,H,S,I);        
%     
%     IMG_HSI = HSI;    
else
    %灰度图，直接返回
    [IMG_HSI] = IMG_RGB;
end

end


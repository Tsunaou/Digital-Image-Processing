function [output] = HSI_equalization(rgb)
%HSV_EQUALIZATION 把RGB图片转化为HSI图片，然后对V做直方图处理
%   此处显示详细说明
if numel(size(rgb)) == 3
    %this is a RGB image
    %将RGB图像转为HSI图像
    hsi = rgb2hsi(rgb);
    h = hsi(:,:,1);
    s = hsi(:,:,2);
    i = hsi(:,:,3);
    %此时的i取值在(0,1)，适应hist_equal的参数需求    
    i = uint8(round(i*255+0.5));
    %对i通道单独进行直方图均衡化
    i2 = hist_equal(i);
    i2 = i2/255;
    i2 = double(i2);
    hsi = cat(3,h,s,i2);
    %将HSI图像转为RGB图像
    rgb = hsi2rgb(hsi);
    output = uint8(rgb); 
else
    %this is a gray image
    gray = hist_equal(rgb);
    [output] = uint8(gray);   
end    
    
end


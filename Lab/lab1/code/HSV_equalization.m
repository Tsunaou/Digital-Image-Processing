function [output] = HSV_equalization(rgb)
%HSV_EQUALIZATION 把RGB图片转化为HSV图片，然后对V做直方图处理
%   此处显示详细说明
if numel(size(rgb)) == 3
    %this is a RGB image
    %将RGB图像转为HSV图像
    hsv = rgb2hsv(rgb);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);
    %此时的v取值在(0,1)，适应hist_equal的参数需求
    v = uint8(round(v*255+0.5));
    %对v通道单独进行直方图均衡化
    v2 = hist_equal(v);
    hsv = cat(3,h,s,v2);
    %将HSV图像转为RGB图像
    rgb = hsv2rgb(hsv);
    output = uint8(rgb);
else
    %this is a gray image
    gray = hist_equal(rgb);
    [output] = uint8(gray);
end

end


function [output] = HSV_equalization(rgb)
%HSV_EQUALIZATION 把RGB图片转化为HSV图片，然后对V做直方图处理
%   此处显示详细说明
if numel(size(rgb)) == 3
    %this is a RGB image
    hsv = rgb2hsv(rgb);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);
    v2 = hist_equal(v);
    v2 = double(v2);
    hsv = cat(3,h,s,v2);
    rgb = hsv2rgb(hsv);
    output = uint8(rgb);   
else
    %this is a gray image
    [output] = hist_equal(rgb);    
end

end


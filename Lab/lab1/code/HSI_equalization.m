function [output] = HSI_equalization(rgb)
%HSV_EQUALIZATION 把RGB图片转化为HSI图片，然后对V做直方图处理
%   此处显示详细说明
    rgb = double(rgb);
    hsi = rgb2hsi(rgb);
    h = hsi(:,:,1);
    s = hsi(:,:,2);
    i = hsi(:,:,3);
    i2 = hist_equal(i);
    i2 = double(i2);
    hsi = cat(3,h,s,i2);
    rgb = hsi2rgb(hsi);
    output = uint8(rgb);
end


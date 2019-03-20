function [output] = HSI_equalization(rgb)
%HSV_EQUALIZATION ��RGBͼƬת��ΪHSIͼƬ��Ȼ���V��ֱ��ͼ����
%   �˴���ʾ��ϸ˵��
    hsi = rgb2hsi(rgb);
    h = hsi(:,:,1);
    s = hsi(:,:,2);
    i = hsi(:,:,3);
    i = double(i);
    i2 = hist_equal(i);
    i2 = double(i2);
    i2 = i2/255;
    hsi = cat(3,h,s,i2);
    rgb = hsi2rgb(hsi);
    rgb = rgb*255;
    output = uint8(rgb);
end


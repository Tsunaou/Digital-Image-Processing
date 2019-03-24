function [output] = HSI_equalization(rgb)
%HSV_EQUALIZATION ��RGBͼƬת��ΪHSIͼƬ��Ȼ���V��ֱ��ͼ����
%   �˴���ʾ��ϸ˵��
if numel(size(rgb)) == 3
    %this is a RGB image
    %��RGBͼ��תΪHSIͼ��
    hsi = rgb2hsi(rgb);
    h = hsi(:,:,1);
    s = hsi(:,:,2);
    i = hsi(:,:,3);
    %��ʱ��iȡֵ��(0,1)����Ӧhist_equal�Ĳ�������    
    i = uint8(round(i*255+0.5));
    %��iͨ����������ֱ��ͼ���⻯
    i2 = hist_equal(i);
    i2 = i2/255;
    i2 = double(i2);
    hsi = cat(3,h,s,i2);
    %��HSIͼ��תΪRGBͼ��
    rgb = hsi2rgb(hsi);
    output = uint8(rgb); 
else
    %this is a gray image
    gray = hist_equal(rgb);
    [output] = uint8(gray);   
end    
    
end

function [output] = HSV_equalization(rgb)
%HSV_EQUALIZATION ��RGBͼƬת��ΪHSVͼƬ��Ȼ���V��ֱ��ͼ����
%   �˴���ʾ��ϸ˵��
if numel(size(rgb)) == 3
    %this is a RGB image
    hsv = rgb2hsv(rgb);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);
    v2 = hist_equal(v);
    hsv = cat(3,h,s,v2);
    rgb = hsv2rgb(hsv);
    output = uint8(rgb);
else
    %this is a gray image
    gray = hist_equal(rgb);
    [output] = uint8(gray);
end

end

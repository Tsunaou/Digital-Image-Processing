function [IMG_HSI] = rgb2hsi(IMG_RGB)
%RGB2HSI ��RGB��ͼ��ת��ΪHSI��ͼ��
%   �˴���ʾ��ϸ˵��
if numel(size(IMG_RGB)) == 3
    %��ɫͼ
    
    %ʵ��˼·1����RGB�õ�HSV���ٴ�HSV�õ�HSI
    %�ÿ⺯���õ�HSV
    IMG_RGB = im2double(IMG_RGB);
    HSV = rgb2hsv(IMG_RGB);
    IMG_HSI = hsv2rgb(HSV);

    
    
    %�Լ�ʵ�ֵ�HSI
    %��һ��
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
%     theta = acos(x./(y+eps)); %����ֵ
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
    %�Ҷ�ͼ��ֱ�ӷ���
    [IMG_HSI] = IMG_RGB;
end

end


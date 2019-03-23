function [IMG_HSI] = rgb2hsi(IMG_RGB)
%RGB2HSI ��RGB��ͼ��ת��ΪHSI��ͼ��
%   �˴���ʾ��ϸ˵��
if numel(size(IMG_RGB)) == 3
    %��ɫͼ
    
    %ʵ��˼·1����RGB�õ�HSV���ٴ�HSV�õ�HSI��Ȼ����ʵ֤����������в�ͨ�ģ�
    %�ÿ⺯���õ�HSV
%     IMG_RGB = im2double(IMG_RGB);
%     HSV = rgb2hsv(IMG_RGB);
%     IMG_HSI = hsv2rgb(HSV);

    
    %ʵ��˼·2�����ݿα��Ϲ�ʽ�Լ�ʵ�ֵ�HSI
    IMG_RGB = im2double(IMG_RGB);
    r = IMG_RGB(:,:,1);
    g = IMG_RGB(:,:,2);
    b = IMG_RGB(:,:,3);
    %
    x = (r-g+r-b)/2;
    y = ((r-g).^2+(r-b).*(g-b)).^(1/2);
    theta = acos(x./(y+eps)); %����ֵ
    H = theta;
    [m,n] = size(b);
    H(b>g) = 2*pi - H(b>g);
    H = H/(2*pi);
    min_rgb = min(r,g);
    min_rgb = min(min_rgb,b);
    den = (r+g+b);
    den(den==0) = eps;
    S = 1-(3*min_rgb)./den;
    I = (r+b+g)/3;
    HSI = cat(3,H,S,I);        
    
    IMG_HSI = HSI;    
else
    %�Ҷ�ͼ��ֱ�ӷ���
    [IMG_HSI] = IMG_RGB;
end

end




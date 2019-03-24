function [IMG_RGB] = hsi2rgb(IMG_HSI)
%HSI2RGB ��HSI��ͼ��ת��ΪRGBͼ��
if numel(size(IMG_HSI)) == 3
    %��ɫͼ
    %ʵ��˼·1����HSI�õ�HSV���ٴ�HSV�õ�RGB��Ȼ����ʵ֤����������в�ͨ�ģ�
    %�ÿ⺯���õ�HSV
%     IMG_HSV = hsi2rgb(IMG_HSI);
%     IMG_RGB = rgb2hsv(IMG_HSV);

    %ʵ��˼·2����������P260-261ҳ��ʽʵ�ֱ�����
    H = IMG_HSI(:,:,1)*2*pi;
    S = IMG_HSI(:,:,2);
    I = IMG_HSI(:,:,3);
    %���ڼ�¼RGBֵ�ľ���
    R = zeros(size(IMG_HSI,1),size(IMG_HSI,2));
    G = zeros(size(IMG_HSI,1),size(IMG_HSI,2));
    B = zeros(size(IMG_HSI,1),size(IMG_HSI,2));
    % 0<=H<2*pi/3
    i = find((0<=H)&(H<2*pi/3));
    B(i) = I(i).*(1-S(i));
    R(i) = I(i).*(1+S(i).*cos(H(i))./cos(pi/3-H(i)));
    G(i) = 3*I(i)-(R(i)+B(i));
    % 2*pi/3<=H<4*pi/3
    i = find((2*pi/3<=H)&(H<4*pi/3));
    R(i) = I(i).*(1-S(i));
    G(i) = I(i).*(1+S(i).*cos(H(i)-2*pi/3)./cos(pi-H(i)));
    B(i) = 3*I(i)-(R(i)+G(i));
    % 4*pi/3<=H<=2*pi
    i = find((4*pi/3<=H)&(H<=2*pi));
    G(i) = I(i).*(1-S(i));
    B(i) = I(i).*(1+S(i).*cos(H(i)-4*pi/3)./cos(5*pi/3-H(i)));
    R(i) = 3*I(i)-(G(i)+B(i));
    % ����
    rgb=cat(3,R,G,B);
    rgb=max(min(rgb,1),0);
    % Ϊ��ֱ�ӵõ�RGBֵ������255
    IMG_RGB=rgb*255;
else
    %�Ҷ�ͼ��ֱ�ӷ���
    [IMG_RGB] = IMG_HSI;
end

   

end


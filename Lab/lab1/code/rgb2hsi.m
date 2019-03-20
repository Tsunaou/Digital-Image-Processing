function [IMG_HSI] = rgb2hsi(IMG_RGB)
%RGB2HSI ��RGB��ͼ��ת��ΪHSI��ͼ��
%   �˴���ʾ��ϸ˵��
if numel(size(IMG_RGB)) == 3
    %��ɫͼ
    r=IMG_RGB(:,:,1);
    v=IMG_RGB(:,:,2);
    b=IMG_RGB(:,:,3);
    HSV = rgb2hsv(IMG_RGB);
    I = (r+v+b)/3;
    HSV(:,:,3) = I;
    IMG_HSI = HSV;    
else
    %�Ҷ�ͼ��ֱ�ӷ���
    [IMG_HSI] = IMG_RGB;
end

end


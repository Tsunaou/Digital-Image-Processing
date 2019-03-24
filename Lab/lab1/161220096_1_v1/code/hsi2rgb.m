function [IMG_RGB] = hsi2rgb(IMG_HSI)
%HSI2RGB 把HSI的图像转换为RGB图像
if numel(size(IMG_HSI)) == 3
    %彩色图
    %实现思路1：从HSI得到HSV后，再从HSV得到RGB（然而事实证明这个方法行不通的）
    %用库函数得到HSV
%     IMG_HSV = hsi2rgb(IMG_HSI);
%     IMG_RGB = rgb2hsv(IMG_HSV);

    %实现思路2：根据书上P260-261页公式实现本函数
    H = IMG_HSI(:,:,1)*2*pi;
    S = IMG_HSI(:,:,2);
    I = IMG_HSI(:,:,3);
    %用于记录RGB值的矩阵
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
    % 整合
    rgb=cat(3,R,G,B);
    rgb=max(min(rgb,1),0);
    % 为了直接得到RGB值，乘以255
    IMG_RGB=rgb*255;
else
    %灰度图，直接返回
    [IMG_RGB] = IMG_HSI;
end

   

end


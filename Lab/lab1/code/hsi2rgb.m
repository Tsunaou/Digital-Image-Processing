% function [IMG_RGB] = hsi2rgb(IMG_HSI)
% %HSI2RGB 把HSI的图像转换为RGB图像
% %   此处显示详细说明
% HSV = hsi2hsv(IMG_HSI);
% IMG_RGB = hsv2rgb(HSV);
% end
% 
function rgb=hsi2rgb(hsi)
%根据书上P260-261页公式实现本函数
H=hsi(:,:,1)*2*pi;
S=hsi(:,:,2);
I=hsi(:,:,3);
R=zeros(size(hsi,1),size(hsi,2));
G=zeros(size(hsi,1),size(hsi,2));
B=zeros(size(hsi,1),size(hsi,2));
idx=find((0<=H)&(H<2*pi/3));
B(idx)=I(idx).*(1-S(idx));
R(idx)=I(idx).*(1+S(idx).*cos(H(idx))./cos(pi/3-H(idx)));
G(idx)=3*I(idx)-(R(idx)+B(idx));
idx=find((2*pi/3<=H)&(H<4*pi/3));
R(idx)=I(idx).*(1-S(idx));
G(idx)=I(idx).*(1+S(idx).*cos(H(idx)-2*pi/3)./cos(pi-H(idx)));
B(idx)=3*I(idx)-(R(idx)+G(idx));
idx=find((4*pi/3<=H)&(H<=2*pi));
G(idx)=I(idx).*(1-S(idx));
B(idx)=I(idx).*(1+S(idx).*cos(H(idx)-4*pi/3)./cos(5*pi/3-H(idx)));
R(idx)=3*I(idx)-(G(idx)+B(idx));
rgb=cat(3,R,G,B);
rgb=max(min(rgb,1),0);
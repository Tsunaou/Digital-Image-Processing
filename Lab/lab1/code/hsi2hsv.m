function [hsv] = hsi2hsv(hsi)
%HSI2HSV 此处显示有关此函数的摘要
%   此处显示详细说明
H = hsi(:,:,1);
S = hsi(:,:,2);
I = hsi(:,:,3);
%将HSI转化成HSV
H = H;
V = I + S.* min(I,1-I);
S = 2-2*I./V;
index = find(V==0);
[m,n] = size(index);
n = m*n;
for i=1:n
    S(index(i))=0;
end
hsv = cat(3,H,S,V);
end


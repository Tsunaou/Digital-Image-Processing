function [HSI] = hsv2hsi(HSV)
%HSV2HSI 此处显示有关此函数的摘要
%   此处显示详细说明
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    %用Wiki上的公式转换HSV成HSI
    H = H;
    I = V-(V.*S)./2;
    S = (V-I)./min(I,1-I); 
    index = find(I==0);
    [n,tmp] = size(index);
    for i=1 : n
        S(index(i))=0;
    end
    index = find(I==1);
    [n,tmp] = size(index);
    for i=1 : n
        S(index(i))=0;
    end
    HSI = cat(3,H,S,I);        
end


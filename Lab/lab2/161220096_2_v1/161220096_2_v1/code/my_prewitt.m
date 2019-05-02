function [output] = my_prewitt(input_image)
%MY_PREWITT PREWITT�����µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
[m,n] = size(input_image);
res = zeros(m,n);
% ��ֵ����scale:
scale = 1.8; % rubberband_cap
% scale = 0.5;% bird 
% scale = 0.5;% giraffe
% scale = 0.7;% noise
% scale = 0.10;% noise2
thresh = Threshold(input_image,scale);%�趨��ֵ
img = input_image;

for i=2:m-1 
    for j=2:n-1
        Gx = img(i-1,j+1)-img(i+1,j+1)+img(i-1,j)-img(i+1,j)+img(i-1,j-1)-img(i+1,j-1);
        Gy = img(i-1,j+1)+img(i,j+1)+img(i+1,j+1)-img(i-1,j-1)-img(i,j-1)-img(i+1,j-1);
        PrewittNum= sqrt(Gx^2+Gy^2);
        res(i,j) = (PrewittNum > thresh);
    end
end

output = logical(res);
end


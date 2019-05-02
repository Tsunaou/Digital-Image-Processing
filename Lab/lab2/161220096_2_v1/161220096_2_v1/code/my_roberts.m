function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS算子下的边缘检测算法
%   此处显示详细说明
[m,n] = size(input_image);
res = zeros(m,n);
% 阈值设置scale:
scale = 0.30; % rubberband_cap 0.3
% scale = 0.10;% bird 
% scale = 0.10;% giraffe
% scale = 0.30;% noise
% scale = 0.02;% noise2

thresh = Threshold(input_image,scale);%设定阈值
img = input_image;


for i=1:m-1
    for j=1:n-1
        Gx = img(i,j) - img(i+1,j+1);
        Gy = img(i+1,j) - img(i,j+1);
        robertsNum = sqrt(Gx^2+Gy^2);
        res(i,j) = (robertsNum > thresh);
    end
end

output = logical(res);
end


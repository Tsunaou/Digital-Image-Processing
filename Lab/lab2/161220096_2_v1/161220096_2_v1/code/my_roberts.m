function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS算子下的边缘检测算法
%   此处显示详细说明
[m,n] = size(input_image);
res = zeros(m,n);
thresh = Threshold(input_image,0.30);%设定阈值
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


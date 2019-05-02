function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS�����µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
[m,n] = size(input_image);
res = zeros(m,n);
thresh = Threshold(input_image,0.30);%�趨��ֵ
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


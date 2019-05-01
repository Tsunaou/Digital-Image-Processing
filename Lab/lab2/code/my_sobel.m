function [output] = my_sobel(input_image)
%MY_SOBEL �����������µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
% input_image = gauss_filter(input_image);
[m,n] = size(input_image);
res = zeros(m,n);
thresh = Threshold(input_image,2.8);
img = input_image;

for i=2:m-1
    for j=2:n-1
        Gx = img(i-1,j+1)+2*img(i,j+1)+img(i+1,j+1)-img(i-1,j-1)-2*img(i,j-1)-img(i+1,j-1);
        Gy = img(i-1,j-1)+2*img(i-1,j)+img(i-1,j+1)-img(i+1,j-1)-2*img(i+1,j)-img(i+1,j+1);
        sobelNum= sqrt(Gx^2+Gy^2);
        res(i,j) = (sobelNum > thresh);
    end
end

output = logical(res);
end

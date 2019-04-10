function [output] = my_sobel(input_image)
%MY_SOBEL �����������µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
% input_image = gauss_filter(input_image);
[m,n]=size(input_image);
newGrayPic=zeros(m,n);
sobelNum=0;
sobelThreshold=Threshold(input_image,2.8);
for i=2:m-1
    for j=2:n-1
        Gx = input_image(i-1,j+1)+2*input_image(i,j+1)+input_image(i+1,j+1)-input_image(i-1,j-1)-2*input_image(i,j-1)-input_image(i+1,j-1);
        Gy = input_image(i-1,j-1)+2*input_image(i-1,j)+input_image(i-1,j+1)-input_image(i+1,j-1)-2*input_image(i+1,j)-input_image(i+1,j+1);
        sobelNum= sqrt(Gx^2+Gy^2);
        if(sobelNum > sobelThreshold)
            newGrayPic(i,j)=1;
        else
            newGrayPic(i,j)=0;
        end
    end
end
output = logical(newGrayPic);
end

function [threshold] = Threshold(input_image,scale)
%   Sobel��ֵ��ȷ��
%   �˴���ʾ��ϸ˵��
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
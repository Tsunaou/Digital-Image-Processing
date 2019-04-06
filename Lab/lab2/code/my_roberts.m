function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS�����µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
grayPic=mat2gray(input_image);%ʵ��ͼ��ľ����һ������
[m,n]=size(grayPic);
newGrayPic=grayPic;
robertsNum=0;
robertThreshold=Threshold(input_image,0.45);
for i=1:m-1
    for j=1:n-1
        robertsNum = abs(grayPic(i,j)-grayPic(i+1,j+1)) + abs(grayPic(i+1,j)-grayPic(i,j+1));
        if(robertsNum > robertThreshold)
            newGrayPic(i,j)=1;
        else
            newGrayPic(i,j)=0;
        end
    end
end
output = logical(newGrayPic);
end

function [threshold] = Threshold(input_image,scale)
%   Prewitt��ֵ��ȷ��
%   �˴���ʾ��ϸ˵��
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
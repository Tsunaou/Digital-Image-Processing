function [output] = my_prewitt(input_image)
%MY_PREWITT PREWITT�����µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
grayPic=mat2gray(input_image);%ʵ��ͼ��ľ����һ������
[m,n]=size(grayPic);
newGrayPic=grayPic;
PrewittNum=0;
PrewittThreshold=Threshold(input_image,3);%�趨��ֵ
for i=2:m-1 %���б߽���ȡ
    for j=2:n-1
        PrewittNum=abs(grayPic(i-1,j+1)-grayPic(i+1,j+1)+grayPic(i-1,j)-grayPic(i+1,j)+grayPic(i-1,j-1)-grayPic(i+1,j-1))+abs(grayPic(i-1,j+1)+grayPic(i,j+1)+grayPic(i+1,j+1)-grayPic(i-1,j-1)-grayPic(i,j-1)-grayPic(i+1,j-1));
        if(PrewittNum > PrewittThreshold)
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
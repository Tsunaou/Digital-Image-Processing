function [output] = my_laplacian(input_image)
%MY_LAPLACIAN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
grayPic=mat2gray(input_image);%ʵ��ͼ��ľ����һ������
[m,n]=size(grayPic);
newGrayPic=grayPic;
LaplacianNum=0;%��Laplacian�����õ���ÿ�����ص�ֵ
LaplacianThreshold = Threshold(input_image,0.4);%�趨��ֵ
for i=2:m-1 %���б߽���ȡ
    for j=2:n-1
        LaplacianNum=abs(4*grayPic(i,j)-grayPic(i-1,j)-grayPic(i+1,j)-grayPic(i,j+1)-grayPic(i,j-1));
        if(LaplacianNum > LaplacianThreshold)
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
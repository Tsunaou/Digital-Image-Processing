function [output] = my_laplacian(input_image)
%MY_LAPLACIAN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
input_image = gauss_filter(input_image);
[m,n]=size(input_image);
newGrayPic=zeros(m,n);
LaplacianNum=0;%��Laplacian�����õ���ÿ�����ص�ֵ
LaplacianThreshold = Threshold(input_image,0.03);%�趨��ֵ
for i=2:m-1 %���б߽���ȡ
    for j=2:n-1
        LaplacianNum=abs(4*input_image(i,j)-input_image(i-1,j)-input_image(i+1,j)-input_image(i,j+1)-input_image(i,j-1));
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
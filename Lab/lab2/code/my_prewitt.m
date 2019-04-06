function [output] = my_prewitt(input_image)
%MY_PREWITT PREWITT�����µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
[m,n]=size(input_image);
newGrayPic=zeros(m,n);
PrewittNum=0;
PrewittThreshold=Threshold(input_image,1.8);%�趨��ֵ
for i=2:m-1 %���б߽���ȡ
    for j=2:n-1
        Gx = input_image(i-1,j+1)-input_image(i+1,j+1)+input_image(i-1,j)-input_image(i+1,j)+input_image(i-1,j-1)-input_image(i+1,j-1);
        Gy = input_image(i-1,j+1)+input_image(i,j+1)+input_image(i+1,j+1)-input_image(i-1,j-1)-input_image(i,j-1)-input_image(i+1,j-1);
        PrewittNum= sqrt(Gx^2+Gy^2);
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
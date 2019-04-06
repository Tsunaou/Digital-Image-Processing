function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS�����µı�Ե����㷨
%   �˴���ʾ��ϸ˵��
[m,n]=size(input_image);
newGrayPic=zeros(m,n);
robertsNum=0;
robertThreshold=Threshold(input_image,0.30);
for i=1:m-1
    for j=1:n-1
        Gx = input_image(i,j)-input_image(i+1,j+1);
        Gy = input_image(i+1,j)-input_image(i,j+1);
        robertsNum = sqrt(Gx^2+Gy^2);
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
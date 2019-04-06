function [output] = my_prewitt(input_image)
%MY_PREWITT PREWITT算子下的边缘检测算法
%   此处显示详细说明
[m,n]=size(input_image);
newGrayPic=zeros(m,n);
PrewittNum=0;
PrewittThreshold=Threshold(input_image,1.8);%设定阈值
for i=2:m-1 %进行边界提取
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
%   Prewitt阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
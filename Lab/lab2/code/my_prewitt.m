function [output] = my_prewitt(input_image)
%MY_PREWITT PREWITT算子下的边缘检测算法
%   此处显示详细说明
grayPic=mat2gray(input_image);%实现图像的矩阵归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;
PrewittNum=0;
PrewittThreshold=Threshold(input_image,3);%设定阈值
for i=2:m-1 %进行边界提取
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
%   Prewitt阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
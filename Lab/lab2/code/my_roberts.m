function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS算子下的边缘检测算法
%   此处显示详细说明
grayPic=mat2gray(input_image);%实现图像的矩阵归一化操作
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
%   Prewitt阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
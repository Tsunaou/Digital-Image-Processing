function [output] = my_sobel(input_image)
%MY_SOBEL 索贝尔算子下的边缘检测算法
%   此处显示详细说明
grayPic=mat2gray(input_image);%实现图像的矩阵归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;
sobelNum=0;
sobelThreshold=Threshold(grayPic,3);
for i=2:m-1
    for j=2:n-1
        Gx = grayPic(i-1,j+1)+2*grayPic(i,j+1)+grayPic(i+1,j+1)-grayPic(i-1,j-1)-2*grayPic(i,j-1)-grayPic(i+1,j-1);
        Gy = grayPic(i-1,j-1)+2*grayPic(i-1,j)+grayPic(i-1,j+1)-grayPic(i+1,j-1)-2*grayPic(i+1,j)-grayPic(i+1,j+1);
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
%   Sobel阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
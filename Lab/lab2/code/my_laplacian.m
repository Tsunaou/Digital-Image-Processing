function [output] = my_laplacian(input_image)
%MY_LAPLACIAN 此处显示有关此函数的摘要
%   此处显示详细说明
grayPic=mat2gray(input_image);%实现图像的矩阵归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;
LaplacianNum=0;%经Laplacian操作得到的每个像素的值
LaplacianThreshold = Threshold(input_image,0.4);%设定阈值
for i=2:m-1 %进行边界提取
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
%   Prewitt阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
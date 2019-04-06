function [output] = my_roberts(input_image)
%MY_ROBERTS ROBERTS算子下的边缘检测算法
%   此处显示详细说明
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
%   Prewitt阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end
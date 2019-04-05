clear;
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
% imgTest = im2double(imread('../asset/image/a.jpg'));
imgTestGray = rgb2gray(imgTest);
figure; clf;
imshow(imgTestGray);
grayPic=mat2gray(imgTestGray);%实现图像的矩阵归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;
robertsNum=0;
robertThreshold=0.2;
for j=1:m-1
    for k=1:n-1
        robertsNum = abs(grayPic(j,k)-grayPic(j+1,k+1)) + abs(grayPic(j+1,k)-grayPic(j,k+1));
        if(robertsNum > robertThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
figure,imshow(newGrayPic);
title('roberts算子的处理结果')
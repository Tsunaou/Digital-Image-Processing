clear;
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
imgTestGray = rgb2gray(imgTest);
figure; clf;
imshow(imgTestGray);
grayPic=mat2gray(imgTestGray);%实现图像的矩阵归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;
sobelNum=0;
sobelThreshold=0.99;
for j=2:m-1
    for k=2:n-1
        sobelNum=abs(grayPic(j-1,k+1)+2*grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-2*grayPic(j,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k-1)+2*grayPic(j-1,k)+grayPic(j-1,k+1)-grayPic(j+1,k-1)-2*grayPic(j+1,k)-grayPic(j+1,k+1));
        if(sobelNum > sobelThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
figure,imshow(newGrayPic);
title('Sobel算子的处理结果')


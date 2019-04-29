%曲线跟踪，给定搜索起点和搜索方向返回线条坐标数组
clc;
clear all;
rgb=imread('../asset/image/rubberband_cap.png');
figure;
imshow(rgb);
title('原始图像');
I=rgb2gray(rgb);
threashold=graythresh(I); %使用此函数找到最佳阈值
bw=im2bw(I,threashold); %使用此阈值将图像转化为二值图
bw = edge(bw);
figure;
imshow(bw);
title('二值图像');
dim=size(bw);
col=round(dim(2)/2)-90;  %设定一个列坐标
row=find(bw(:,col),1); %在该列中找到第一个不为0的像素坐标
CONNectivity=8; %8联通方式
num_points=360; %设定曲线最长值
contour=bwtraceboundary(bw,[row,col],'N',CONNectivity,num_points); %使用该函数找到所有以改点为起点的曲线
%contour中保存的是所有点的坐标
figure;
imshow(rgb);
hold on;
plot(contour(:,2),contour(:,1),'b','LineWidth',2); %在原图中画出来
title('结果图像');

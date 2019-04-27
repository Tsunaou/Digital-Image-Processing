clear all;
clear
clc;
%读进图像
[filename, pathname] = uigetfile({'*.jpg'; '*.bmp';  '*.png'; '*.gif'}, '选择图片');

%没有图像
if filename == 0
    return;
end

imgsrc = imread([pathname, filename]);
[y, x, dim] = size(imgsrc);

%转换为灰度图
if dim>1
    imgsrc = rgb2gray(imgsrc);
end

sigma = 1;
gausFilter = fspecial('gaussian', [3,3], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

zz = double(img);

 %----------------------------------------------------------
 %自己的边缘检测函数
 [m theta sector canny1  canny2 bin] = canny1step(img, 22);
  [msrc thetasrc sectorsrc c1src  c2src binsrc] = canny1step(imgsrc, 22);
 %Matlab自带的边缘检测
 ed = edge(img, 'canny', 0.5); 
 
 
[xx, yy] = meshgrid(1:x, 1:y);

% figure(1)
%     %mesh(yy, xx, zz);
%     surf(yy, xx, zz);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Grayscale');
%     axis tight

figure(2)    
%     subplot(4,2,1);
%         imshow(imgsrc);%原图
%     subplot(3,2,1);
        figure;clf;imshow(img);hold on;title('高斯滤波后','FontSize',12);%高斯滤波后
%     subplot(3,2,2);
        figure;clf;imshow(uint8(m));hold on;title('导数','FontSize',12);%导数
%     subplot(3,2,3);
        figure;clf;imshow(uint8(canny1));hold on;title('非极大值抑制','FontSize',12);%非极大值抑制
%     subplot(3,2,4);
        figure;clf;imshow(uint8(canny2));hold on;title('双阈值','FontSize',12);%双阈值
%     subplot(3,2,5);
        figure;clf;imshow(ed);hold on;title('Matlab自带边缘检测','FontSize',12);%Matlab自带边缘检测
%     subplot(3,2,6);
        figure;clf;imshow(bin);hold on;title('我自己的bin','FontSize',12);%我自己的bin
    
% figure(3)
%     edzz = 255*double(ed);
%     mesh(yy,xx,edzz);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Grayscale');
%     axis tight 
%  
% 
%  
% figure(4)
%     mesh(yy,xx,m);%画偏导数
%     xlabel('y');
%     ylabel('x');
%     zlabel('Derivative');
%     axis tight 
%  
% figure(5)
%     mesh(yy,xx,theta);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Theta');
%     axis tight
%  
% figure(6)
%     mesh(yy,xx,sector);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Sector');
%     axis tight
%     
% figure(7)
%     mesh(yy,xx,canny2);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Sector');
%     axis tight

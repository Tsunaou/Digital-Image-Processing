%DIP16 Assignment 2
%Edge Detection
%In this assignment, you should build your own edge detection and edge linking 
%function to detect the edges of a image.
%Please Note you cannot use the build-in matlab edge and bwtraceboundary function
%We supply four test images, and you can use others to show your results for edge
%detection, but you just need do edge linking for rubberband_cap.png.
clc; clear all;
% Load the test image
% 选择要读取的图片
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
% imgTest = im2double(imread('../asset/image/bird.png'));
% imgTest = im2double(imread('../asset/image/giraffe.jpg'));
% imgTest = im2double(imread('../asset/image/noise.jpg'));
% imgTest = im2double(imread('../asset/image/noise2.jpg'));

imgTestGray = rgb2gray(imgTest); %将输入转为灰度图
% figure; clf;imshow(imgTestGray);title('原灰度图')

%now call your function my_edge, you can use matlab edge function to see
% %the last result as a reference first
img_edge = edge(imgTestGray);

%{  边缘检测的效果  %}  
% % 1.库函数效果
% img_edge_original = edge(imgTestGray);
% figure;clf;imshow(img_edge_original);title('库函数效果')
% 2.roberts算子
img_edge_roberts = my_roberts(imgTestGray);
% figure;clf;imshow(img_edge_roberts);title('Roberts效果')
% % 3.prewitt算子
% img_edge_prewitt = my_prewitt(imgTestGray);
% figure;clf;imshow(img_edge_prewitt);title('Prewitt效果')
% % 4.sobel算子
% img_edge_sobel = my_sobel(imgTestGray);
% figure;clf;imshow(img_edge_sobel);title('Sobel效果')
% % % 5.Marr-Hildreth方法
% img_edge_marr = my_marr(imgTestGray,4);
% figure;clf;imshow(img_edge_marr);title('Marr效果')
% % 6.Canny方法
% img_edge_canny = my_canny(imgTestGray);
% figure;clf;imshow(img_edge_canny);title('Canny效果')

% 对比模版
subplot(1,2,1);imshow(imgTestGray);hold on;title('原灰度图','FontSize',12);
subplot(1,2,2);imshow(img_edge_roberts);hold on;title('Roberts效果','FontSize',12);

% 所有方法对比
% subplot(2,3,1);imshow(img_edge_original);hold on;title('库函数','FontSize',12);
% subplot(2,3,2);imshow(img_edge_roberts);hold on;title('Roberts算子','FontSize',12);
% subplot(2,3,3);imshow(img_edge_prewitt);hold on;title('Prewitt算子','FontSize',12);
% subplot(2,3,4);imshow(img_edge_sobel);hold on;title('Sobel算子','FontSize',12);
% subplot(2,3,5);imshow(img_edge_marr);hold on;title('Marr-Hildreth','FontSize',12);
% subplot(2,3,6);imshow(img_edge_canny);hold on;title('Canny','FontSize',12);

% % my_edge_集成测试
% img_edge_marr = my_edge(imgTestGray,'c');
% figure;clf;imshow(img_edge_marr);title('myedge测试')

%{  下面开始，是边缘连接的领域了  %}  

%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 

%{  边缘追踪步骤1：选择要追踪的二值图  %}  
% img_link = img_edge_marr;  %准备对其边缘连接的图
% % imtool(img_link);
% background = im2bw(imgTest, 1);

%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.

%{  边缘追踪步骤2：选取边缘追踪的起始点  %}  
% % rubberband_cap
% col = 170;
% row = find(img_link(:,col),1);

% row = 92;
% col = 47;

% % giraffe
% row = 530;
% col = 418;


%{  库函数的边缘检测  %}  
% dim=size(img_link);
% col=round(dim(2)/2)-90;  %设定一个列坐标
% row=find(img_link(:,col),1); %在该列中找到第一个不为0的像素坐标
% CONNectivity=8; %8联通方式
% Bxpc = bwtraceboundary(img_link, [row,col], 'N',8);

%{  边缘追踪步骤3：自己实现的边缘检测 %}  
% Bxpc = my_edgelinking(img_link, row , col);

%{  边缘追踪步骤4：结果展示%}  
% figure; clf; imshow(background);title('边缘追踪','FontSize',12);
% hold on;
% plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);
% title('边缘追踪','FontSize',12);
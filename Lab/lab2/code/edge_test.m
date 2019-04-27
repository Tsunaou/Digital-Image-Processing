%DIP16 Assignment 2
%Edge Detection
%In this assignment, you should build your own edge detection and edge linking 
%function to detect the edges of a image.
%Please Note you cannot use the build-in matlab edge and bwtraceboundary function
%We supply four test images, and you can use others to show your results for edge
%detection, but you just need do edge linking for rubberband_cap.png.
clc; clear all;
% Load the test image
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
% imgTest = im2double(imread('../asset/image/5.jpg'));
% imgTest = im2double(imread('../asset/image/a.jpg'));

imgTestGray = rgb2gray(imgTest);
figure; clf;imshow(imgTestGray);title('原灰度图')

%now call your function my_edge, you can use matlab edge function to see
% %the last result as a reference first
img_edge = edge(imgTestGray);
% 1.库函数效果
img_edge_original = edge(imgTestGray);
figure;clf;imshow(img_edge_original);title('库函数效果')
% % 2.sobel算子
% img_edge_sobel = my_sobel(imgTestGray);
% figure;clf;imshow(img_edge_sobel);title('Sobel效果')
% % 3.prewitt算子
% img_edge_prewitt = my_prewitt(imgTestGray);
% figure;clf;imshow(img_edge_prewitt);title('Prewitt效果')
% % 4.roberts算子
% img_edge_roberts = my_roberts(imgTestGray);
% figure;clf;imshow(img_edge_roberts);title('Roberts效果')
% % 5.marr方法
% img_edge_laplacian = my_laplacian(imgTestGray);
% img_edge_marr = my_marr(imgTestGray);
% figure;clf;imshow(img_edge_marr);title('Marr效果')
% 6.Canny方法
img_edge_canny = my_canny(imgTestGray);
figure;clf;imshow(img_edge_canny);title('Canny效果')

% 出于效果原因，先不考虑Laplacian
% figure;clf;imshow(img_edge_laplacian);title('Laplacian效果')

% subplot(2,3,1);imshow(imgTestGray);hold on;title('原图','FontSize',12);
% subplot(2,3,2);imshow(img_edge_original);hold on;title('库函数','FontSize',12);
% subplot(2,3,3);imshow(img_edge_sobel);hold on;title('Sobel算子','FontSize',12);
% subplot(2,3,4);imshow(img_edge_prewitt);hold on;title('Prewitt算子','FontSize',12);
% subplot(2,3,5);imshow(img_edge_roberts);hold on;title('Roberts算子','FontSize',12);
% subplot(2,3,6);imshow(img_edge_laplacian);hold on;title('Laplacian算子','FontSize',12);

% background = im2bw(imgTest, 1);
% figure;clf;
% imshow(background);
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
% imtool(img_edge);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
% Bxpc = bwtraceboundary(img_edge, [47, 94], 'N');
% Bxpc = my_edgelinking(img_edge, 94 , 47);
% imshow(Bxpc);title('边缘追踪','FontSize',12);
% hold on;
% plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);
% title('边缘追踪','FontSize',12);
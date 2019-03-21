%test histeq
% ----灰度图像----
% I = imread('../asset/gray.jpg');
% ----彩色图像----
% I = imread('../asset/wiki1.jpg'); 
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
% I = imread('../asset/small_xin.png');
% I = imread('../asset/xin.png');

[J] = Histogram_equalization(I);    %彩色图像分RGB通道均衡化
[HSV] = HSV_equalization(I);        %彩色图像转HSV图像，对V通道均衡化
[HSI] = HSI_equalization(I);        %彩色图像转HSI图像，对I通道均衡化
[S] = Hiseq_standard(I);            %使用库函数均衡化

subplot(2,2,1);imshow(I);hold on;title('原图','FontSize',12);
subplot(2,2,2);imshow(J);hold on;title('基于RGB直方图均衡化','FontSize',12);
subplot(2,2,3);imshow(HSV);hold on;title('基于HSV函数直方图均衡化','FontSize',12);
subplot(2,2,4);imshow(HSI);hold on;title('基于HSI函数直方图均衡化','FontSize',12);


%直方图对比
% Histogram_display(I,HSV,HSI);
%图片对比
% Image_display(I,J,S);

%     figure, imshow(I)
%     figure, imshow(J)
%     figure, imshow(HSV)
%     figure, imshow(HSI)

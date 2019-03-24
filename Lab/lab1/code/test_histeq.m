%test histeq
% ----灰度图像----
% I = imread('../asset/gray.jpg');
% I = imread('../asset/gray2.png');
% I = imread('../asset/gray3.jpg');
% I = imread('../asset/gray4.jpg'); 
% ----彩色图像----
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
% I = imread('../asset/small_xin.png');
I = imread('../asset/xin.png');
% I = imread('../asset/reborn.png');
% I = imread('../asset/saber.jpg');

[J] = Histogram_equalization(I);    %灰度图直接均衡化，彩色图像分RGB通道均衡化
[HSV] = HSV_equalization(I);        %灰度图直接均衡化，彩色图像转HSV图像，对V通道均衡化
[HSI] = HSI_equalization(I);        %灰度图直接均衡化，彩色图像转HSI图像，对I通道均衡化
[S] = Hiseq_standard(I);            %使用库函数均衡化（禁忌的histeq，不过用来测试应该还可以）


%直方图对比
% Histogram_display(I,J,S,I);% 灰度图
% Histogram_display(I,J,HSV,HSI);% 彩色图
%图片对比
% Image_display(I,J,S);% 灰度图
% Image_display(I,J,HSV,HSI);% 彩色图



%test histeq
% ----灰度图像----
% I = imread('../asset/image/gray.jpg');
% I = imread('../asset/image/gray2.png');
% I = imread('../asset/image/gray3.jpg');
% I = imread('../asset/image/gray4.jpg'); 
% ----彩色图像----
I = imread('../asset/image/color.jpg');
% I = imread('../asset/image/example.png');
% I = imread('../asset/image/xin.png');
% I = imread('../asset/image/reborn.png');
% I = imread('../asset/image/saber.jpg');

[J] = Histogram_equalization(I);    %灰度图直接均衡化，彩色图像分RGB通道均衡化
[HSV] = HSV_equalization(I);        %灰度图直接均衡化，彩色图像转HSV图像，对V通道均衡化
[HSI] = HSI_equalization(I);        %灰度图直接均衡化，彩色图像转HSI图像，对I通道均衡化
[S] = Hiseq_standard(I);            %使用库函数均衡化（禁忌的histeq，不过用来测试应该还可以）


%直方图对比(小图+直方图)
% Histogram_display(I,J,S,I);% 灰度图
% Histogram_display(I,J,HSV,HSI);% 彩色图

%图片对比（小图同框）
% Image_display(I,J,S,I,0);% 灰度图
Image_display(I,J,HSV,HSI,0);% 彩色图

%大图对比(修改 上述参数0为1即可)

%存储图像
% imwrite(I,'../doc/big/r1.jpg');
% imwrite(J,'../doc/big/r2.jpg');
% imwrite(HSV,'../doc/big/r3.jpg');
% imwrite(HSI,'../doc/big/r4.jpg');




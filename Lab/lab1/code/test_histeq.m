%test histeq
% I = imread('../asset/wiki1.jpg'); 
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
% I = imread('../asset/gray.jpg');
I = imread('../asset/small_xin.png');
% I = imread('../asset/xin.png');

[J] = Histogram_equalization(I);
[HSV] = HSV_equalization(I);
[HSI] = HSI_equalization(I);
[S] = Hiseq_standard(I);

    subplot(2,2,1);imshow(I);hold on;title('原图','FontSize',12);
    subplot(2,2,2);imshow(J);hold on;title('基于RGB直方图均衡化','FontSize',12);
    subplot(2,2,3);imshow(HSV);hold on;title('基于HSV函数直方图均衡化','FontSize',12);
    subplot(2,2,4);imshow(HSI);hold on;title('基于HSI函数直方图均衡化','FontSize',12);

%     subplot(2,2,4);imshow(S);hold on;title('库函数','FontSize',12);

%直方图对比
% Histogram_display(I,HSV,HSI);
%图片对比
% Image_display(I,J,S);

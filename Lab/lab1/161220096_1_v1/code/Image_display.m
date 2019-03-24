function [] = Image_display(IMG_Origin,IMG_Mine,IMG_A,IMG_B)
%IMAGE_DISPLAY 此处显示有关此函数的摘要
%   展示图片对比
    dem = length(size(IMG_Origin));
    switch dem
        case 2
            subplot(2,2,1);imshow(IMG_Origin);hold on;title('原图','FontSize',12);
            subplot(2,2,2);imshow(IMG_Mine);hold on;title('我的函数','FontSize',12);
            subplot(2,2,3);imshow(IMG_A);hold on;title('库函数','FontSize',12);
%             figure, imshow(IMG_Origin)
%             figure, imshow(IMG_Mine)
%             figure, imshow(IMG_A)
        case 3
            subplot(2,2,1);imshow(IMG_Origin);hold on;title('原图','FontSize',12);
            subplot(2,2,2);imshow(IMG_Mine);hold on;title('基于RGB直方图均衡化','FontSize',12);
            subplot(2,2,3);imshow(IMG_A);hold on;title('基于HSV函数直方图均衡化','FontSize',12);
            subplot(2,2,4);imshow(IMG_B);hold on;title('基于HSI函数直方图均衡化','FontSize',12);
%             figure, imshow(IMG_Origin)
%             figure, imshow(IMG_Mine)
%             figure, imshow(IMG_A)
%             figure, imshow(IMG_B)
    end  
end


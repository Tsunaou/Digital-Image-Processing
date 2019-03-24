function [] = Histogram_display(IMG_Origin,IMG_Mine,IMG_A,IMG_B)
    dem = length(size(IMG_Origin));
    switch dem
        case 2
            subplot(3,2,1);imshow(IMG_Origin);hold on;title('原图','FontSize',12);
            subplot(3,2,3);imshow(IMG_Mine);hold on;title('我的函数','FontSize',12);
            subplot(3,2,5);imshow(IMG_A);hold on;title('库函数','FontSize',12);
            subplot(3,2,2);imhist(IMG_Origin);hold on;title('原图','FontSize',12);
            subplot(3,2,4);imhist(IMG_Mine);hold on;title('我的函数','FontSize',12);
            subplot(3,2,6);imhist(IMG_A);hold on;title('库函数','FontSize',12);
        case 3
            subplot(4,4,1);imshow(IMG_Origin);hold on;title('原图','FontSize',12);
            subplot(4,4,2);imhist(IMG_Origin(:,:,1));hold on;title('原图 R','FontSize',12);
            subplot(4,4,3);imhist(IMG_Origin(:,:,2));hold on;title('原图 G','FontSize',12);
            subplot(4,4,4);imhist(IMG_Origin(:,:,3));hold on;title('原图 B','FontSize',12);
            
            subplot(4,4,5);imshow(IMG_Mine);hold on;title('基于RGB直方图均衡化','FontSize',12);
            subplot(4,4,6);imhist(IMG_Mine(:,:,1));hold on;title('RGB法 R','FontSize',12);
            subplot(4,4,7);imhist(IMG_Mine(:,:,2));hold on;title('RGB法 G','FontSize',12);
            subplot(4,4,8);imhist(IMG_Mine(:,:,3));hold on;title('RGB法 B','FontSize',12);
            
            subplot(4,4,9);imshow(IMG_A);hold on;title('基于HSV函数直方图均衡化','FontSize',12);
            subplot(4,4,10);imhist(IMG_A(:,:,1));hold on;title('HSV R','FontSize',12);
            subplot(4,4,11);imhist(IMG_A(:,:,2));hold on;title('HSV G','FontSize',12);
            subplot(4,4,12);imhist(IMG_A(:,:,3));hold on;title('HSV B','FontSize',12);
            
            subplot(4,4,13);imshow(IMG_B);hold on;title('基于HSI函数直方图均衡化','FontSize',12);
            subplot(4,4,14);imhist(IMG_B(:,:,1));hold on;title('HSI R','FontSize',12);
            subplot(4,4,15);imhist(IMG_B(:,:,2));hold on;title('HSI G','FontSize',12);
            subplot(4,4,16);imhist(IMG_B(:,:,3));hold on;title('HSI B','FontSize',12);
    end  
end


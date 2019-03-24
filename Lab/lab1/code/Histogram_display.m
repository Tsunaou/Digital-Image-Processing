function [] = Histogram_display(IMG_Origin,IMG_Mine,IMG_A,IMG_B)
    dem = length(size(IMG_Origin));
    switch dem
        case 2
            subplot(2,2,1);imhist(IMG_Origin);hold on;title('原图','FontSize',12);
            subplot(2,2,2);imhist(IMG_Mine);hold on;title('我的函数','FontSize',12);
            subplot(2,2,3);imhist(IMG_A);hold on;title('库函数','FontSize',12);
        case 3
            subplot(4,3,1);imhist(IMG_Origin(:,:,1));hold on;title('原图 R','FontSize',12);
            subplot(4,3,2);imhist(IMG_Origin(:,:,2));hold on;title('原图 G','FontSize',12);
            subplot(4,3,3);imhist(IMG_Origin(:,:,3));hold on;title('原图 B','FontSize',12);
            subplot(4,3,4);imhist(IMG_Mine(:,:,1));hold on;title('RGB法 R','FontSize',12);
            subplot(4,3,5);imhist(IMG_Mine(:,:,2));hold on;title('RGB法 G','FontSize',12);
            subplot(4,3,6);imhist(IMG_Mine(:,:,3));hold on;title('RGB法 B','FontSize',12);
            subplot(4,3,7);imhist(IMG_A(:,:,1));hold on;title('HSV R','FontSize',12);
            subplot(4,3,8);imhist(IMG_A(:,:,2));hold on;title('HSV G','FontSize',12);
            subplot(4,3,9);imhist(IMG_A(:,:,3));hold on;title('HSV B','FontSize',12);
            subplot(4,3,10);imhist(IMG_B(:,:,1));hold on;title('HSI R','FontSize',12);
            subplot(4,3,11);imhist(IMG_B(:,:,2));hold on;title('HSI G','FontSize',12);
            subplot(4,3,12);imhist(IMG_B(:,:,3));hold on;title('HSI B','FontSize',12);
    end  
end


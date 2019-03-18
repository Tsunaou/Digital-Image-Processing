function [] = Histogram_display(IMG_Origin,IMG_Mine,IMG_Func)
    dem = length(size(IMG_Origin));
    switch dem
        case 2
            subplot(2,2,1);imhist(IMG_Origin);hold on;title('ԭͼ','FontSize',12);
            subplot(2,2,2);imhist(IMG_Mine);hold on;title('�ҵĺ���','FontSize',12);
            subplot(2,2,3);imhist(IMG_Func);hold on;title('�⺯��','FontSize',12);
        case 3
            subplot(3,3,1);imhist(IMG_Origin(:,:,1));hold on;title('ԭͼ R','FontSize',12);
            subplot(3,3,2);imhist(IMG_Origin(:,:,2));hold on;title('ԭͼ G','FontSize',12);
            subplot(3,3,3);imhist(IMG_Origin(:,:,3));hold on;title('ԭͼ B','FontSize',12);
            subplot(3,3,4);imhist(IMG_Mine(:,:,1));hold on;title('�ҵĺ��� R','FontSize',12);
            subplot(3,3,5);imhist(IMG_Mine(:,:,2));hold on;title('�ҵĺ��� G','FontSize',12);
            subplot(3,3,6);imhist(IMG_Mine(:,:,3));hold on;title('�ҵĺ��� B','FontSize',12);
            subplot(3,3,7);imhist(IMG_Func(:,:,1));hold on;title('�⺯�� R','FontSize',12);
            subplot(3,3,8);imhist(IMG_Func(:,:,2));hold on;title('�⺯�� G','FontSize',12);
            subplot(3,3,9);imhist(IMG_Func(:,:,3));hold on;title('�⺯�� B','FontSize',12);
    end  
end


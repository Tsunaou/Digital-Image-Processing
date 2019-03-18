function [] = Image_display(IMG_Origin,IMG_Mine,IMG_Func)
%IMAGE_DISPLAY 此处显示有关此函数的摘要
%   展示图片对比
    subplot(2,2,1);imshow(IMG_Origin);hold on;title('原图','FontSize',12);
    subplot(2,2,2);imshow(IMG_Mine);hold on;title('我的函数','FontSize',12);
    subplot(2,2,3);imshow(IMG_Func);hold on;title('库函数','FontSize',12);

%     figure, imshow(I)
%     figure, imshow(J)
%     figure, imshow(S)
end


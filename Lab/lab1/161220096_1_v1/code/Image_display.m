function [] = Image_display(IMG_Origin,IMG_Mine,IMG_A,IMG_B)
%IMAGE_DISPLAY �˴���ʾ�йش˺�����ժҪ
%   չʾͼƬ�Ա�
    dem = length(size(IMG_Origin));
    switch dem
        case 2
            subplot(2,2,1);imshow(IMG_Origin);hold on;title('ԭͼ','FontSize',12);
            subplot(2,2,2);imshow(IMG_Mine);hold on;title('�ҵĺ���','FontSize',12);
            subplot(2,2,3);imshow(IMG_A);hold on;title('�⺯��','FontSize',12);
%             figure, imshow(IMG_Origin)
%             figure, imshow(IMG_Mine)
%             figure, imshow(IMG_A)
        case 3
            subplot(2,2,1);imshow(IMG_Origin);hold on;title('ԭͼ','FontSize',12);
            subplot(2,2,2);imshow(IMG_Mine);hold on;title('����RGBֱ��ͼ���⻯','FontSize',12);
            subplot(2,2,3);imshow(IMG_A);hold on;title('����HSV����ֱ��ͼ���⻯','FontSize',12);
            subplot(2,2,4);imshow(IMG_B);hold on;title('����HSI����ֱ��ͼ���⻯','FontSize',12);
%             figure, imshow(IMG_Origin)
%             figure, imshow(IMG_Mine)
%             figure, imshow(IMG_A)
%             figure, imshow(IMG_B)
    end  
end


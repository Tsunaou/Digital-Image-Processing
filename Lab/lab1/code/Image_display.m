function [] = Image_display(IMG_Origin,IMG_Mine,IMG_Func)
%IMAGE_DISPLAY �˴���ʾ�йش˺�����ժҪ
%   չʾͼƬ�Ա�
    subplot(2,2,1);imshow(IMG_Origin);hold on;title('ԭͼ','FontSize',12);
    subplot(2,2,2);imshow(IMG_Mine);hold on;title('�ҵĺ���','FontSize',12);
    subplot(2,2,3);imshow(IMG_Func);hold on;title('�⺯��','FontSize',12);

%     figure, imshow(I)
%     figure, imshow(J)
%     figure, imshow(S)
end


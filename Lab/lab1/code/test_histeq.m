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

    subplot(2,2,1);imshow(I);hold on;title('ԭͼ','FontSize',12);
    subplot(2,2,2);imshow(J);hold on;title('����RGBֱ��ͼ���⻯','FontSize',12);
    subplot(2,2,3);imshow(HSV);hold on;title('����HSV����ֱ��ͼ���⻯','FontSize',12);
    subplot(2,2,4);imshow(HSI);hold on;title('����HSI����ֱ��ͼ���⻯','FontSize',12);

%     subplot(2,2,4);imshow(S);hold on;title('�⺯��','FontSize',12);

%ֱ��ͼ�Ա�
% Histogram_display(I,HSV,HSI);
%ͼƬ�Ա�
% Image_display(I,J,S);

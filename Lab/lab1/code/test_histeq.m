%test histeq
% ----�Ҷ�ͼ��----
% I = imread('../asset/gray.jpg');
% ----��ɫͼ��----
% I = imread('../asset/wiki1.jpg'); 
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
% I = imread('../asset/small_xin.png');
% I = imread('../asset/xin.png');

[J] = Histogram_equalization(I);    %��ɫͼ���RGBͨ�����⻯
[HSV] = HSV_equalization(I);        %��ɫͼ��תHSVͼ�񣬶�Vͨ�����⻯
[HSI] = HSI_equalization(I);        %��ɫͼ��תHSIͼ�񣬶�Iͨ�����⻯
[S] = Hiseq_standard(I);            %ʹ�ÿ⺯�����⻯

subplot(2,2,1);imshow(I);hold on;title('ԭͼ','FontSize',12);
subplot(2,2,2);imshow(J);hold on;title('����RGBֱ��ͼ���⻯','FontSize',12);
subplot(2,2,3);imshow(HSV);hold on;title('����HSV����ֱ��ͼ���⻯','FontSize',12);
subplot(2,2,4);imshow(HSI);hold on;title('����HSI����ֱ��ͼ���⻯','FontSize',12);


%ֱ��ͼ�Ա�
% Histogram_display(I,HSV,HSI);
%ͼƬ�Ա�
% Image_display(I,J,S);

%     figure, imshow(I)
%     figure, imshow(J)
%     figure, imshow(HSV)
%     figure, imshow(HSI)

%test histeq
% ----�Ҷ�ͼ��----
% I = imread('../asset/gray.jpg');
% I = imread('../asset/gray2.png');
% I = imread('../asset/gray3.jpg');
% I = imread('../asset/gray4.jpg'); 
% ----��ɫͼ��----
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
% I = imread('../asset/small_xin.png');
% I = imread('../asset/xin.png');
% I = imread('../asset/reborn.png');
% I = imread('../asset/saber.jpg');
I = imread('../asset/zy.jpg');

[J] = Histogram_equalization(I);    %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ���RGBͨ�����⻯
[HSV] = HSV_equalization(I);        %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ��תHSVͼ�񣬶�Vͨ�����⻯
[HSI] = HSI_equalization(I);        %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ��תHSIͼ�񣬶�Iͨ�����⻯
[S] = Hiseq_standard(I);            %ʹ�ÿ⺯�����⻯�����ɵ�histeq��������������Ӧ�û����ԣ�


%ֱ��ͼ�Ա�(Сͼ+ֱ��ͼ)
% Histogram_display(I,J,S,I);% �Ҷ�ͼ
% Histogram_display(I,J,HSV,HSI);% ��ɫͼ

%ͼƬ�Աȣ�Сͼ��
% Image_display(I,J,S,I);% �Ҷ�ͼ
Image_display(I,J,HSV,HSI);% ��ɫͼ

%��ͼ�Ա�(�޸� Image_displayע�ͼ���)



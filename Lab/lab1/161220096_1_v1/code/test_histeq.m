%test histeq
% ----�Ҷ�ͼ��----
% I = imread('../asset/image/gray.jpg');
% I = imread('../asset/image/gray2.png');
% I = imread('../asset/image/gray3.jpg');
% I = imread('../asset/image/gray4.jpg'); 
% ----��ɫͼ��----
I = imread('../asset/image/color.jpg');
% I = imread('../asset/image/example.png');
% I = imread('../asset/image/xin.png');
% I = imread('../asset/image/reborn.png');
% I = imread('../asset/image/saber.jpg');

[J] = Histogram_equalization(I);    %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ���RGBͨ�����⻯
[HSV] = HSV_equalization(I);        %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ��תHSVͼ�񣬶�Vͨ�����⻯
[HSI] = HSI_equalization(I);        %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ��תHSIͼ�񣬶�Iͨ�����⻯
[S] = Hiseq_standard(I);            %ʹ�ÿ⺯�����⻯�����ɵ�histeq��������������Ӧ�û����ԣ�


%ֱ��ͼ�Ա�(Сͼ+ֱ��ͼ)
% Histogram_display(I,J,S,I);% �Ҷ�ͼ
Histogram_display(I,J,HSV,HSI);% ��ɫͼ

%ͼƬ�Աȣ�Сͼͬ��
% Image_display(I,J,S,I,0);% �Ҷ�ͼ
% Image_display(I,J,HSV,HSI,0);% ��ɫͼ

%��ͼ�Ա�(�޸� ��������0Ϊ1����)



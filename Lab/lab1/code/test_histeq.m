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
I = imread('../asset/xin.png');
% I = imread('../asset/reborn.png');
% I = imread('../asset/saber.jpg');

[J] = Histogram_equalization(I);    %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ���RGBͨ�����⻯
[HSV] = HSV_equalization(I);        %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ��תHSVͼ�񣬶�Vͨ�����⻯
[HSI] = HSI_equalization(I);        %�Ҷ�ͼֱ�Ӿ��⻯����ɫͼ��תHSIͼ�񣬶�Iͨ�����⻯
[S] = Hiseq_standard(I);            %ʹ�ÿ⺯�����⻯�����ɵ�histeq��������������Ӧ�û����ԣ�


%ֱ��ͼ�Ա�
% Histogram_display(I,J,S,I);% �Ҷ�ͼ
% Histogram_display(I,J,HSV,HSI);% ��ɫͼ
%ͼƬ�Ա�
% Image_display(I,J,S);% �Ҷ�ͼ
% Image_display(I,J,HSV,HSI);% ��ɫͼ



%���߸��٣��������������������򷵻�������������
clc;
clear all;
rgb=imread('../asset/image/rubberband_cap.png');
figure;
imshow(rgb);
title('ԭʼͼ��');
I=rgb2gray(rgb);
threashold=graythresh(I); %ʹ�ô˺����ҵ������ֵ
bw=im2bw(I,threashold); %ʹ�ô���ֵ��ͼ��ת��Ϊ��ֵͼ
bw = edge(bw);
figure;
imshow(bw);
title('��ֵͼ��');
dim=size(bw);
col=round(dim(2)/2)-90;  %�趨һ��������
row=find(bw(:,col),1); %�ڸ������ҵ���һ����Ϊ0����������
CONNectivity=8; %8��ͨ��ʽ
num_points=360; %�趨�����ֵ
contour=bwtraceboundary(bw,[row,col],'N',CONNectivity,num_points); %ʹ�øú����ҵ������Ըĵ�Ϊ��������
%contour�б���������е������
figure;
imshow(rgb);
hold on;
plot(contour(:,2),contour(:,1),'b','LineWidth',2); %��ԭͼ�л�����
title('���ͼ��');

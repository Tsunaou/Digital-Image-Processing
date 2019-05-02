%DIP16 Assignment 2
%Edge Detection
%In this assignment, you should build your own edge detection and edge linking 
%function to detect the edges of a image.
%Please Note you cannot use the build-in matlab edge and bwtraceboundary function
%We supply four test images, and you can use others to show your results for edge
%detection, but you just need do edge linking for rubberband_cap.png.
clc; clear all;
% Load the test image
% ѡ��Ҫ��ȡ��ͼƬ
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
% imgTest = im2double(imread('../asset/image/bird.png'));
% imgTest = im2double(imread('../asset/image/giraffe.jpg'));
% imgTest = im2double(imread('../asset/image/noise.jpg'));
% imgTest = im2double(imread('../asset/image/noise2.jpg'));

imgTestGray = rgb2gray(imgTest); %������תΪ�Ҷ�ͼ
% figure; clf;imshow(imgTestGray);title('ԭ�Ҷ�ͼ')

%now call your function my_edge, you can use matlab edge function to see
% %the last result as a reference first
img_edge = edge(imgTestGray);

%{  ��Ե����Ч��  %}  
% % 1.�⺯��Ч��
% img_edge_original = edge(imgTestGray);
% figure;clf;imshow(img_edge_original);title('�⺯��Ч��')
% 2.roberts����
img_edge_roberts = my_roberts(imgTestGray);
% figure;clf;imshow(img_edge_roberts);title('RobertsЧ��')
% % 3.prewitt����
% img_edge_prewitt = my_prewitt(imgTestGray);
% figure;clf;imshow(img_edge_prewitt);title('PrewittЧ��')
% % 4.sobel����
% img_edge_sobel = my_sobel(imgTestGray);
% figure;clf;imshow(img_edge_sobel);title('SobelЧ��')
% % % 5.Marr-Hildreth����
% img_edge_marr = my_marr(imgTestGray,4);
% figure;clf;imshow(img_edge_marr);title('MarrЧ��')
% % 6.Canny����
% img_edge_canny = my_canny(imgTestGray);
% figure;clf;imshow(img_edge_canny);title('CannyЧ��')

% �Ա�ģ��
subplot(1,2,1);imshow(imgTestGray);hold on;title('ԭ�Ҷ�ͼ','FontSize',12);
subplot(1,2,2);imshow(img_edge_roberts);hold on;title('RobertsЧ��','FontSize',12);

% ���з����Ա�
% subplot(2,3,1);imshow(img_edge_original);hold on;title('�⺯��','FontSize',12);
% subplot(2,3,2);imshow(img_edge_roberts);hold on;title('Roberts����','FontSize',12);
% subplot(2,3,3);imshow(img_edge_prewitt);hold on;title('Prewitt����','FontSize',12);
% subplot(2,3,4);imshow(img_edge_sobel);hold on;title('Sobel����','FontSize',12);
% subplot(2,3,5);imshow(img_edge_marr);hold on;title('Marr-Hildreth','FontSize',12);
% subplot(2,3,6);imshow(img_edge_canny);hold on;title('Canny','FontSize',12);

% % my_edge_���ɲ���
% img_edge_marr = my_edge(imgTestGray,'c');
% figure;clf;imshow(img_edge_marr);title('myedge����')

%{  ���濪ʼ���Ǳ�Ե���ӵ�������  %}  

%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 

%{  ��Ե׷�ٲ���1��ѡ��Ҫ׷�ٵĶ�ֵͼ  %}  
% img_link = img_edge_marr;  %׼�������Ե���ӵ�ͼ
% % imtool(img_link);
% background = im2bw(imgTest, 1);

%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.

%{  ��Ե׷�ٲ���2��ѡȡ��Ե׷�ٵ���ʼ��  %}  
% % rubberband_cap
% col = 170;
% row = find(img_link(:,col),1);

% row = 92;
% col = 47;

% % giraffe
% row = 530;
% col = 418;


%{  �⺯���ı�Ե���  %}  
% dim=size(img_link);
% col=round(dim(2)/2)-90;  %�趨һ��������
% row=find(img_link(:,col),1); %�ڸ������ҵ���һ����Ϊ0����������
% CONNectivity=8; %8��ͨ��ʽ
% Bxpc = bwtraceboundary(img_link, [row,col], 'N',8);

%{  ��Ե׷�ٲ���3���Լ�ʵ�ֵı�Ե��� %}  
% Bxpc = my_edgelinking(img_link, row , col);

%{  ��Ե׷�ٲ���4�����չʾ%}  
% figure; clf; imshow(background);title('��Ե׷��','FontSize',12);
% hold on;
% plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);
% title('��Ե׷��','FontSize',12);
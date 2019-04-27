clear all;
clear
clc;
%����ͼ��
[filename, pathname] = uigetfile({'*.jpg'; '*.bmp';  '*.png'; '*.gif'}, 'ѡ��ͼƬ');

%û��ͼ��
if filename == 0
    return;
end

imgsrc = imread([pathname, filename]);
[y, x, dim] = size(imgsrc);

%ת��Ϊ�Ҷ�ͼ
if dim>1
    imgsrc = rgb2gray(imgsrc);
end

sigma = 1;
gausFilter = fspecial('gaussian', [3,3], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

zz = double(img);

 %----------------------------------------------------------
 %�Լ��ı�Ե��⺯��
 [m theta sector canny1  canny2 bin] = canny1step(img, 22);
  [msrc thetasrc sectorsrc c1src  c2src binsrc] = canny1step(imgsrc, 22);
 %Matlab�Դ��ı�Ե���
 ed = edge(img, 'canny', 0.5); 
 
 
[xx, yy] = meshgrid(1:x, 1:y);

% figure(1)
%     %mesh(yy, xx, zz);
%     surf(yy, xx, zz);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Grayscale');
%     axis tight

figure(2)    
%     subplot(4,2,1);
%         imshow(imgsrc);%ԭͼ
%     subplot(3,2,1);
        figure;clf;imshow(img);hold on;title('��˹�˲���','FontSize',12);%��˹�˲���
%     subplot(3,2,2);
        figure;clf;imshow(uint8(m));hold on;title('����','FontSize',12);%����
%     subplot(3,2,3);
        figure;clf;imshow(uint8(canny1));hold on;title('�Ǽ���ֵ����','FontSize',12);%�Ǽ���ֵ����
%     subplot(3,2,4);
        figure;clf;imshow(uint8(canny2));hold on;title('˫��ֵ','FontSize',12);%˫��ֵ
%     subplot(3,2,5);
        figure;clf;imshow(ed);hold on;title('Matlab�Դ���Ե���','FontSize',12);%Matlab�Դ���Ե���
%     subplot(3,2,6);
        figure;clf;imshow(bin);hold on;title('���Լ���bin','FontSize',12);%���Լ���bin
    
% figure(3)
%     edzz = 255*double(ed);
%     mesh(yy,xx,edzz);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Grayscale');
%     axis tight 
%  
% 
%  
% figure(4)
%     mesh(yy,xx,m);%��ƫ����
%     xlabel('y');
%     ylabel('x');
%     zlabel('Derivative');
%     axis tight 
%  
% figure(5)
%     mesh(yy,xx,theta);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Theta');
%     axis tight
%  
% figure(6)
%     mesh(yy,xx,sector);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Sector');
%     axis tight
%     
% figure(7)
%     mesh(yy,xx,canny2);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Sector');
%     axis tight

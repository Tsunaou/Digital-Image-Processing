%test histeq
% I = imread('../asset/wiki1.jpg');
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
I = imread('../asset/gray.jpg');
[J] = Histogram_equalization(I);
[S] = Hiseq_standard(I);

%ֱ��ͼ�Ա�
% Histogram_display(I,J,S);
%ͼƬ�Ա�
Image_display(I,J,S);

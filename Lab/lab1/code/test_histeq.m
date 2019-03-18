%test histeq
% I = imread('../asset/wiki1.jpg');
% I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
I = imread('../asset/gray.jpg');
[J] = Histogram_equalization(I);
[S] = Hiseq_standard(I);

%直方图对比
% Histogram_display(I,J,S);
%图片对比
Image_display(I,J,S);

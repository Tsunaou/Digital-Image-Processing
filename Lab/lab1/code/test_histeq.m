%test histeq
% I = imread('../asset/wiki1.jpg');
I = imread('../asset/example.png');
% I = imread('../asset/color.jpg');
% I = imread('../asset/gray.jpg');
[J] = Histogram_equalization(I);
[S] = Hiseq_standard(I);
subplot(2,2,1);imshow(I);hold on;title('ԭͼ','FontSize',12);
subplot(2,2,2);imshow(J);hold on;title('�ҵĺ���','FontSize',12);
subplot(2,2,3);imshow(S);hold on;title('�⺯��','FontSize',12);

% figure, imshow(I)
% figure, imshow(J)
% figure, imshow(S)
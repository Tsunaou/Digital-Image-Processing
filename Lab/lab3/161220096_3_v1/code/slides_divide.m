clc; clear all;
Im = imread('./divide_output/m2.bmp');
Im = im2bw(Im); %��ֵ��
[m,n] = size(Im);
% ��ȥ�߿�
border = 10; %�߿���ռ�ٷֱ�
left = floor(m/border);
right = floor(m-m/border);
up = floor(n/border);
down = floor(n-n/border);
% ȥ�߿���ͼ
Im = Im(left:right,up:down);
[m,n] = size(Im);

max_row = 1;
max_col = 5;

height = m;
width = floor(n/max_col);

seg = cell(max_row,max_col);
%�ֿ�
for row = 1:max_row      
    for col = 1:max_col        
        seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 

for i=1:max_col
    subplot(1,5,i);imshow(seg{i});hold on;
    if mod(i,2)==1
        display(my_digit(seg{i}))
    else
        display(my_operator(seg{i}))
    end
end


% imshow(Im)
% hold on

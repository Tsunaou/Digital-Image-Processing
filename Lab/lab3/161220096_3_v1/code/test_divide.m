clc; clear all;
Im = imread('../asset/image/example.png');
imshow(Im)
hold on
L = size(Im);

max_row = 10;
max_col = 3;

height = floor(L(1)/max_row);
width = floor(L(2)/max_col);

seg = cell(max_row,max_col);
%分块
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 

%把第i帧的图片写为'mi.bmp'保存
for i=1:max_row*max_col
%     imshow(seg{i});
    imwrite(seg{i},strcat('./divide_output/m',int2str(i),'.bmp'));   
end

%画出分块的边界
for row = 1:max_row      
    for col = 1:max_col  
        rectangle('Position',[width*(col-1),height*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor','r');
    end
end 
hold off
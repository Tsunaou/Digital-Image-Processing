function output = my_calculator(input_image)
%in this function, you should finish the character recognition task.
%the input parameter is a matrix of an image which contains several expressions
%the output parameter is a matrix of an image which contains the results of expressions 

Im = input_image;
RGB = Im;
Im = im2bw(Im);
Im =  clear_boundary(Im);
L = size(Im);
[m,n] = size(Im);

%对图片按照方格进行划分
max_row = 10;
max_col = 3;

height = floor(L(1)/max_row);
width = floor(L(2)/max_col);

seg = cell(max_row,max_col);
start = cell(max_row,max_col);

%分块
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 

%把第i帧的图片写为'mi.bmp'保存
res = [];
start = [];
for i=1:max_row*max_col
%     imshow(seg{i});
%     imwrite(seg{i},strcat('./divide_output/m',int2str(i),'.bmp'));   
    [a,b] = caculate_line(seg{i});
    res = [res,a];
    start = [start,b];
end

%画出分块的边界，并写出结果
for row = 1:max_row      
    for col = 1:max_col  
        index = (col-1)*max_row + row;
        scale = max_col*10;
        x = width*(col-1)+start(index)+n/scale;
        y = height*(row-1)+m/(scale-1);
        content = int2str(res(index));
        off = m/(max_row*5);
        position = [x,y+off];
        RGB = insertText(RGB,position,content,'AnchorPoint','LeftCenter','FontSize',60,'BoxOpacity',0);
    end
end 
output = RGB;


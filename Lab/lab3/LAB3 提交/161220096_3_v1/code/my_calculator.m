function output = my_calculator(input_image)
%in this function, you should finish the character recognition task.
%the input parameter is a matrix of an image which contains several expressions
%the output parameter is a matrix of an image which contains the results of expressions 

Im = input_image;
RGB = Im;
Im = im2bw(Im); %二值化
Im =  clear_boundary(Im); %清除图片边缘，求最小外接矩形
L = size(Im);
[m,n] = size(Im);

%对图片按照方格进行划分
max_row = 10; %行数
max_col = 3; %列数

height = floor(L(1)/max_row); %每个算式方格的高度
width = floor(L(2)/max_col); %每个算式方格的宽度

seg = cell(max_row,max_col); %存储分割后每个位置的算式图片

%分块
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 

%分别计算每个方格算式的结果
res = []; %存储计算结果
start = []; %记录结果相对于方格的偏移量
for i=1:max_row*max_col
    [a,b] = caculate_line(seg{i});
    res = [res,a];
    start = [start,b];
end

%将结果写入原图并返回
for row = 1:max_row      
    for col = 1:max_col  
        index = (col-1)*max_row + row;
        scale = max_col*10; % 误差容许的缓冲量
        x = width*(col-1)+start(index)+n/scale; %结果的x坐标
        y = height*(row-1)+m/(scale-1); %结果的y坐标
        content = int2str(res(index)); %算式的计算结果
        off = m/(max_row*5); %写入图片结果的偏移量 
        position = [x,y+off]; %算式应该写入的位置
        RGB = insertText(RGB,position,content,'AnchorPoint','LeftCenter','FontSize',60,'BoxOpacity',0);
    end
end 
output = RGB;


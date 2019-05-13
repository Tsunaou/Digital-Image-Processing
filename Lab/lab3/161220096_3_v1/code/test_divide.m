clc; clear all;
% Im = imread('../asset/image/example.png');
% Im = imread('../asset/image/1.png');
% Im = imread('../asset/image/2.png');
% Im = imread('../asset/image/3.png');
% Im = imread('../asset/image/4.png');
Im = imread('../asset/image/5.png');
Im = im2bw(Im);
hold on
[m,n] = size(Im);
% 先去边框，试探空格
exist = [];
for i = 1:n
    tmp = find(Im(:,i)== 0);
    exist(i) = ~isempty(tmp);
end

% 分块
part = [];
sflag = 0;
eflag = 0;

for i = 1:length(exist)
    if(exist(i)==0 && sflag ==0 && eflag == 0)
        continue;
    elseif(exist(i)==1 && sflag ==0)
        sflag = i;
    elseif(exist(i)==0 && sflag ~=0)
        part = [part;[sflag,i]];
        sflag = 0;
    end
end
% 去边框后的图
left = part(1);
right = part(2);

% 先去边框，试探空格
exist = [];
for i = 1:m
    tmp = find(Im(i,:)== 0);
    exist(i) = ~isempty(tmp);
end

% 分块
part = [];
sflag = 0;
eflag = 0;

for i = 1:length(exist)
    if(exist(i)==0 && sflag ==0 && eflag == 0)
        continue;
    elseif(exist(i)==1 && sflag ==0)
        sflag = i;
    elseif(exist(i)==0 && sflag ~=0)
        part = [part;[sflag,i]];
        sflag = 0;
    end
end

up = part(1);
down = part(2);

Im =  Im(up:down,left:right);
imshow(Im)
L = size(Im);
[m,n] = size(Im);


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

%画出分块的边界
for row = 1:max_row      
    for col = 1:max_col  
        rectangle('Position',[width*(col-1),height*(row-1),width,height],...
         'LineWidth',2,'LineStyle','-','EdgeColor','r');
        index = (col-1)*max_row + row;
        scale = max_col*10;
        x = width*(col-1)+start(index)+n/scale;
        y = height*(row-1)+m/(scale-1);
        content = int2str(res(index));
        text(x,y,content,'FontSize',25); 
    end
end 
hold off
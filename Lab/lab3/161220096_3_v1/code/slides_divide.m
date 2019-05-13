clc; clear all;
Im = imread('./divide_output/m2.bmp');
Im = im2bw(Im); %二值化
[m,n] = size(Im);
% 先去边框
border = 10; %边框所占百分比
left = floor(m/border);
right = floor(m-m/border);
up = floor(n/border);
down = floor(n-n/border);
% 去边框后的图
Im = Im(left:right,up:down);
[m,n] = size(Im);


height = m;
seg = cell(1,5);

% 试探空格
exist = [];
for i = 1:n
    tmp = find(Im(:,i)== 0);
    exist(i) = ~isempty(tmp);
end

% 分块

part = [];
sflag = 0;
eflag = 0;
offset = floor(n/20);

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
last = part(4,2);
part = [part;[last+offset+1,last+offset]];

for col = 1:5
    seg(1,col)= {Im(1:height,part(col,1)-offset:part(col,2)+offset,:)};   
end

for i=1:5
    subplot(1,5,i);imshow(seg{i});hold on;
    if mod(i,2)==1
        display(my_digit(seg{i}))
    else
        display(my_operator(seg{i}))
    end
end


% imshow(Im)
% hold on

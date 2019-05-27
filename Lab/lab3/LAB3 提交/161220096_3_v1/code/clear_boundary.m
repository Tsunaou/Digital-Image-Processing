function [output] = clear_boundary(Im)
%CLEAR_BOUNDARY 对图像进行预处理，求出其外接矩形
%   此处显示详细说明

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
right = part(end);

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
down = part(end);

output =  Im(up:down-1,left:right-1);

end


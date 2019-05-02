function [output] = my_edgelinkingJava(binary_image, row, col)
%MY_EDGELINKINGJAVA 初期借用了Java的API LinkedList实现的边缘追踪函数，后期改为纯matlab实现
%   此处保留原有实现
[m,n] = size(binary_image);
b = [row,col];
c = [row,col];
img = binary_image;
res = javaObject('java.util.LinkedList'); %结果


if img(row,col)~=1
    output = [];
end

curr_d = 1; %当前探索方向
tra_flag = false;
res.add([row,col]);
img(row,col) = 0;

neighbour=[
    0 1;
    1 1;
    1 0;
    1 -1;
    0 -1;
    -1 -1;
    -1 0;
    -1 1];  %和当前像素坐标相加得到八个邻域坐标

while tra_flag == false
    for counts = 1:8
        if curr_d > 8
            curr_d = curr_d - 8;
        end
        if curr_d <=0
            curr_d = curr_d + 8;
        end
        c = b + neighbour(curr_d,:);
        x = c(1);
        y = c(2);
        if x>=1 && x<=m && y>=1 && y<=n
            if img(x,y)==1
                curr_d  = curr_d -1; %更新当前方向
                res.add([x,y]);
                img(x,y) = 0;
                b = c;
                break;
            end
        end
        curr_d = curr_d + 1;
    end
    if counts == 8
        break;
    end
end

len = res.toArray.length;
Bxpc = zeros(len,2);
index = 1;
while ~res.isEmpty()
    top = res.remove();
    Bxpc(index,1) = top(1,1);
    Bxpc(index,2) = top(2,1);
    index = index + 1;
end

output = Bxpc;
end


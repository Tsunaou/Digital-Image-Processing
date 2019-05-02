function output = my_edgelinking(binary_image, row, col)
%in this function, you should finish the edge linking utility.
%the input parameters are a matrix of a binary image containing the edge
%information and coordinates of one of the edge points of a obeject
%boundary, you should run this function multiple times to find different
%object boundaries
%the output parameter is a Q-by-2 matrix, where Q is the number of boundary 
%pixels. B holds the row and column coordinates of the boundary pixels.
%you can use different methods to complete the edge linking function
%the better the quality of object boundary and the more the object boundaries, you will get higher scores  

[m,n] = size(binary_image);
b = [row,col];
img = binary_image;

if img(row,col)~=1
    display('����㲻�ڱ߽���');
    output = [];
end

curr_d = 1; %��ǰ̽������
res=[row,col];
img(row,col) = 0;

neighbour=[0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1];  %�͵�ǰ����������ӵõ��˸���������

while true
    for i = 1:8
        curr_d = mod(curr_d-1,8)+1;
        c = b + neighbour(curr_d,:);
        x = c(1);
        y = c(2);
        if x>=1 && x<=m && y>=1 && y<=n
            if img(x,y)==1
                curr_d  = curr_d -1; %���µ�ǰ����
                res = [res;[x,y]]; %���������
                img(x,y) = 0;   %
                b = c;
                break;
            end
        end
        curr_d = curr_d + 1;
    end
    if i == 8
        break;
    end
end
output = res;
end



function [output] = my_edgelinkingJava(binary_image, row, col)
%MY_EDGELINKINGJAVA ���ڽ�����Java��API LinkedListʵ�ֵı�Ե׷�ٺ��������ڸ�Ϊ��matlabʵ��
%   �˴�����ԭ��ʵ��
[m,n] = size(binary_image);
b = [row,col];
c = [row,col];
img = binary_image;
res = javaObject('java.util.LinkedList'); %���


if img(row,col)~=1
    output = [];
end

curr_d = 1; %��ǰ̽������
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
    -1 1];  %�͵�ǰ����������ӵõ��˸���������

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
                curr_d  = curr_d -1; %���µ�ǰ����
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


function [output] = clear_boundary(Im)
%CLEAR_BOUNDARY ��ͼ�����Ԥ�����������Ӿ���
%   �˴���ʾ��ϸ˵��

[m,n] = size(Im);
% ��ȥ�߿���̽�ո�
exist = [];
for i = 1:n
    tmp = find(Im(:,i)== 0);
    exist(i) = ~isempty(tmp);
end

% �ֿ�
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
% ȥ�߿���ͼ
left = part(1);
right = part(end);

% ��ȥ�߿���̽�ո�
exist = [];
for i = 1:m
    tmp = find(Im(i,:)== 0);
    exist(i) = ~isempty(tmp);
end

% �ֿ�
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


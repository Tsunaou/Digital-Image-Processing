function [output] = my_marr(input_image,sigma)
%MY_MARR Marr-Hildreth��Ե����㷨
%   �˴���ʾ��ϸ˵��
[m,n] = size(input_image);
res = zeros(m,n);
nsize = ceil(3*sigma)*2+1; % �˲����ߴ�nΪ���ڵ���6sigma����С������
% ����LoG�˲���,��ʹ���˲�����ϵ��֮��Ϊ0
LoG = fspecial('log',nsize,sigma);
LoG = LoG - mean(LoG(:));%����ÿһ���ȥ��ֵ�����˲���ϵ��֮��Ϊ0
% ����Log�˲�����ͼ���˲�
b = filter2(LoG,input_image);
% �����㽻����ֵ�����ھ�ֵ�������ֵ�İٷֱȣ�
% thresh =  0.75*mean(abs(b(:)));
thresh = 0.05*max(abs(b(:)));
% Ѱ���˲�����㽻��㣺Ѱ���㽻���һ�ַ�������pΪ���ĵ�һ��3*3�������g(x,y)��ֵ��һ����ֵ�Ƚϣ�
% �򲻽��������ķ��Ų�ͬ������������ֵ��ľ���ֵ��������ֵ
op1 = [0,-1; -1,0; -1,-1; -1, 1]; %�ֱ�������ҡ����º������Խ�
op2 = [0, 1;  1,0;  1, 1;  1,-1];
for i = 2:m-1
    for j = 2:n-1
        p = [i,j];
        for k = 1:4
            xy1 = p + op1(k,:);
            xy2 = p + op2(k,:);
            x = b(xy1(1),xy1(2)); %������������ֵ
            y = b(xy2(1),xy2(2));
            t = b(i,j);
%             if (x*y<0)&&(abs(x-y)>thresh) %�������ķ��Ų�ͬ������������ֵ��ľ���ֵ��������ֵ
%                 res(i,j)=1;
%                 break;
%             end
            if (t<0&&x>0)&&(abs(x-t)>thresh) %�������ķ��Ų�ͬ������������ֵ��ľ���ֵ��������ֵ
                res(i,j)=1;
                break;
            end
            if (t<0&&y>0)&&(abs(y-t)>thresh) %�������ķ��Ų�ͬ������������ֵ��ľ���ֵ��������ֵ
                res(i,j)=1;
                break;
            end
        end
    end
end

output = logical(res);

end


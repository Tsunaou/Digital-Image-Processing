function output = my_calculator(input_image)
%in this function, you should finish the character recognition task.
%the input parameter is a matrix of an image which contains several expressions
%the output parameter is a matrix of an image which contains the results of expressions 

Im = input_image;
RGB = Im;
Im = im2bw(Im); %��ֵ��
Im =  clear_boundary(Im); %���ͼƬ��Ե������С��Ӿ���
L = size(Im);
[m,n] = size(Im);

%��ͼƬ���շ�����л���
max_row = 10; %����
max_col = 3; %����

height = floor(L(1)/max_row); %ÿ����ʽ����ĸ߶�
width = floor(L(2)/max_col); %ÿ����ʽ����Ŀ��

seg = cell(max_row,max_col); %�洢�ָ��ÿ��λ�õ���ʽͼƬ

%�ֿ�
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};   
    end
end 

%�ֱ����ÿ��������ʽ�Ľ��
res = []; %�洢������
start = []; %��¼�������ڷ����ƫ����
for i=1:max_row*max_col
    [a,b] = caculate_line(seg{i});
    res = [res,a];
    start = [start,b];
end

%�����д��ԭͼ������
for row = 1:max_row      
    for col = 1:max_col  
        index = (col-1)*max_row + row;
        scale = max_col*10; % �������Ļ�����
        x = width*(col-1)+start(index)+n/scale; %�����x����
        y = height*(row-1)+m/(scale-1); %�����y����
        content = int2str(res(index)); %��ʽ�ļ�����
        off = m/(max_row*5); %д��ͼƬ�����ƫ���� 
        position = [x,y+off]; %��ʽӦ��д���λ��
        RGB = insertText(RGB,position,content,'AnchorPoint','LeftCenter','FontSize',60,'BoxOpacity',0);
    end
end 
output = RGB;


clc; clear all;
imgTest = im2double(imread('../asset/image/link.png'));
background = im2bw(imgTest, 1);
imgTestGray = rgb2gray(imgTest);
img = edge(imgTestGray);
imtool(img);

[m,n] = size(img);
visit = zeros(m,n);

neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %�͵�ǰ����������ӵõ��˸���������


% �ö��н��й���
q = javaObject('java.util.LinkedList'); % ����
res = javaObject('java.util.LinkedList'); %���
row = 151;
col = 99;
label = img(151,99);
q.add([row,col]);
res.add([row,col]);
while ~q.isEmpty()
    top = q.remove();
    pix= [top(1,1),top(2,1)];   
    %8��������
    for k=1:8               
        pix1=pix+neighbour(k,:);    %������ڵ�
        x = pix1(1);
        y = pix1(2);
        if x>=1 && x<=m && y>=1 && y<=n
            %�����ǰ������������ΪĿ�����أ�����û�з��ʹ�������
            if img(x,y) == label && visit(x,y) == 0  
%                 display(pix1)
                visit(x,y)= 1;
                q.add([x,y]);
                res.add([x,y]);
            end
            visit(x,y) = 1;
        end              
    end    
end

len = res.toArray.length;
Bxpc = zeros(len,2);
index = 1;
ouput = zeros(m,n);
while ~res.isEmpty()
    top = res.remove();
%     display(top)
    Bxpc(index,1) = top(1,1);
    Bxpc(index,2) = top(2,1);
    ouput(top(1,1),top(2,1))=1;
    index = index + 1;
end

figure; clf; imshow(background);title('��Ե׷��','FontSize',12);
hold on;
plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);
title('��Ե׷��','FontSize',12);

figure; clf; imshow(ouput);title('��Ե׷��','FontSize',12);



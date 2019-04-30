clc; clear all;
imgTest = im2double(imread('../asset/image/link.png'));
background = im2bw(imgTest, 1);
imgTestGray = rgb2gray(imgTest);
img = edge(imgTestGray);
imtool(img);

[m,n] = size(img);
visit = zeros(m,n);

neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %和当前像素坐标相加得到八个邻域坐标


% 用队列进行构造
q = javaObject('java.util.LinkedList'); % 创建
res = javaObject('java.util.LinkedList'); %结果
row = 151;
col = 99;
label = img(151,99);
q.add([row,col]);
res.add([row,col]);
while ~q.isEmpty()
    top = q.remove();
    pix= [top(1,1),top(2,1)];   
    %8邻域搜索
    for k=1:8               
        pix1=pix+neighbour(k,:);    %八邻域节点
        x = pix1(1);
        y = pix1(2);
        if x>=1 && x<=m && y>=1 && y<=n
            %如果当前像素邻域像素为目标像素，并且没有访问过，则标记
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

figure; clf; imshow(background);title('边缘追踪','FontSize',12);
hold on;
plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);
title('边缘追踪','FontSize',12);

figure; clf; imshow(ouput);title('边缘追踪','FontSize',12);



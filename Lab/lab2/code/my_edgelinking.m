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
    
[m,n]=size(binary_image);

tmp=zeros(m,n);     %标记图像
label=1;
queue_head=1;       %队列头
queue_tail=1;       %队列尾
neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %和当前像素坐标相加得到八个邻域坐标

for i=2:m-1
    for j=2:n-1
        if s(i,j)==1 && tmp(i,j) ==0           
            tmp(i,j)=label;
            q{queue_tail}=[i j];        %用元组模拟队列，当前坐标入列
            queue_tail=queue_tail+1;
            
            while queue_head~=queue_tail
                pix=q{queue_head};                
                for k=1:8               %8邻域搜索
                    pix1=pix+neighbour(k,:);
                    if pix1(1)>=2 && pix1(1)<=m-1 && pix1(2) >=2 &&pix1(2)<=n-1
                    	if s(pix1(1),pix1(2)) == 1 && tmp(pix1(1),pix1(2)) ==0  %如果当前像素邻域像素为1并且标记图像的这个邻域像素没有被标记，那么标记
                        	tmp(pix1(1),pix1(2))=label;
                        	q{queue_tail}=[pix1(1) pix1(2)];
                        	queue_tail=queue_tail+1;
                        end  
                    end              
                end
                queue_head=queue_head+1;
            end      
            clear q;                %清空队列，为新的标记做准备
            label=label+1;
            queue_head=1;
            queue_tail=1;            
        end
    end
end



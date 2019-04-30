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

tmp=zeros(m,n);     %���ͼ��
label=1;
queue_head=1;       %����ͷ
queue_tail=1;       %����β
neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %�͵�ǰ����������ӵõ��˸���������

for i=2:m-1
    for j=2:n-1
        if s(i,j)==1 && tmp(i,j) ==0           
            tmp(i,j)=label;
            q{queue_tail}=[i j];        %��Ԫ��ģ����У���ǰ��������
            queue_tail=queue_tail+1;
            
            while queue_head~=queue_tail
                pix=q{queue_head};                
                for k=1:8               %8��������
                    pix1=pix+neighbour(k,:);
                    if pix1(1)>=2 && pix1(1)<=m-1 && pix1(2) >=2 &&pix1(2)<=n-1
                    	if s(pix1(1),pix1(2)) == 1 && tmp(pix1(1),pix1(2)) ==0  %�����ǰ������������Ϊ1���ұ��ͼ��������������û�б���ǣ���ô���
                        	tmp(pix1(1),pix1(2))=label;
                        	q{queue_tail}=[pix1(1) pix1(2)];
                        	queue_tail=queue_tail+1;
                        end  
                    end              
                end
                queue_head=queue_head+1;
            end      
            clear q;                %��ն��У�Ϊ�µı����׼��
            label=label+1;
            queue_head=1;
            queue_tail=1;            
        end
    end
end



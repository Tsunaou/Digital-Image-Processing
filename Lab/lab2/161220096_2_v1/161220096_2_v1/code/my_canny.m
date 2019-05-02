function [output] = my_canny(input_image)
%MY_CANNY Canny��Ե����㷨
%   �˴���ʾ��ϸ˵��
imgsrc = im2uint8(input_image);
sigma = 3;
N = 3;            
N_row = 2*N+1;
gausFilter = fspecial('gaussian', [N_row,N_row], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

[m,n] = size(img);
img = double(img);
M = zeros(m, n); 
alpha = zeros(m, n);
sector = zeros(m, n);
canny1 = zeros(m, n);%�Ǽ���ֵ����
res = zeros(m, n);

for i = 2:(m-1)
    for j = 2:(n-1)
        Gx = img(i-1,j+1)+2*img(i,j+1)+img(i+1,j+1)-img(i-1,j-1)-2*img(i,j-1)-img(i+1,j-1);
        Gy = img(i-1,j-1)+2*img(i-1,j)+img(i-1,j+1)-img(i+1,j-1)-2*img(i+1,j)-img(i+1,j+1);
        M(i,j) = sqrt(Gx^2+Gy^2);
        %--------------------------------
        alpha(i,j) = atand(Gx/Gy)  ;
        tem = alpha(i,j);
        %--------------------------------
        if (tem<22.5)&&(tem>-22.5)
            sector(i,j) =  1;     %ˮƽ��Ե
        elseif (tem<-157.5)||(tem>157.5)
            sector(i,j) =   2;    %��ֱ��Ե
        elseif (tem<-22.5)&&(tem>-67.5)
            sector(i,j) =   3;    %����-����
        else
            sector(i,j) =  4;     %����-����
        end
        %--------------------------------        
    end    
end
%-------------------------
%�Ǽ���ֵ����
op1 = [0,-1; -1,0; -1,-1; -1, 1]; %�ֱ����ˮƽ����ֱ���������£���������
op2 = [0, 1;  1,0;  1, 1;  1,-1]; %�ֱ����ˮƽ����ֱ���������£���������
for i = 2:(m-1)
    for j = 2:(n-1)
        canny1(i,j) = 0;
        k = sector(i,j);
        a = [i,j] + op1(k,:);
        b = [i,j] + op2(k,:);
        x = M(a(1),a(2)); %������������ֵ
        y = M(b(1),b(2));
        if ( M(i,j)>x )&&( M(i,j)>y)
            canny1(i,j) = M(i,j);
        end
    end
end

%---------------------------------
%˫��ֵ���
ratio = 2.5;
lowTh = 15;
highTh = ratio*lowTh;
neighbour=[0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1];  %�͵�ǰ����������ӵõ��˸���������
for i = 2:(m-1)
    for j = 2:(n-1)        
        if canny1(i,j)<lowTh %����ֵ����
            res(i,j) = 0;
        elseif canny1(i,j)>highTh %����ֵ����
            res(i,j) = 1;
        else %����֮��Ŀ���8������û�и��ڸ���ֵ�ģ��������Ϊ��Ե
            for k =1:8
                b = [i,j] + neighbour(k,:);
                if canny1(b(1),b(2))> highTh
                    res(i,j) = 1;
                    break;
                end
            end
        end
    end
end
output = res;
end


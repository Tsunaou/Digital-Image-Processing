function [output] = my_canny(input_image)
%MY_CANNY Canny边缘检测算法
%   此处显示详细说明
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
canny1 = zeros(m, n);%非极大值抑制
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
            sector(i,j) =  1;     %水平边缘
        elseif (tem<-157.5)||(tem>157.5)
            sector(i,j) =   2;    %垂直边缘
        elseif (tem<-22.5)&&(tem>-67.5)
            sector(i,j) =   3;    %左上-右下
        else
            sector(i,j) =  4;     %右上-左下
        end
        %--------------------------------        
    end    
end
%-------------------------
%非极大值抑制
op1 = [0,-1; -1,0; -1,-1; -1, 1]; %分别代表水平、垂直和左上右下，左下右上
op2 = [0, 1;  1,0;  1, 1;  1,-1];
for i = 2:(m-1)
    for j = 2:(n-1)
        canny1(i,j) = 0;
        p = [i,j];
        k = sector(i,j);
        xy1 = p + op1(k,:);
        xy2 = p + op2(k,:);
        x = M(xy1(1),xy1(2)); %相对邻域的两个值
        y = M(xy2(1),xy2(2));
        if ( M(i,j)>x )&&( M(i,j)>y)
            canny1(i,j) = M(i,j);
        end
    end
end

%---------------------------------
%双阈值检测
ratio = 2;
lowTh = 22;
highTh = ratio*lowTh;
for i = 2:(m-1)
    for j = 2:(n-1)        
        if canny1(i,j)<lowTh %低阈值处理
            res(i,j) = 0;
            continue;
        elseif canny1(i,j)>highTh %高阈值处理
            res(i,j) = 1;
            continue;
        else %介于之间的看其8领域有没有高于高阈值的，有则可以为边缘
            tem =[canny1(i-1,j-1), canny1(i-1,j), canny1(i-1,j+1);
                       canny1(i,j-1),    canny1(i,j),   canny1(i,j+1);
                       canny1(i+1,j-1), canny1(i+1,j), canny1(i+1,j+1)];
            temMax = max(tem);
            if temMax(1) > highTh
                res(i,j) = 1;
                continue;
            else
                res(i,j) = 0;
                continue;
            end
        end
    end
end


output = res;
end


function [output] = my_canny(input_image)
%MY_CANNY Canny边缘检测算法
%   此处显示详细说明
% 1.用一个高斯滤波器平滑输入图像
imgsrc = im2uint8(input_image);
sigma = 3;  
N = 3;            
N_row = 2*N+1;
gausFilter = fspecial('gaussian', [N_row,N_row], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

[m,n] = size(img);
img = double(img);
M = zeros(m, n); 
sector = zeros(m, n); %表示角度幅值图像
canny1 = zeros(m, n); %非极大值抑制后图像
res = zeros(m, n);  %结果图像

% 2.计算梯度幅值图像和角度图像
for i = 2:(m-1)
    for j = 2:(n-1)
        %用Sobel算子进行卷积计算梯度幅值和方向
        Gx = img(i-1,j+1)+2*img(i,j+1)+img(i+1,j+1)-img(i-1,j-1)-2*img(i,j-1)-img(i+1,j-1);
        Gy = img(i-1,j-1)+2*img(i-1,j)+img(i-1,j+1)-img(i+1,j-1)-2*img(i+1,j)-img(i+1,j+1);
        M(i,j) = sqrt(Gx^2+Gy^2);
        tem = atand(Gx/Gy);
        if (tem<22.5)&&(tem>-22.5)
            sector(i,j) =  1;     %水平边缘
        elseif (tem<-157.5)||(tem>157.5)
            sector(i,j) =   2;    %垂直边缘
        elseif (tem<-22.5)&&(tem>-67.5)
            sector(i,j) =   3;    %左上-右下
        else
            sector(i,j) =  4;     %右上-左下
        end
    end    
end

% 3.对梯度赋值图像应用非最大抑制
op1 = [0,-1; -1,0; -1,-1; -1, 1]; %分别代表水平、垂直和左上右下，左下右上
op2 = [0, 1;  1,0;  1, 1;  1,-1]; %分别代表水平、垂直和左上右下，左下右上
for i = 2:(m-1)
    for j = 2:(n-1)
        canny1(i,j) = 0;
        k = sector(i,j);
        a = [i,j] + op1(k,:);
        b = [i,j] + op2(k,:);
        x = M(a(1),a(2)); %相对邻域的两个值
        y = M(b(1),b(2));
        if ( M(i,j)>x )&&( M(i,j)>y)
            canny1(i,j) = M(i,j);
        end
    end
end

% 4.用双阈值处理来检测边缘
ratio = 2.5;
lowTh = 15;
highTh = ratio*lowTh;
neighbour=[0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1];  %和当前像素坐标相加得到八个邻域坐标
for i = 2:(m-1)
    for j = 2:(n-1)        
        if canny1(i,j)<lowTh %低阈值处理
            res(i,j) = 0;
        elseif canny1(i,j)>highTh %高阈值处理
            res(i,j) = 1;
        else %介于之间的看其8领域有没有高于高阈值的，有则可以为边缘
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


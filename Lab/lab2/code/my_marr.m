function [output] = my_marr(input_image)
%MY_MARR Marr-Hildreth边缘检测算法
%   此处显示详细说明
sigma = 2.8; 
[m,n] = size(input_image);
img = input_image;
res = zeros(m,n);
rr = 2:m-1;
cc = 2:n-1;
% 滤波器尺寸n为大于等于6sigma的最小奇整数
nsize=ceil(sigma*3)*2+1;
% 产生LoG滤波器,并使得滤波器的系数之和为0
LoG = fspecial('log',nsize,sigma);
LoG = LoG - mean(LoG(:));%矩阵每一项减去均值，则滤波器系数之和为0
% 利用Log算子对图像滤波
b = filter2(LoG,img);
% 设置零交叉阈值
thresh = 0.75 * mean(abs(b(:)));
% 寻找滤波后的零交叉点，选择边缘点为负值的点
% 寻找零交叉的一种方法是以p为中心的一个3*3邻域，如果g(x,y)的值与一个阈值比较，
% 则不仅相对邻域的符号不同，并且他们数值差的绝对值还超过阈值
%[+ 0 - ]从左向右
[rx,cx]=find(b(rr,cc)<0&b(rr,cc+1)>0&abs(b(rr,cc)-b(rr,cc+1))>thresh);
res((rx+1)+cx*m)=1;
%[- 0 +]从右到左
[rx,cx]=find(b(rr,cc-1)>0&b(rr,cc)<0&abs(b(rr,cc-1)-b(rr,cc))>thresh);
res((rx+1+cx*m))=1;
%[- 0 +]' 从上到下
[rx,cx]=find(b(rr,cc)<0&b(rr+1,cc)>0&abs(b(rr,cc)-b(rr+1,cc))>thresh);
res((rx+1)+cx*m)=1;
%[+ 0 -]' 从下到上
[rx,cx]=find(b(rr-1,cc)>0&b(rr,cc)<0&abs(b(rr-1,cc)-b(rr,cc))>thresh);
res((rx+1)+cx*m)=1;

%寻找滤波后的零交叉点，边缘刚好在滤波值为零点上
[rz,cz]=find(b(rr,cc)==0);
if ~isempty(rz)
    %零点的线性坐标
    zero=(rz+1)+cz*m;
    %
    zz=b(zero-1)<0  & b(zero+1)>0 & abs(b(zero-1)-b(zero+1))>2*thresh;
    res(zero(zz))=1;
    %
    zz=b(zero-1)>0  & b(zero+1)<0 & abs(b(zero-1)-b(zero+1))>2*thresh;
    res(zero(zz))=1;
    %
    zz=b(zero-m)<0  & b(zero+m)>0 & abs(b(zero-m)-b(zero+m))>2*thresh;
    res(zero(zz))=1;
    %
    zz=b(zero-m)>0  & b(zero+m)<0 & abs(b(zero-m)-b(zero+m))>2*thresh;
    res(zero(zz))=1;
end
output = logical(res);

end


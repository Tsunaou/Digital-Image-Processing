function [output] = my_marr(input_image)
%MY_MARR Marr-Hildreth边缘检测算法
%   此处显示详细说明
sigma = 2.5;
a = input_image;
[m,n]=size(a);
e=repmat(logical(uint8(0)),m,n);
rr=2:m-1;
cc=2:n-1;
%选择点数为奇数的滤波器尺寸，fsize>6*sigma
fsize=ceil(sigma*3)*2+1;
%产生log滤波器
op=fspecial('log',fsize,sigma);
%将滤波器的均值变为0
op=op-sum(op(:))/numel(op);
%利用Log算子对图像滤波
b=filter2(op,a);
%设置过零检测的门限
%寻找滤波后的过零点，选择边缘点为负值的点
thresh=.75*mean2(abs(b(rr,cc)));
%[+ 0 - ]从左向右
[rx,cx]=find(b(rr,cc)<0&b(rr,cc+1)>0&abs(b(rr,cc)-b(rr,cc+1))>thresh);
e((rx+1)+cx*m)=1;
%[- 0 +]从右到左
[rx,cx]=find(b(rr,cc-1)>0&b(rr,cc)<0&abs(b(rr,cc-1)-b(rr,cc))>thresh);
e((rx+1+cx*m))=1;
%[- 0 +]' 从上到下
[rx,cx]=find(b(rr,cc)<0&b(rr+1,cc)>0&abs(b(rr,cc)-b(rr+1,cc))>thresh);
e((rx+1)+cx*m)=1;
%[+ 0 -]' 从下到上
[rx,cx]=find(b(rr-1,cc)>0&b(rr,cc)<0&abs(b(rr-1,cc)-b(rr,cc))>thresh);
e((rx+1)+cx*m)=1;
%寻找滤波后的过零点，边缘刚好在滤波值为零点上
[rz,cz]=find(b(rr,cc)==0);
if ~isempty(rz)
    %零点的线性坐标
    zero=(rz+1)+cz*m;
    %
    zz=b(zero-1)<0  & b(zero+1)>0 & abs(b(zero-1)-b(zero+1))>2*thresh;
    e(zero(zz))=1;
    %
    zz=b(zero-1)>0  & b(zero+1)<0 & abs(b(zero-1)-b(zero+1))>2*thresh;
    e(zero(zz))=1;
    %
    zz=b(zero-m)<0  & b(zero+m)>0 & abs(b(zero-m)-b(zero+m))>2*thresh;
    e(zero(zz))=1;
    %
    zz=b(zero-m)>0  & b(zero+m)<0 & abs(b(zero-m)-b(zero+m))>2*thresh;
    e(zero(zz))=1;
end
output = e;

end


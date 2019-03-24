function [output2] = hist_equal(input_channel)
%you should complete this sub-function
%   直方图均衡化算法(input_chaneel是单通道的)
%   这里采用wiki上Histogram_equalization的算法

%0.观察到color.jpg 读入的值是uint8的矩阵，为了保证处理的精度，先将输入通道的精度提高到double
[input_channel] = im2double(input_channel);
%1.对图像基础数据计算
[Height,Width] = size(input_channel);   %图像的长宽
[Counts,Value] = imhist(input_channel); %Value为0-255的灰度值，Counts为每个灰度值对应的像素个数

%2.找到CDF_Min
CDF_Map = find(Counts~=0);  %指示非0值的下标
CDF_Min = Counts(min(CDF_Map)); %分布函数中最小的非零值
%3 计算CDF从而直方图均衡化
[n,tmp] = size(CDF_Map);
[L,tmp] = size(Value);
display("L="+L);
CDF = 0;
new_Value = 0;
y = zeros(1,n);
for i=1:n
    CDF = CDF + Counts(CDF_Map(i)); %累积分布直方图的值
    y(i) = CDF;
    den = (Height*Width-CDF_Min);
    den(den==0) = eps;  %防止由于除零而产生的噪点      
    new_Value = ((CDF-CDF_Min)*(L-1))/den;  %原灰度值通过累积分布函数的概率密度均衡化后得到的新值
    input_channel(input_channel==Value(CDF_Map(i))) = new_Value;    %将原图中与原灰度值一样的像素点均衡化赋值
end
    output2 = input_channel;
end

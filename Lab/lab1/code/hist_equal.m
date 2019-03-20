function [output2] = hist_equal(input_channel)
%you should complete this sub-function
%   直方图均衡化算法(input_chaneel是单通道的)
%   这里采用wiki上Histogram_equalization的算法

%0.观察到color.jpg 读入的值是uint8的矩阵，为了保证处理的精度，先将输入通道的精度提高到double
[input_channel] = im2double(input_channel);
%1.对图像基础数据计算
[Height,Width]=size(input_channel); 
[Counts,Value] = imhist(input_channel);
%2.找到CDF_Min
CDF_Map = find(Counts~=0);  %指示非0值的
CDF_Min = Counts(min(CDF_Map));
%3 计算CDF从而直方图均衡化
[n,tmp] = size(CDF_Map);
[L,tmp] = size(Value);
CDF = 0;
new_Value = 0;
for i=1:n
    CDF = CDF + Counts(CDF_Map(i)); 
    new_Value = ((CDF-CDF_Min)*(L-1))/(Height*Width-CDF_Min);
    input_channel(input_channel==Value(CDF_Map(i))) = new_Value;
end
    output2 = uint8(input_channel);
end

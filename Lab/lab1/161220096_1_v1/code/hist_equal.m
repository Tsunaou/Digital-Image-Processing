function [output2] = hist_equal(input_channel)
%you should complete this sub-function
%   ֱ��ͼ���⻯�㷨(input_chaneel�ǵ�ͨ����)
%   �������wiki��Histogram_equalization���㷨

%0.�۲쵽color.jpg �����ֵ��uint8�ľ���Ϊ�˱�֤�����ľ��ȣ��Ƚ�����ͨ���ľ�����ߵ�double
[input_channel] = im2double(input_channel);
%1.��ͼ��������ݼ���
[Height,Width] = size(input_channel);   %ͼ��ĳ���
[Counts,Value] = imhist(input_channel); %ValueΪ0-255�ĻҶ�ֵ��CountsΪÿ���Ҷ�ֵ��Ӧ�����ظ���

%2.�ҵ�CDF_Min
CDF_Map = find(Counts~=0);  %ָʾ��0ֵ���±�
CDF_Min = Counts(min(CDF_Map)); %�ֲ���������С�ķ���ֵ
%3 ����CDF�Ӷ�ֱ��ͼ���⻯
[n,tmp] = size(CDF_Map);
[L,tmp] = size(Value);
display("L="+L);
CDF = 0;
new_Value = 0;
y = zeros(1,n);
for i=1:n
    CDF = CDF + Counts(CDF_Map(i)); %�ۻ��ֲ�ֱ��ͼ��ֵ
    y(i) = CDF;
    den = (Height*Width-CDF_Min);
    den(den==0) = eps;  %��ֹ���ڳ�������������      
    new_Value = ((CDF-CDF_Min)*(L-1))/den;  %ԭ�Ҷ�ֵͨ���ۻ��ֲ������ĸ����ܶȾ��⻯��õ�����ֵ
    input_channel(input_channel==Value(CDF_Map(i))) = new_Value;    %��ԭͼ����ԭ�Ҷ�ֵһ�������ص���⻯��ֵ
end
    output2 = input_channel;
end
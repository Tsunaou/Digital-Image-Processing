function [output] = HSV_equalization(rgb)
%HSV_EQUALIZATION ��RGBͼƬת��ΪHSVͼƬ��Ȼ���V��ֱ��ͼ����
%   �˴���ʾ��ϸ˵��
    hsv = rgb2hsv(rgb);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);
    v2 = hist_equal(v);
    v2 = double(v2);
    v2 = v2/255;
    hsv = cat(3,h,s,v2);
    rgb = hsv2rgb(hsv);
    rgb = rgb * 255;
    output = uint8(rgb);
    
    function [output2] = hist_equal(input_channel)
    %you should complete this sub-function
    %�������wiki��Histogram_equalization���㷨
    %0.�۲쵽color.jpg �����ֵ��uint8�ľ���Ϊ�˱�֤����ľ��ȣ��Ƚ�����ͨ���ľ�����ߵ�double
    [input_channel] = im2double(input_channel);
    %1.��ͼ��������ݼ���
    [Height,Width]=size(input_channel); 
    [Counts,Value] = imhist(input_channel);
    %2.�ҵ�CDF_Min
    CDF_Map = find(Counts~=0);  %ָʾ��0ֵ��
    CDF_Min = Counts(min(CDF_Map));
    %3 ����CDF�Ӷ�ֱ��ͼ���⻯
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
end


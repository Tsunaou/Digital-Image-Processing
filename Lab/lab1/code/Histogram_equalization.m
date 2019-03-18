function [output] = Histogram_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
    %here is just one method, if you have other ways to do the
    %equalization, you can change the following code
    r=input_image(:,:,1);
    v=input_image(:,:,2);
    b=input_image(:,:,3);
    r1 = hist_equal(r);
    v1 = hist_equal(v);
    b1 = hist_equal(b);
    output = cat(3,r1,v1,b1);    
else
    %this is a gray image
    [output] = hist_equal(input_image);
    
end

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
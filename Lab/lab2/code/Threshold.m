function [threshold] = Threshold(input_image,scale)
%   ���ݻҶ�ƽ��ֵ�����õ���ֵ��ȷ��
%   �˴���ʾ��ϸ˵��
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end


function [threshold] = Threshold(input_image,scale)
%   根据灰度平均值，来得到阈值的确定
%   此处显示详细说明
means = mean(input_image(:));
cutoff = scale*means;
threshold = sqrt(cutoff);
end


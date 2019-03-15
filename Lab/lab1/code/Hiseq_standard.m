function [output] = Hiseq_standard(input_image)
%HISEQ_STANDARD 使用Matlab库函数来与自己实现的函数对比
    output = histeq(input_image);
end


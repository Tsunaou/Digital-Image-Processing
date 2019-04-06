function [output] = gauss_filter(input_image)
%GAUSS_FILTER 高斯滤波器
%   此处显示详细说明
hg=zeros(3,3);  %设定高斯平滑滤波模板的大小为3*3
delta=0.5;
for i=1:3
    for j=1:3
        u=i-2;
        v=j-2;
        hg(i,j)=exp(-(u^2+v^2)/(2*pi*delta^2));
    end
end
h=hg/sum(hg(:));
[m,n]=size(input_image);
res=zeros(m,n);
for i=2:m-2
    for j=2:n-2
        mod=[input_image(i-1,j-1) input_image(i-1,j) input_image(i-1,j+1); input_image(i,j-1) input_image(i,j) input_image(i,j+1);input_image(i+1,j-1) input_image(i+1,j) input_image(i+1,j+1)];
        A=h.*mod;
        res(i,j)=sum(A(:));
    end
end
output=res;
end


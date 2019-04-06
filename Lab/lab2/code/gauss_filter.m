function [output] = gauss_filter(input_image)
%GAUSS_FILTER 高斯滤波器
%   此处显示详细说明
hg=zeros(3,3);  %设定高斯平滑滤波模板的大小为3*3
delta=0.5;
for x=1:1:3
    for y=1:1:3
        u=x-2;
        v=y-2;
        hg(x,y)=exp(-(u^2+v^2)/(2*pi*delta^2));
    end
end
h=hg/sum(hg(:));
[m,n]=size(input_image);
ftemp=zeros(m,n);
rowhigh=m-1;
colhigh=n-1;
f = input_image;
for x=2:1:rowhigh-1
    for y=2:1:colhigh-1
        mod=[f(x-1,y-1) f(x-1,y) f(x-1,y+1); f(x,y-1) f(x,y) f(x,y+1);f(x+1,y-1) f(x+1,y) f(x+1,y+1)];
        A=h.*mod;
        ftemp(x,y)=sum(A(:));
    end
end
output=ftemp;
end


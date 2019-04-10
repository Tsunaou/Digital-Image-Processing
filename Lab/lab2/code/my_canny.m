function [output] = my_canny(input_image)
%MY_CANNY Canny编译检测器
%   此处显示详细说明

sigma = 2.5;
I = input_image;
%输入图像为I，标准差sigma，输出为边缘图像e
[m,n]=size(I);
Rr=2:m-1;cc=2:n-1;
e=repmat(logical(uint8(0)),m,n);
%产生同样大小的边缘图像e，初始化为1 ，即初始化边缘
GaussianDieOff=-0.001;%设定高斯函数消失门限
PercentOfPixelsNotEdges=-7;%用于计算边缘门限
ThresholdRatio=-4;%设置两个门限的比例
%首先设计高斯滤波器和它的微分
pw=1:30;
%设定滤波器宽度
ssq=sigma*sigma;
%计算方差
width=max(find(exp(-(pw.*pw)/(2*sigma*sigma))>GaussianDieOff));
%计算滤波算子宽度
t=(-width:width);
len=2*width+1;
t3=[t-.5;t;t+.5];
%对每个像素左右各半个像素位置的值进行平均
gau=sum(exp(-(t3.*t3)/(2*ssq))).'/(6*pi*ssq);
%一维高斯滤波器
dgau=(-t.*exp(-(t.*t)/(2*ssq))/ssq).';
%高斯滤波器的微分
ra=size(I,1);
ca=size(I,2);
ay=255*double(I);ax=255*double(I');
h=conv(gau,dgau);
%利用高斯函数滤除噪声和用高斯算子的一阶微分对图像滤波合并为一个算子
ax=conv2(ax,h,'same').';
%产生x方向滤波
ay=conv2(ay,h,'same');
%产生y方向滤波
mag=sqrt((ax.*ax)+(ay.*ay));
%计算滤波结果的幅度
magmax=max(mag(:));
if magmax>0
mag=mag/magmax;
%对滤波幅度进行归一化
end
%下面根据滤波幅度的概率密度计算滤波门限
[counts,x]=imhist(mag,64);
%计算滤波结果的幅度的直方图
highThresh=min(find(cumsum(counts)>PercentOfPixelsNotEdges*m*n))/64;
%通过设定非边缘点的比例来确定高门限
lowThresh=ThresholdRatio*highThresh;
%设置低门限为高门限乘以比例因子
thresh=[lowThresh,highThresh];
%下面进行非极大抑制
%大于高门限的点归于强边缘图像
%小于低门限的点归于弱边缘图像
idxStrong=[];
for dir=1:4
    idxLocalMax=cannyFindLocalMaxima(dir,ax,ay,mag);
    idxWeak=idxLocalMax(mag(idxLocalMax)>lowThresh);
    e(idxWeak)=1;
    idxStrong=[idxStrong;idxWeak(mag(idxWeak)>highThresh)];
end
rstrong=rem(idxStrong-1,m)+1;%rem是求余数
cstrong=floor((idxStrong-1)/m)+1;%向-∞取整
e=bwselect(e,cstrong,rstrong,8);    
%通过形态学算子将两幅图像的边缘进行连接
output = e;
end


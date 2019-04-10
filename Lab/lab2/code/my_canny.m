function [output] = my_canny(input_image)
%MY_CANNY Canny��������
%   �˴���ʾ��ϸ˵��

sigma = 2.5;
I = input_image;
%����ͼ��ΪI����׼��sigma�����Ϊ��Եͼ��e
[m,n]=size(I);
Rr=2:m-1;cc=2:n-1;
e=repmat(logical(uint8(0)),m,n);
%����ͬ����С�ı�Եͼ��e����ʼ��Ϊ1 ������ʼ����Ե
GaussianDieOff=-0.001;%�趨��˹������ʧ����
PercentOfPixelsNotEdges=-7;%���ڼ����Ե����
ThresholdRatio=-4;%�����������޵ı���
%������Ƹ�˹�˲���������΢��
pw=1:30;
%�趨�˲������
ssq=sigma*sigma;
%���㷽��
width=max(find(exp(-(pw.*pw)/(2*sigma*sigma))>GaussianDieOff));
%�����˲����ӿ��
t=(-width:width);
len=2*width+1;
t3=[t-.5;t;t+.5];
%��ÿ���������Ҹ��������λ�õ�ֵ����ƽ��
gau=sum(exp(-(t3.*t3)/(2*ssq))).'/(6*pi*ssq);
%һά��˹�˲���
dgau=(-t.*exp(-(t.*t)/(2*ssq))/ssq).';
%��˹�˲�����΢��
ra=size(I,1);
ca=size(I,2);
ay=255*double(I);ax=255*double(I');
h=conv(gau,dgau);
%���ø�˹�����˳��������ø�˹���ӵ�һ��΢�ֶ�ͼ���˲��ϲ�Ϊһ������
ax=conv2(ax,h,'same').';
%����x�����˲�
ay=conv2(ay,h,'same');
%����y�����˲�
mag=sqrt((ax.*ax)+(ay.*ay));
%�����˲�����ķ���
magmax=max(mag(:));
if magmax>0
mag=mag/magmax;
%���˲����Ƚ��й�һ��
end
%��������˲����ȵĸ����ܶȼ����˲�����
[counts,x]=imhist(mag,64);
%�����˲�����ķ��ȵ�ֱ��ͼ
highThresh=min(find(cumsum(counts)>PercentOfPixelsNotEdges*m*n))/64;
%ͨ���趨�Ǳ�Ե��ı�����ȷ��������
lowThresh=ThresholdRatio*highThresh;
%���õ�����Ϊ�����޳��Ա�������
thresh=[lowThresh,highThresh];
%������зǼ�������
%���ڸ����޵ĵ����ǿ��Եͼ��
%С�ڵ����޵ĵ��������Եͼ��
idxStrong=[];
for dir=1:4
    idxLocalMax=cannyFindLocalMaxima(dir,ax,ay,mag);
    idxWeak=idxLocalMax(mag(idxLocalMax)>lowThresh);
    e(idxWeak)=1;
    idxStrong=[idxStrong;idxWeak(mag(idxWeak)>highThresh)];
end
rstrong=rem(idxStrong-1,m)+1;%rem��������
cstrong=floor((idxStrong-1)/m)+1;%��-��ȡ��
e=bwselect(e,cstrong,rstrong,8);    
%ͨ����̬ѧ���ӽ�����ͼ��ı�Ե��������
output = e;
end


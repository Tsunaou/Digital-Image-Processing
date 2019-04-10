function [output] = my_marr(input_image)
%MY_MARR Marr-Hildreth��Ե����㷨
%   �˴���ʾ��ϸ˵��
sigma = 2.5;
a = input_image;
[m,n]=size(a);
e=repmat(logical(uint8(0)),m,n);
rr=2:m-1;
cc=2:n-1;
%ѡ�����Ϊ�������˲����ߴ磬fsize>6*sigma
fsize=ceil(sigma*3)*2+1;
%����log�˲���
op=fspecial('log',fsize,sigma);
%���˲����ľ�ֵ��Ϊ0
op=op-sum(op(:))/numel(op);
%����Log���Ӷ�ͼ���˲�
b=filter2(op,a);
%���ù����������
%Ѱ���˲���Ĺ���㣬ѡ���Ե��Ϊ��ֵ�ĵ�
thresh=.75*mean2(abs(b(rr,cc)));
%[+ 0 - ]��������
[rx,cx]=find(b(rr,cc)<0&b(rr,cc+1)>0&abs(b(rr,cc)-b(rr,cc+1))>thresh);
e((rx+1)+cx*m)=1;
%[- 0 +]���ҵ���
[rx,cx]=find(b(rr,cc-1)>0&b(rr,cc)<0&abs(b(rr,cc-1)-b(rr,cc))>thresh);
e((rx+1+cx*m))=1;
%[- 0 +]' ���ϵ���
[rx,cx]=find(b(rr,cc)<0&b(rr+1,cc)>0&abs(b(rr,cc)-b(rr+1,cc))>thresh);
e((rx+1)+cx*m)=1;
%[+ 0 -]' ���µ���
[rx,cx]=find(b(rr-1,cc)>0&b(rr,cc)<0&abs(b(rr-1,cc)-b(rr,cc))>thresh);
e((rx+1)+cx*m)=1;
%Ѱ���˲���Ĺ���㣬��Ե�պ����˲�ֵΪ�����
[rz,cz]=find(b(rr,cc)==0);
if ~isempty(rz)
    %������������
    zero=(rz+1)+cz*m;
    %
    zz=b(zero-1)<0  & b(zero+1)>0 & abs(b(zero-1)-b(zero+1))>2*thresh;
    e(zero(zz))=1;
    %
    zz=b(zero-1)>0  & b(zero+1)<0 & abs(b(zero-1)-b(zero+1))>2*thresh;
    e(zero(zz))=1;
    %
    zz=b(zero-m)<0  & b(zero+m)>0 & abs(b(zero-m)-b(zero+m))>2*thresh;
    e(zero(zz))=1;
    %
    zz=b(zero-m)>0  & b(zero+m)<0 & abs(b(zero-m)-b(zero+m))>2*thresh;
    e(zero(zz))=1;
end
output = e;

end


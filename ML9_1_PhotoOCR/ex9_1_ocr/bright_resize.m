function y=bright_resize(a,mul,type)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%****************************************************
%a:����ͼ��Ҷ�ֵ
%mul:���ű���
%type:1��ʾ���ڽ�����2��ʾ˫���Բ�ֵ��
%�������ź�ͼ�񲢷�����Ҷ�ֵ
%****************************************************
imshow(a);
title('ԭͼ��');

[m,n]=size(a);
m1=m*mul;n1=n*mul;
%****************************************************
if type==1
for i=1:m1
for j=1:n1;
   round(i*mul)
   round(j*mul)
b(i,j)=a(round(i/mul),round(j/mul));
end
end
elseif type==2
for i=1:m1-1
for j=1:n1-1;
u0=i/mul;v0=j/mul;
u=round(u0);v=round(v0);
s=u0-u;t=v0-v;
b(i,j)=(a(u+1,v)-a(u,v))*s+(a(u,v+1)-a(u,v))*t+(a(u+1,v+1)+a(u,v)-a(u,v+1)-a(u+1,v))*s*t+a(u,v);
end
end
end
%*****************************************************
b=uint8(b);
imshow(b);
title('�����ͼ��');
y=b;

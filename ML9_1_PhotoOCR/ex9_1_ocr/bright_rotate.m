 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ת
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function bright_rotate(Image,Angle)
%ImageΪλͼ����
%X,YΪ��������
[X,Y]=size(Image);
%ԭͼ��ʾ
imshow(Image);
%�����ĸ��ǵ�������꣬ȷ����ת�����ʾ����
LeftTop(1,1)=-(Y-1)*sin(Angle);
LeftTop(1,2)=(Y-1)*cos(Angle);

LeftBottom(1,1)=0;
LeftBottom(1,2)=0;

RightTop(1,1)=(X-1)*cos(Angle)-(Y-1)*sin(Angle);
RightTop(1,2)=(X-1)*sin(Angle)+(Y-1)*cos(Angle);

RightBottom(1,1)=(X-1)*cos(Angle);
RightBottom(1,2)=(X-1)*sin(Angle);

%������ʾ�����������
Xnew=max([LeftTop(1,1),LeftBottom(1,1),RightTop(1,1),RightBottom(1,1)])-min([LeftTop(1,1),LeftBottom(1,1),RightTop(1,1),RightBottom(1,1)]);
Ynew=max([LeftTop(1,2),LeftBottom(1,2),RightTop(1,2),RightBottom(1,2)])-min([LeftTop(1,2),LeftBottom(1,2),RightTop(1,2),RightBottom(1,2)]);

% ��������ʾ�������
ImageNew=zeros(round(Xnew),round(Ynew))+255;

%����ԭͼ������ص�������
for indexX=0:(X-1)
    for indexY=0:(Y-1)
      ImageNew(round(indexX*cos(Angle)-indexY*sin(Angle))+round(abs(min([LeftTop(1,1),LeftBottom(1,1),RightTop(1,1),RightBottom(1,1)])))+1,1+round(indexX*sin(Angle)+indexY*cos(Angle))+round(abs(min([LeftTop(1,2),LeftBottom(1,2),RightTop(1,2),RightBottom(1,2)]))))=Image(indexX+1,indexY+1);
end
end

%��ʾ
figure;
imshow((ImageNew)/255)
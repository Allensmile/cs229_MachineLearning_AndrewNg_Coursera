function [im]=bright_standard_resizeImage2(Img0,sHeight,sWidth) %imo
%
%imo=imread(dirrr);%��ȡ
%s=0.15625;%���ű��������ź���ԭʼ��С�ı�ֵ
%dirr='D:\���ļ�����\����ʶ�����ͼƬ��(237��������Ƭ)(�ļ������ǳ��ƺ�)\';
%fileName='��AAD198.jpg';
%Img0 = imread(strcat(dirr,fileName));
%figure(1)
%imshow(Img0);%ԭͼ��ʾ
 %Imgoo=rgb2gray(Img0);
 %Imgoo2=Imgoo/255 %double(
%sHeight=0.1041666*5;
%sWidth=0.078125*5;
s=sHeight;
imo=Img0;
[m n d]=size(imo);
if s<=1 & s>0
    for i=1:d
        im(:,:,i)=imo(round(1:1/s:m),round(1:1/sWidth:n),i);
    end
elseif s>1
    [X Y]=meshgrid(1:n,1:m);
    [Xt Yt]=meshgrid(1:1/s:n,1:1/sWidth:m);
    for i=1:d
        im(:,:,i)=interp2(double(imo(:,:,i)),Xt,Yt,'spline');
    end
    if isa(imo,'uint8')
        im=uint8(im);
    else 
        im=uint16(im);
    end
end
%figure(2)
%imshow(im);%����ͼ��ʾ
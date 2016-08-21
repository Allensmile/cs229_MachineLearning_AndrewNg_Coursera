function [ XX ] = createMyOwnDataSet()
%CREATEMYOWNDATASET create my own dataset based on email content from text
%file.
%   �˴���ʾ��ϸ˵��
% get files from dir
%dirr='C:\Users\think\Downloads\20021010_easy_ham.tar\20021010_easy_ham\easy_ham\';
%files=dir(dirr);
    Files = dir(fullfile('D:\\english\\','*.*')); 
         LengthFiles = length(Files)

         for i = 1:LengthFiles;

                  emailTxtFile=Files.name

                  %�Լ�дͼ������ ImgProc(Img);
                  
file_contents = readFile(emailTxtFile);
 word_indices  = processEmail(file_contents);
 features= emailFeatures(word_indices);
 XX(i,:)=features;
 % Print Stats
 fprintf('Length of feature vector: %d\n', length(features));
 fprintf('Number of non-zero entries: %d\n', sum(features > 0));
         end;

end


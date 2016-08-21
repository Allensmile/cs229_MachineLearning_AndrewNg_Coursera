function [theta] =gainModel(filePath,input_layer_size,hidden_layer_size,num_labels)
% GAINMODEL gain parameter from 
data=csvread(filePath);% test.csv
%plot model with price
y=data(:,1);
X=data(:,2:end);
m=length(y);
%[X_norm, mu, sigma] = bright_featureNormalize(X);
%X=X_norm;
% 3 layer N network. 
%input layer unit8; hidden layer unit:96;output layer unit: 7000
Theta1=randInitializeWeights(input_layer_size, hidden_layer_size);
Theta2=randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params=[Theta1(:);Theta2(:)];

%% =================== Part 8: Training NN ===================
%  You should also try different values of lambda
options = optimset('MaxIter', 2000); %20---��50 -->100---��200
% Create "short hand" for the cost function to be minimized 
lambda=0.03;% best is 0.01
lambdas=[0.003,0.01,0.03,0.1,0.3,1,3,10,100]; %get best lambad from list[0.003,0.01,0.03,0.1,0.3,1,3,10,30];-->0.01
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
 % Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);  
% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1)); 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%save theta1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f_id2=fopen('testResult_theta1.txt','wt');%�ڵ�ǰĿ¼��д�ķ�ʽ�򿪻򴴽�txt�ļ�
%a=randi(9,10);%����Ҫ����ľ��� ��������һ����������������Ҫ����Ľ����ʾ��
for i=1:size(Theta1,1)
    fprintf(f_id2,'%d ',Theta1(i,:));%��� ����������� ��ͳһ���Ƹ�ʽ
    fprintf(f_id2,'\n');%����
end
fclose(f_id2);%�ر��ļ�
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%save theta2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_id3=fopen('testResult_theta2.txt','wt');%�ڵ�ǰĿ¼��д�ķ�ʽ�򿪻򴴽�txt�ļ�
%a=randi(9,10);%����Ҫ����ľ��� ��������һ����������������Ҫ����Ľ����ʾ��
for i=1:size(Theta2,1)
    fprintf(f_id3,'%d ',Theta2(i,:));%��� ����������� ��ͳһ���Ƹ�ʽ
    fprintf(f_id3,'\n');%����
end
fclose(f_id3);%�ر��ļ�
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
fprintf('\nTraining Set Accuracy(different less than 300): %f\n', mean(double(abs(pred-y)<300)) * 100);


plot(pred',y,'rx');
xlabel('����ƻ������ϵͳԤ��ֵ');
ylabel('ƻ���ֻ��۸�');

 save bright_data.mat

%save result to file sytem---> predict
f_id=fopen('testResult.txt','wt');%�ڵ�ǰĿ¼��д�ķ�ʽ�򿪻򴴽�txt�ļ�
%a=randi(9,10);%����Ҫ����ľ��� ��������һ����������������Ҫ����Ľ����ʾ��
for i=1:size(pred,1)
    fprintf(f_id,'%d ',pred(i,:));%��� ����������� ��ͳһ���Ƹ�ʽ
    fprintf(f_id,'\n');%����
end
fclose(f_id);%�ر��ļ�


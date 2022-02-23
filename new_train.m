tic;
clear
close all
%% 定义系数
global k_mode sigma betaa C
betaa=1e9;
k_mode=0; % kernal mode,0 for linear,1 for RBF
sigma=1; % RBF's coefficient 8
C=30;% coefficient in C-SVC 20.007
%% 引入训练数据
load('semgExcerciseRand.mat')

% RMS
% window=100;
% moving_window=false;
% xTest = new_rms(xTest, window, moving_window);
% xTrain = new_rms(xTrain, window, moving_window);

train1=[];
train2=[];
train3=[];
train4=[];
train5=[];

test1=[];
test2=[];
test3=[];
test4=[];
test5=[];

for i=1:20000
    if yTrain(i)==1
        train1=[train1;xTrain(i,:)];
    else if yTrain(i)==2
            train2=[train2;xTrain(i,:)];
        else if yTrain(i)==3
                train3=[train3;xTrain(i,:)];
            else if yTrain(i)==4
                    train4=[train4;xTrain(i,:)];
                else if yTrain(i)==5
                        train5=[train5;xTrain(i,:)];
                    end
                end
            end
        end
    end
end
for i=1:5000
    if yTest(i)==1
        test1=[test1;xTrain(i,:)];
    else if yTest(i)==2
            test2=[test2;xTest(i,:)];
        else if yTest(i)==3
                test3=[test3;xTest(i,:)];
            else if yTest(i)==4
                    test4=[test4;xTest(i,:)];
                else if yTest(i)==5
                        test5=[test5;xTrain(i,:)];
                    end
                end
            end
        end
    end
end

% train1=zscore(train1);
% train2=zscore(train2);
% train3=zscore(train3);
% train4=zscore(train4);
% train5=zscore(train5);
% 
% test1=zscore(test1);
% test2=zscore(test2);
% test3=zscore(test3);
% test4=zscore(test4);
% test5=zscore(test5);
% 
% window_size=50;

% train1=rms(train1,window_size);
% train2=rms(train2,window_size);
% train3=rms(train3,window_size);
% train4=rms(train4,window_size);
% train5=rms(train5,window_size);
% 
% test1=rms(test1,window_size);
% test2=rms(test2,window_size);
% test3=rms(test3,window_size);
% test4=rms(test4,window_size);
% test5=rms(test5,window_size);

%% 模型训练
train_x12=[train1;train2];
train_y12=[ones(size(train1,1),1);-1*ones(size(train2,1),1)];
[alpha12,~,~]=new_svm_solve(train_x12,train_y12);
[b12,~,~]=SVM_b(alpha12,train_x12,train_y12);

train_x13=[train1;train3];
train_y13=[ones(size(train1,1),1);-1*ones(size(train3,1),1)];
[alpha13,~,~]=new_svm_solve(train_x13,train_y13);
[b13,~,~]=SVM_b(alpha13,train_x13,train_y13);

train_x14=[train1;train4];
train_y14=[ones(size(train1,1),1);-1*ones(size(train4,1),1)];
[alpha14,~,~]=new_svm_solve(train_x14,train_y14);
[b14,~,~]=SVM_b(alpha14,train_x14,train_y14);

train_x15=[train1;train5];
train_y15=[ones(size(train1,1),1);-1*ones(size(train5,1),1)];
[alpha15,~,~]=new_svm_solve(train_x15,train_y15);
[b15,~,~]=SVM_b(alpha15,train_x15,train_y15);

train_x23=[train2;train3];
train_y23=[ones(size(train2,1),1);-1*ones(size(train3,1),1)];
[alpha23,~,~]=new_svm_solve(train_x23,train_y23);
[b23,~,~]=SVM_b(alpha23,train_x23,train_y23);

train_x24=[train2;train4];
train_y24=[ones(size(train2,1),1);-1*ones(size(train4,1),1)];
[alpha24,~,~]=new_svm_solve(train_x24,train_y24);
[b24,~,~]=SVM_b(alpha24,train_x24,train_y24);

train_x25=[train2;train5];
train_y25=[ones(size(train2,1),1);-1*ones(size(train5,1),1)];
[alpha25,~,~]=new_svm_solve(train_x25,train_y25);
[b25,~,~]=SVM_b(alpha25,train_x25,train_y25);

train_x34=[train3;train4];
train_y34=[ones(size(train3,1),1);-1*ones(size(train4,1),1)];
[alpha34,~,~]=new_svm_solve(train_x34,train_y34);
[b34,~,~]=SVM_b(alpha34,train_x34,train_y34);

train_x35=[train3;train5];
train_y35=[ones(size(train3,1),1);-1*ones(size(train5,1),1)];
[alpha35,~,~]=new_svm_solve(train_x35,train_y35);
[b35,~,~]=SVM_b(alpha35,train_x35,train_y35);

train_x45=[train4;train5];
train_y45=[ones(size(train4,1),1);-1*ones(size(train5,1),1)];
[alpha45,~,~]=new_svm_solve(train_x45,train_y45);
[b45,~,~]=SVM_b(alpha45,train_x45,train_y45);
save('train.mat');
%% 进行测试
[accu1,num1]=new_vote(test1,1);
[accu2,num2]=new_vote(test2,2);
[accu3,num3]=new_vote(test3,3);
[accu4,num4]=new_vote(test4,4);
[accu5,num5]=new_vote(test5,5);
accuracy=(accu1+accu2+accu3+accu4+accu5)/(num1+num2+num3+num4+num5)

toc;
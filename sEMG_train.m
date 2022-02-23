tic;
%% 定义系数
global k_mode sigma betaa C
betaa=1e9;
k_mode=1; % kernal mode,0 for linear,1 for RBF
sigma=5; % RBF's coefficient 8
C=10;% coefficient in C-SVC 20.007
%% 引入训练数据
load('predata.mat');
train1=zscore(train1);
train2=zscore(train2);
train3=zscore(train3);
train4=zscore(train4);
train5=zscore(train5);
train6=zscore(train6);

test1=zscore(test1);
test2=zscore(test2);
test3=zscore(test3);
test4=zscore(test4);
test5=zscore(test5);
test6=zscore(test6);

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

train_x16=[train1;train6];
train_y16=[ones(size(train1,1),1);-1*ones(size(train6,1),1)];
[alpha16,~,~]=new_svm_solve(train_x16,train_y16);
[b16,~,~]=SVM_b(alpha16,train_x16,train_y16);

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

train_x26=[train2;train6];
train_y26=[ones(size(train2,1),1);-1*ones(size(train6,1),1)];
[alpha26,~,~]=new_svm_solve(train_x26,train_y26);
[b26,~,~]=SVM_b(alpha26,train_x26,train_y26);

train_x34=[train3;train4];
train_y34=[ones(size(train3,1),1);-1*ones(size(train4,1),1)];
[alpha34,~,~]=new_svm_solve(train_x34,train_y34);
[b34,~,~]=SVM_b(alpha34,train_x34,train_y34);

train_x35=[train3;train5];
train_y35=[ones(size(train3,1),1);-1*ones(size(train5,1),1)];
[alpha35,~,~]=new_svm_solve(train_x35,train_y35);
[b35,~,~]=SVM_b(alpha35,train_x35,train_y35);

train_x36=[train3;train6];
train_y36=[ones(size(train3,1),1);-1*ones(size(train6,1),1)];
[alpha36,~,~]=new_svm_solve(train_x36,train_y36);
[b36,~,~]=SVM_b(alpha36,train_x36,train_y36);

train_x45=[train4;train5];
train_y45=[ones(size(train4,1),1);-1*ones(size(train5,1),1)];
[alpha45,~,~]=new_svm_solve(train_x45,train_y45);
[b45,~,~]=SVM_b(alpha45,train_x45,train_y45);

train_x46=[train4;train6];
train_y46=[ones(size(train4,1),1);-1*ones(size(train6,1),1)];
[alpha46,~,~]=new_svm_solve(train_x46,train_y46);
[b46,~,~]=SVM_b(alpha46,train_x46,train_y46);

train_x56=[train5;train6];
train_y56=[ones(size(train5,1),1);-1*ones(size(train6,1),1)];
[alpha56,~,~]=new_svm_solve(train_x56,train_y56);
[b56,~,~]=SVM_b(alpha56,train_x56,train_y56);

save('train.mat');
%% 进行测试
[accu1,num1]=vote(test1,1);
[accu2,num2]=vote(test2,2);
[accu3,num3]=vote(test3,3);
[accu4,num4]=vote(test4,4);
[accu5,num5]=vote(test5,5);
[accu6,num6]=vote(test6,6);
accuracy=(accu1+accu2+accu3+accu4+accu5+accu6)/(num1+num2+num3+num4+num5+num6)

toc;
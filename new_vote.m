function [accu,t_x]=vote(testdata,label)
t_x=size(testdata,1);
load("train.mat");
%% 进行测试，由于矩阵维度不一样，只能两两进行测试
temp=[];
vote=zeros(t_x,5);
for j=1:t_x
    temp=[temp;SVM_decision(alpha12,b12,testdata(j,:),train_x12,train_y12)];
end
pre_12=sign(temp);
for k=1:t_x
    if pre_12(k,1)>=0
       vote(k,1)=vote(k,1)+1;
    else
        vote(k,2)=vote(k,2)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha13,b13,testdata(j,:),train_x13,train_y13)];
end
pre_13=sign(temp);
for k=1:t_x
    if pre_13(k,1)>=0
        vote(k,1)=vote(k,1)+1;
    else
        vote(k,3)=vote(k,3)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha14,b14,testdata(j,:),train_x14,train_y14)];
end
pre_14=sign(temp);
for k=1:t_x
    if pre_14(k,1)>=0
        vote(k,1)=vote(k,1)+1;
    else
        vote(k,4)=vote(k,4)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha15,b15,testdata(j,:),train_x15,train_y15)];
    pre_15=sign(temp);
end
for k=1:t_x
    if pre_15(k,1)>=0
        vote(k,1)=vote(k,1)+1;
    else
        vote(k,5)=vote(k,5)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha23,b23,testdata(j,:),train_x23,train_y23)];
end
pre_23=sign(temp);
for k=1:t_x
    if pre_23(k,1)>=0
        vote(k,2)=vote(k,2)+1;
    else
        vote(k,3)=vote(k,3)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha24,b24,testdata(j,:),train_x24,train_y24)];
end
pre_24=sign(temp);
for k=1:t_x
    if pre_24(k,1)>=0
        vote(k,2)=vote(k,2)+1;
    else
        vote(k,4)=vote(k,4)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha25,b25,testdata(j,:),train_x25,train_y25)];
end
pre_25=sign(temp);
for k=1:t_x
    if pre_25(k,1)>=0
        vote(k,2)=vote(k,2)+1;
    else
        vote(k,5)=vote(k,5)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha34,b34,testdata(j,:),train_x34,train_y34)];
end
pre_34=sign(temp);
for k=1:t_x
    if pre_34(k,1)>=0
        vote(k,3)=vote(k,3)+1;
    else
        vote(k,4)=vote(k,4)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha35,b35,testdata(j,:),train_x35,train_y35)];
end
pre_35=sign(temp);
for k=1:t_x
    if pre_35(k,1)>=0
        vote(k,3)=vote(k,3)+1;
    else
        vote(k,5)=vote(k,5)+1;
    end
end
temp=[];
for j=1:t_x
    temp=[temp;SVM_decision(alpha45,b45,testdata(j,:),train_x45,train_y45)];
end
pre_45=sign(temp);
for k=1:t_x
    if pre_45(k,1)>=0
        vote(k,4)=vote(k,4)+1;
    else
        vote(k,5)=vote(k,5)+1;
    end
end
%% 投票结果
dealed_vote=zeros(t_x,5);
for i=1:t_x
    [~,index]=max(vote(i,:));
    dealed_vote(i,index)=1;
end
vote=fliplr(vote);%左右元素调换
for i=1:t_x
    [~,index]=max(vote(i,:));
    dealed_vote(i,6-index)=dealed_vote(i,6-index)+1;
end
%单票胜出算两票，平票分别算一票
accu=0;
for i=1:t_x
    [~,result]=max(dealed_vote(i,:));
    if result==label
        accu=accu+1;
    end
end
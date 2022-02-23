tic
clear
%% 导入测试集
load('predata.mat');
%% 归一化数据
test_data1=zscore(tdata1);
test_data2=zscore(tdata2);
test_data3=zscore(tdata3);
test_data4=zscore(tdata4);
test_data5=zscore(tdata5);
test_data6=zscore(tdata6);
test_data=[test_data1;test_data2;test_data3;test_data4;test_data5;test_data6];
%% 开始分类
[accu1,num1]=vote(test_data1,1);
[accu2,num2]=vote(test_data2,2);
[accu3,num3]=vote(test_data3,3);
[accu4,num4]=vote(test_data4,4);
[accu5,num5]=vote(test_data5,5);
[accu6,num6]=vote(test_data6,6);
accuracy=(accu1+accu2+accu3+accu4+accu5+accu6)/(num1+num2+num3+num4+num5+num6);
toc
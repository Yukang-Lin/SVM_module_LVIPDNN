tic
%% 导入和预处理数据
clear
close all
file_path
train1=[];
train2=[];
train3=[];
train4=[];
train5=[];
train6=[];

test1=[];
test2=[];
test3=[];
test4=[];
test5=[];
test6=[];

l=1;
u=5;
rate=0.7;
mid=floor((u-l+1)*rate);
window_size=50;
for i=l:mid
    [a1,a2,a3,a4,a5,a6]=pre_processing(file(i,1));
    a1 = rms(a1, window_size);
    a2 = rms(a2, window_size);
    a3 = rms(a3, window_size);
    a4 = rms(a4, window_size);
    a5 = rms(a5, window_size);
    a6 = rms(a6, window_size);
    train1=[train1;a1];
    train2=[train2;a2];
    train3=[train3;a3];
    train4=[train4;a4];
    train5=[train5;a5];
    train6=[train6;a6];
    fprintf("第%d次完成\n",i);
end
for j=mid:u
    [a1,a2,a3,a4,a5,a6]=pre_processing(file(j,1));
    a1 = rms(a1, window_size);
    a2 = rms(a2, window_size);
    a3 = rms(a3, window_size);
    a4 = rms(a4, window_size);
    a5 = rms(a5, window_size);
    a6 = rms(a6, window_size);
    test1=[test1;a1];
    test2=[test2;a2];
    test3=[test3;a3];
    test4=[test4;a4];
    test5=[test5;a5];
    test6=[test6;a6];
    fprintf("第%d次完成\n",j);
end 

save('predata.mat','train1','test1','train2','test2','train3','test3','train4','test4','train5','test5','train6','test6');

toc
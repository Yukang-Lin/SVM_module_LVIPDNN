function [pdata1, pdata2, pdata3, pdata4, pdata5, pdata6]=pre_processing(filename)%����Ԥ����
%% ȥ��0��ǩԪ�أ����ݱ�ǩ���з���
data=load(filename);
[data_r,~]=size(data);
pdata=data;
for i=data_r:-1:1
    if data(i,10)==0||data(i,10)==7
        pdata(i,:)=[];
     end
end
%% ����ͬ��ǩ�������뿪�������ǻ���±꣬��ȡ���Ӿ���
[pr,~]=size(pdata);
last_row=find_lastr(pdata,pr);
pdata1=pdata([1:last_row(1,1),last_row(6,1)+1:last_row(7,1)],1:10)*1e5;
pdata2=pdata([last_row(1,1)+1:last_row(2,1),last_row(7,1)+1:last_row(8,1)],1:10)*1e5;
pdata3=pdata([last_row(2,1)+1:last_row(3,1),last_row(8,1)+1:last_row(9,1)],1:10)*1e5;
pdata4=pdata([last_row(3,1)+1:last_row(4,1),last_row(9,1)+1:last_row(10,1)],1:10)*1e5;
pdata5=pdata([last_row(4,1)+1:last_row(5,1),last_row(10,1)+1:last_row(11,1)],1:10)*1e5;
pdata6=pdata([last_row(5,1)+1:last_row(6,1),last_row(11,1)+1:last_row(12,1)],1:10)*1e5;

%% ��ȥ�޹�ָ��
pdata1=pdata1(:,2:9);
pdata2=pdata2(:,2:9);
pdata3=pdata3(:,2:9);
pdata4=pdata4(:,2:9);
pdata5=pdata5(:,2:9);
pdata6=pdata6(:,2:9);

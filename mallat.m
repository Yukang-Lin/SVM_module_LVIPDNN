%% Mallat方法进行小波变换
load("predata10.mat");
selected_row=100;%设置参数
type='sym2';
level=2;
for i=1:size(pdata1,1)/selected_row
    temp=pdata1(1+(i-1)*selected_row:i*selected_row,:);
    pdata1(1+(i-1)*selected_row:i*selected_row,:)=mallatdec2(temp,type,level,selected_row);
    %pdata1(1+(i-1)*selected_row:i*selected_row,:)=mallatrec2(X,type,level,selected_row);
end
for i=1:size(pdata2,1)/selected_row
    temp=pdata2(1+(i-1)*selected_row:i*selected_row,:);
    pdata2(1+(i-1)*selected_row:i*selected_row,:)=mallatdec2(temp,type,level,selected_row);
    %pdata2(1+(i-1)*selected_row:i*selected_row,:)=mallatrec2(X,type,level,selected_row);
end
for i=1:size(pdata3,1)/selected_row
    temp=pdata3(1+(i-1)*selected_row:i*selected_row,:);
    pdata3(1+(i-1)*selected_row:i*selected_row,:)=mallatdec2(temp,type,level,selected_row);
    %pdata3(1+(i-1)*selected_row:i*selected_row,:)=mallatrec2(X,type,level,selected_row);
end
for i=1:size(pdata4,1)/selected_row
    temp=pdata4(1+(i-1)*selected_row:i*selected_row,:);
    pdata4(1+(i-1)*selected_row:i*selected_row,:)=mallatdec2(temp,type,level,selected_row);
    %pdata4(1+(i-1)*selected_row:i*selected_row,:)=mallatrec2(X,type,level,selected_row);
end
for i=1:size(pdata5,1)/selected_row
    temp=pdata5(1+(i-1)*selected_row:i*selected_row,:);
    pdata5(1+(i-1)*selected_row:i*selected_row,:)=mallatdec2(temp,type,level,selected_row);
    %pdata5(1+(i-1)*selected_row:i*selected_row,:)=mallatrec2(X,type,level,selected_row);
end
for i=1:size(pdata6,1)/selected_row
    temp=pdata6(1+(i-1)*selected_row:i*selected_row,:);
    pdata6(1+(i-1)*selected_row:i*selected_row,:)=mallatdec2(temp,type,level,selected_row);
    %pdata6(1+(i-1)*selected_row:i*selected_row,:)=mallatrec2(X,type,level,selected_row);
end


%% 将矩阵转化为向量，多余部分去掉了
adata1=change_format(pdata1,selected_row);
adata2=change_format(pdata2,selected_row);
adata3=change_format(pdata3,selected_row);
adata4=change_format(pdata4,selected_row);
adata5=change_format(pdata5,selected_row);
adata6=change_format(pdata6,selected_row);


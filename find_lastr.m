function last_row=find_lastr(pdata,pr)%���ҳ���ǩ�о������ʼ�±꣬ÿ���ļ���123456123456�ı�ǩ˳�����
i=1;
label=1;
last_row=[];
while 1
    if pdata(i+1,10)==label
        i=i+1;
    else
        last_row=[last_row;i];
        label=label+1;
        if label==7
            label=1;
        end
    end
    if i==pr
        last_row=[last_row;pr];
        return
    end
end
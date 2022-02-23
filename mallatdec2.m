function Y=mallatdec2(X,wname,level,selected_row)
%%
%����:
%     X      ����Ķ�άͼ������ֵ; 
%     level  С���ֽ��(��)���趨ֵ(����趨ֵ������߿ɷֽ����,����߷ֽ�����ֽ�)
%     wname  С������wavelet name
%�����
%     Y      �༫С���ֽ���С��ϵ������
[h,g]=wfilters(wname,'d');  %h,g�ֱ�Ϊ��ͨ�͸�ͨ�˲���
X=double(X);
t=1;
hh=size(X,2);
while t<=level  
    %������С���任
    for col=1:hh
        temp=mdec1( X(1:selected_row,col)',h,g);
        Y(1:selected_row,col)=temp';
    end
t=t+1;
hh=hh/2;
X=Y;
end

%%�ڲ��Ӻ�������һ��(row)ʸ������һ��С���任������fftʵ��
function y=mdec1(x,h,g)

%���룺x ������
%     hΪ��ͨ�˲���
%     gΪ��ͨ�˲���
%����� y ����һ��С���ֽ���ϵ��

lenx=size(x,2);
lenh=size(h,2);
rh=h(end:-1:1);
rrh=[zeros(1,(lenx-lenh)),rh];
rrh=circshift(rrh',1)';
rg=g(end:-1:1);
rrg=[zeros(1,(lenx-lenh)),rg];
rrg=circshift(rrg',1)';
r1=dyaddown(ifft(fft(x).*fft(rrh,lenx)),1);  %use para 1
r2=dyaddown(ifft(fft(x).*fft(rrg,lenx)),1);
y=[r1,r2];
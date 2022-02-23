function Y=mallatrec2(X,wname,level,selected_row)%��άС���ع�����
%����:
%     X      �����С��ϵ������; 
%     level  С���ֽ��(��)���趨ֵ(����趨ֵ������߿ɷֽ����,����߷ֽ�����ֽ�)
%     wname  С������wavelet name
%�����
%     Y      �ع�����

[h,g]=wfilters(wname,'d');  %h,g�ֱ�Ϊ�ع���ͨ�˲������ع���ͨ�˲���
hz=size(X,2);
h1=hz/(2^(level-1)); 
while h1<=hz 
    %���б任
    for col=1:h1
        temp=mrec1(X(1:selected_row,col)',h,g)';
        X(1:selected_row,col)=temp;
    end
%     %�ٶ��б任
%     for row=1:h1
%         temp=mrec1(X(row,1:h1),h,g);
%          X(row,1:h1)=temp;
%     end
     h1=h1*2;
end
Y=X;

%�ڲ��Ӻ�������һ��С��ϵ�������ع�
function y=mrec1(x,h,g)
%���룺x ������
%     hΪ��ͨ�˲���
%     gΪ��ͨ�˲���
%����� y ����һ��С���ع���ֵ

lenx=size(x,2);
r3=dyadup(x(1,1:lenx*0.5),0);   %�ڲ���use para 0
r4=dyadup(x(1,(lenx*0.5+1):lenx),0);   %use para 0
y=ifft(fft(r3,lenx).*fft(h,lenx))+ ifft(fft(r4,lenx).*fft(g,lenx));   

 
function Y=mallatdec2(X,wname,level,selected_row)
%%
%输入:
%     X      载入的二维图像像数值; 
%     level  小波分解次(级)数设定值(如果设定值超过最高可分解次数,按最高分解次数分解)
%     wname  小波名字wavelet name
%输出：
%     Y      多极小波分解后的小波系数矩阵
[h,g]=wfilters(wname,'d');  %h,g分别为低通和高通滤波器
X=double(X);
t=1;
hh=size(X,2);
while t<=level  
    %进行列小波变换
    for col=1:hh
        temp=mdec1( X(1:selected_row,col)',h,g);
        Y(1:selected_row,col)=temp';
    end
t=t+1;
hh=hh/2;
X=Y;
end

%%内部子函数，对一行(row)矢量进行一次小波变换，利用fft实现
function y=mdec1(x,h,g)

%输入：x 行数组
%     h为低通滤波器
%     g为高通滤波器
%输出： y 进行一级小波分解后的系数

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
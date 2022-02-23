function [b,m1,m_1]=SVM_b(alpha,xi,yi)
global m k_mode

clear i£¬j
m1=0;
m_1=0;
for i=1:m
    switch yi(i,1)
        case 1
            m1=m1+1;
            b1m1=0;
            for j=1:m
                b1m1=b1m1+alpha(j)*yi(j)*SVM_kernal(xi(j,:),xi(i,:),k_mode);
                b1(m1)=b1m1;
            end
        case -1
            m_1=m_1+1;
            b_1m_1=0;
            for j=1:m
                b_1m_1=b_1m_1+alpha(j)*yi(j)*SVM_kernal(xi(j,:),xi(i,:),k_mode);
                b_1(m_1)=b_1m_1;
            end
    end
end
b=-0.5*(max(b_1)+min(b1));

fprintf('%d positive samples,%d negative samples in training\n',m1,m_1)
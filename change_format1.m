function vector=change_format1(data,len)
[r,c]=size(data);
vector=[];
for j=1:c
    vector=[vector;data(:,j)];
end
vector=reshape(vector,floor(r/num),[]);
vector=vector';

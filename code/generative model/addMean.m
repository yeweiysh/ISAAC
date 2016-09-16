function f=addMean(e)
[row,col]=size(e);

h=floor(60*rand()+20);
for i=1:row
    for j=1:col
        e(i,j)=e(i,j)+h;
    end
end

f=e;
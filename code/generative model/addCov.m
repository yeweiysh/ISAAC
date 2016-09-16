function f=addCov(e)
row=size(e,1);
r=rand();
for i=1:row
    for j=i:row
        if i==j
            covmat(i,j)=1;
        else
            covmat(i,j)=r;
            covmat(j,i)=r;
        end
    end
end
L = chol(covmat);
ee=e'*L;
f=ee';
function f=multiKDE2(e_ISA,de)
[~,n]=size(e_ISA);
a=1;
b=0;
numdim=size(de,2);

for i=1:numdim
    if i==1
        b=b+de(1,1);
    else
        a=a+de(1,i-1);
        b=b+de(1,i);
    end
    s=e_ISA(a:b,:);
    d=b-a+1;
    fx=[];
    %     if n==1
    %         variance=ones(d,1);
    %         IQR=ones(d,1);
    %     else
    %     variance=var(s')';
    variance=std(s,0,2);
    IQR=iqr(s')';

    h=zeros(d,1);
    for jj=1:d
        if variance(jj,1)<IQR(jj,1)/1.34
            h(jj,1)=0.9*power(n,-1/(d+4))*variance(jj,1);
        else
            h(jj,1)=0.9*power(n,-1/(d+4))*IQR(jj,1)/1.34;
        end
    end
    
   t=kde(s,h);
   fx=evaluate(t, s);
    
    %pdf cost
    pdf_subspace_bit=0;
    for i1=1:n
        pdf_subspace_bit=pdf_subspace_bit-log2(fx(1,i1));
    end
    
    numofbandwidth=d;
    pdf_subspace(1,i)=pdf_subspace_bit+numofbandwidth/2*log2(n);
    
end
f=sum(pdf_subspace);
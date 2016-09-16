function f=multiKDE(e_ISA,de)
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
    % end
    %     cnt=1;
    h=zeros(d,1);
    for jj=1:d
        if variance(jj,1)<IQR(jj,1)/1.34
            %                     h=(power(4/(d+2),1/(d+4))*power(n,-1/(d+4)))*variance(jj,1);
            h(jj,1)=0.9*power(n,-1/(d+4))*variance(jj,1);
            %                     hh(cnt)=h;
            %                     cnt=cnt+1;
        else
            %                     h=(power(4/(d+2),1/(d+4))*power(n,-1/(d+4)))*IQR(jj,1)/1.34;
            h(jj,1)=0.9*power(n,-1/(d+4))*IQR(jj,1)/1.34;
            %                     hh(cnt)=h;
            %                     cnt=cnt+1;
        end
    end
    
    for i1=1:n
        x=s(:,i1);
        %mkde
        f=0;
        for ii=1:n
            k=1;
            for jj=1:d
                k=k/h(jj,1)*((2*pi)^(-0.5))*exp(-0.5*((x(jj)-s(jj,ii))/h(jj,1))^2);
            end
            f=f+k;
        end
        f=f/n;
        fx(1,i1)=f;
    end
    
    %     [cc,~]=sort(hh);
    %     cnt1=1;
    %     for i1=2:size(cc,2)
    %         if cc(i1)~=cc(i1-1)
    %             cnt1=cnt1+1;
    %         end
    %     end
    %     cnt1
    %pdf cost
    
    pdf_subspace_bit=0;
    for i1=1:n
        pdf_subspace_bit=pdf_subspace_bit-log2(fx(1,i1));
    end
    
    %parametercost
    %         H=[];
    %         resolution=[];
    %         minattr=[];
    %         numberofgrid=1;
    %         number=[];
    %         for jj=1:d
    %             if variance(jj,1)<IQR(jj,1)/1.34
    %                 h=(0.9*n^(-1/(d+4)))*variance(jj,1);
    %             else
    %                 h=(0.9*n^(-1/(d+4)))*IQR(jj,1)/1.34;
    %             end
    %             [s1,~]=sort(s(jj,:));
    %             H(jj,1)=h;
    %             resolution(jj,1)=ceil((s1(end)-s1(1)+h)/h);
    %             numberofgrid=numberofgrid*resolution(jj,1);
    %             minattr(jj,1)=s1(1)-h/2;
    %         end
    %         number=zeros(1,n);
    %         for ii=1:d
    %             for jj=1:n
    %                 belongs(ii,jj)=ceil((s(ii,jj)-minattr(ii,1))/H(ii,1));
    %             end
    %         end
    %         position=1;
    %         for ii=1:n
    %             for jj=1:d
    %                 position=position*belongs(jj,ii);
    %             end
    %             number(1,ii)= position;
    %             position=1;
    %         end
    %         [number1,~]=sort(number);
    %         number2=zeros(1,n);
    %         number2(1,1)=1;
    %         pointer=2;
    %         for ii=2:n
    %             if number1(1,ii)==number1(1,ii-1)
    %                 continue;
    %             else
    %                 number2(1,pointer)=1;
    %                 pointer=pointer+1;
    %             end
    %         end
    %
    %         numofbandwidth=size(find(number2~=0),2);
    
    numofbandwidth=d;
    pdf_subspace(1,i)=pdf_subspace_bit+numofbandwidth/2*log2(n);
    
end
f=sum(pdf_subspace);
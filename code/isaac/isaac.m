% Author Wei Ye
%ye@dbs.ifi.lmu.de

clear all; clc;
unknown_dimensions = 0;
ICA.opt_type = 'fastICA';
ICA.cost_type = 'I';
ICA.cost_name = 'KCCA';
ISA.cost_type = 'sum-I';
ISA.cost_name = 'KCCA';
ISA.opt_type = 'greedy';
iteration=1;

name={'stickfigure';'metabolome';'ecoli';'breast_wdbc'};

for dataset=3 %Here to change the pointer to dataset begining from 1 which correspondent to 'ecoli'
    filename=['real data\' name{dataset} '\' name{dataset} '.txt'];
    rd=load(filename);
    [~,lastcol]=size(rd);
    x=rd(:,1:lastcol-1)';
    gold=rd(:,lastcol-1:end);
    filename=['real data\' name{dataset} '\gold.txt'];
    save(filename,'gold','-ASCII');
    disp(strcat(['running dataset ', name{dataset}]))
    
    %% Finding the best partition
    
    counter=1;
    elip=[];
    tic
    d=size(x,1);
    n=size(x,2);
    for i=1:d
        permX(i,1)=i;
        permX1(1,i)=i;
    end
    for i=1:d
        for j=2:d
            permX(i,j)=-1;
        end
    end
    for i=1:d
        for j=1:d
            permXX(i,j)=-1;
        end
    end
    de=ones(1,d);
    count=1;
    elip(1,counter)=toc;
    counter=counter+1;
    for iter=1:iteration
        tic
        [e_hat,W_hat,~] = estimate_ISA(x,ICA,ISA,unknown_dimensions,de',d);
        es=e_hat';
        codingCost(1,iter)=comput_MDL(e_hat,W_hat,de);
        elip(1,counter)=toc;
    end
    filename=['real data\' name{dataset} '\the ' num2str(count) 'th de.txt'];
    save(filename,'de','-ASCII');
    filename=['real data\' name{dataset} '\the ' num2str(count) 'th estimated source.txt'];
    save(filename,'es','-ASCII');
    filename=['real data\' name{dataset} '\the ' num2str(count) 'th demixing matrix.txt'];
    save(filename,'W_hat','-ASCII');
    counter=counter+1;
    tic
    mdl(1)=sum(codingCost)/iteration;
    count=2;
    count1=1;
    elip(1,counter)=toc;
    counter=counter+1;
    
    
    
    while size(de,2)>1,
        tic
        D=size(de,2);
        permx=x(permX1,:);
        a=1;
        b=0;
        for i=1:D
            if i==1
                b=b+de(1,1);
            else
                a=a+de(1,i-1);
                b=b+de(1,i);
            end
            rangeSub(i,1)=a;
            rangeSub(i,2)=b;
        end
        
        min=10000;
        cnt=1;
        
        for i=1:D-1
            for j=(i+1):D      
                tempMatrix1=permx(rangeSub(i,1):rangeSub(i,2),:);
                tempMatrix2=permx(rangeSub(j,1):rangeSub(j,2),:);
                tempMatrix=[tempMatrix1;tempMatrix2];
                t=multiKDE2(tempMatrix,[de(1,i)+de(1,j)])-multiKDE2(tempMatrix,[de(1,i),de(1,j)]);
                if t<0
                    codingMatrix(1,cnt)=t;
                    codingMatrix(2,cnt)=i;
                    codingMatrix(3,cnt)=j;
                    cnt=cnt+1;
                end
                if t<=min
                    min=t;
                end
                clear tempMatrix1;
                clear tempMatrix2;
                clear tempMatrix;
            end
        end
        
        if min>0
            break;
        end
        index=[];
        [~,index]=sort(codingMatrix(1,:));
        codingMatrix2=codingMatrix(:,index);
        codingMatrix1(1,1)=codingMatrix2(2,1);
        codingMatrix1(2,1)=codingMatrix2(3,1);
        j1=2;
        for i=2:(cnt-1)
            cnt1=0;
            for i1=1:(i-1)
                if codingMatrix2(2,i)==codingMatrix2(2,i1)||codingMatrix2(2,i)==codingMatrix2(3,i1)||codingMatrix2(3,i)==codingMatrix2(2,i1)||codingMatrix2(3,i)==codingMatrix2(3,i1)
                    cnt1=cnt1+1;
                end
            end
            if cnt1==0
                codingMatrix1(1,j1)=codingMatrix2(2,i);
                codingMatrix1(2,j1)=codingMatrix2(3,i);
                j1=j1+1;
            end
        end
        cnt2=0;
        for i=1:(j1-1)
            j=1;
            for i1=1:d
                if permX(codingMatrix1(1,i),i1)~=-1
                    permXX(i,j)= permX(codingMatrix1(1,i),i1);
                    j=j+1;
                    cnt2=cnt2+1;
                else
                    break;
                end
            end
            for i1=1:d
                if permX(codingMatrix1(2,i),i1)~=-1
                    permXX(i,j)= permX(codingMatrix1(2,i),i1);
                    j=j+1;
                    cnt2=cnt2+1;
                else
                    break;
                end
            end
        end
        index1=j1;
        if cnt2<d
            for i=1:size(permX,1)
                cnt3=0;
                for j=1:(j1-1)
                    if i==codingMatrix1(1,j)|| i==codingMatrix1(2,j)
                        cnt3=cnt3+1;
                    end
                end
                if cnt3==0
                    permXX(index1,:)=permX(i,:);
                    index1=index1+1;
                end
            end
        end
        permX=[];
        permX=permXX;
        for i=1:d
            if permX(i,1)==-1
                index2=i;
                break;
            end
        end
        permX1=[];
        de=[];
        for i=1:d
            for j=1:d
                permXX(i,j)=-1;
            end
        end
        i1=1;
        for i=1:(index2-1)
            j1=0;
            for j=1:d
                if permX(i,j)~=-1
                    permX1(1,i1)=permX(i,j);
                    i1=i1+1;
                    j1=j1+1;
                else
                    break;
                end
            end
            de(1,i)=j1;
        end
        
        elip(1,counter)=toc;
        counter=counter+1;
        for iter=1:iteration
            tic
            [e_hat,W_hat,~] = estimate_ISA(x,ICA,ISA,unknown_dimensions,de',d);
            es=e_hat';
            codingCost(1,iter)=comput_MDL(e_hat,W_hat,de);
            elip(1,counter)=toc;
        end
        filename=['real data\' name{dataset} '\the ' num2str(count) 'th de.txt'];
        save(filename,'de','-ASCII');
        filename=['real data\' name{dataset} '\the ' num2str(count) 'th estimated source.txt'];
        save(filename,'es','-ASCII');
        filename=['real data\' name{dataset} '\the ' num2str(count) 'th demixing matrix.txt'];
        save(filename,'W_hat','-ASCII');
        counter=counter+1;
        tic
        mdl(count)=sum(codingCost)/iteration;
        elip(1,counter)=toc;
        counter=counter+1;
        count=count+1;
        clear codingMatrix;
        clear codingMatrix1;
        clear codingMatrix2;
        clear rangeSub;
        clear permx;
        
    end
    
    filename=['real data\' name{dataset}  '\mdl.txt'];
    save(filename,'mdl','-ASCII');
    [~,p]=sort(mdl);
    filename=['real data\' name{dataset} '\the best.txt'];
    save(filename,'p','-ASCII');
    clear mdl;
    %%
    %using EMh with MDL to automatically choose the number of clusters
    disp('clustering... ');
    tic
    itera=10;
    estimatedSource=load(['real data\' name{dataset} '\the ' num2str(p(1)) 'th estimated source.txt']);
    de=load(['real data\' name{dataset} '\the ' num2str(p(1)) 'th de.txt']);
    x1=estimatedSource;
    de=de';
    [num_subdim,~]=size(de);
    a=1;
    b=0;
    f=0;
    for i=1:num_subdim
        if i==1
            b=b+de(1,1);
        else
            a=a+de(i-1,1);
            b=b+de(i,1);
        end
        s=x1(:,a:b);
        dimm=b-a+1;
        row1=size(s,1);
        vacvalue=[];
        for k=1:10
            for it=1:itera
                slabel=EMh(s',k);
                [minmax,~]=sort(slabel);
                IDX(:,it)=slabel';
                vac=0;
                for k1=minmax(1):minmax(end)
                    a1=find(IDX(:,it)==k1);
                    row2=size(a1,1);
                    meanvalue=mean(s(a1,:));
                    stdvalue=std(s(a1,:));
                    m=size(meanvalue,2);
                    for k2=1:row2
                        for j=1:m
                            vac=vac+VAC(meanvalue(j),stdvalue(j),s(a1(k2),j));
                        end
                    end
                    vac=vac+row2*log2(row1/row2)+(dimm^2+3*dimm)/4*log2(row2);
                end
                vacv(1,it)=vac;
            end
            [minvac,subminvac]=sort(vacv);
            vacvalue(k,1)=minvac(1);
            IDX1(:,k)=IDX(:,subminvac(1));
            clear IDX;
            clear vacv;
            if (k>=2)&&(vacvalue(k,1)>vacvalue(k-1,1))
                break;
            end
        end
        [~,minsub]=sort(vacvalue);
        test(:,i)=IDX1(:,minsub(1));
        if dimm==2
            h=scatter(s(:,1),s(:,2),10,IDX1(:,minsub(1)),'filled');
            filename=['real data\' name{dataset} '\the ' num2str(i)  'th subspace.fig'];
            saveas( h,filename, 'fig');
            close all;
        end
        if dimm==3
            h=scatter3(s(:,1),s(:,2),s(:,3),10,IDX1(:,minsub(1)),'filled');
            filename=['real data\' name{dataset} '\the ' num2str(i)  'th subspace.fig'];
            saveas( h,filename, 'fig');
            close all;
        end
    end
    filename=['real data\' name{dataset} '\test.txt'];
    save(filename,'test','-ASCII');
    f1=Fmeasure(gold, test)
    elip(1,counter)=toc;
    elapsedTime=sum(elip);
    filename=['real data\' name{dataset} '\elapsedTime.txt'];
    save(filename,'elapsedTime','-ASCII');
    filename=['real data\' name{dataset} '\f1.txt'];
    save(filename,'f1','-ASCII');
    disp('finished! ')
    clear x1;
    clear test;
    clear IDX1;
    clear W_hat;
    clear e_hat;
    clear estimatedSource;
    clear gold;
    clear meanvalue;
    clear minmax;
    clear minsub;
    clear minvac;
    clear p;
    clear permX;
    clear permX1;
    clear permXX;
    clear rd;
    clear s;
    clear slabel;
    clear stdvalue;
    clear subminvac;
    clear vacvalue;
    clear x;
end
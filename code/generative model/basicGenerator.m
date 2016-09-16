function [d,label]=basicGenerator(dim,numberC)
d=[];
label=[];
% numberC=round(rand()+3);
% numcluster=[2 6 10 12 15 20 25 30 40 50];
% numberC=round(2*(rand()+1));
n=1200/numberC;
% k=ceil(numberC^0.5);
% cnt=1;
% for i=1:k^2
%     pos(cnt)=i*20;
% %     pos(cnt,2)=i*10;
%     cnt=cnt+1;
% end

for i=1:numberC
%         sigma=[2*rand(),0;0,3*rand()];
%         mu=pos(i,:);
%         e = mvnrnd(mu,sigma,n);
%     e=randlap([dim,n],rand());
    e=randn(dim,n);
%     e=addMean(e,pos(i));
    e=addMean(e);
    e=addCov(e);
    d=[d,e];
    %     d=[d;e];
    label=[label;i*ones(n,1)];
end
d=d';

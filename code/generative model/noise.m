clear;
clc;
for i=1:10
    filename=['Synthetic data\10dim\' num2str(i)  '\2views.mat'];
    load(filename);
    x1=x(:,1:4);
    gold=x(:,5:6);
    filename=['Synthetic data\noise\' num2str(i)  '\4 dimensions.txt'];
    save(filename,'x','-ASCII');
    for j=2:2:10
        y=x1;
        for k=1:j
            e=rand(1,1200);
            e=addMean(e);
            y=[y,e'];
        end
        y=[y,gold];
        filename=['Synthetic data\noise\' num2str(i)  '\' num2str(4+j) ' dimensions.txt'];
        save(filename,'y','-ASCII');
        y=[];
    end
end

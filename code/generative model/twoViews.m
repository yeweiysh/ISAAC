function g=twoViews(num)
[f,label]=basicGenerator(2,4);
[f1,label1]=basicGenerator(2,6);
t1=randperm(1200)';
f1=f1(t1,:);
label1=label1(t1,:);
x=[f,f1,label,label1];
filename=['C:\Users\ye\Desktop\workspace\isa for synthdata\ITE-0.52_code\code\Synthetic data\10dim\' num2str(num) '\2views.mat'];
save(filename,'x','-mat');

%2,4
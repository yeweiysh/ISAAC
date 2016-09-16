function g=fourViews(num)
[f,label]=basicGenerator(2,4);
[f1,label1]=basicGenerator(2,6);
t1=randperm(1200)';
f1=f1(t1,:);
label1=label1(t1,:);

[f2,label2]=basicGenerator(2,4);
t2=randperm(1200)';
while multiKDE([t1';t2'],[2])-multiKDE([t1';t2'],[1,1])<0,
    t2=randperm(1200)';
end
f2=f2(t2,:);
label2=label2(t2,:);

[f3,label3]=basicGenerator(2,6);
t3=randperm(1200)';
while (multiKDE([t1';t3'],[2])-multiKDE([t1';t3'],[1,1])<0)&&(multiKDE([t2';t3'],[2])-multiKDE([t2';t3'],[1,1])<0),
    t3=randperm(1200)';
end
f3=f3(t3,:);
label3=label3(t3,:);
x=[f,f1,f2,f3,label,label1,label2,label3];
filename=['C:\Users\ye\Desktop\workspace\isa for synthdata\ITE-0.52_code\code\Synthetic data\10dim\' num2str(num) '\4views.mat'];
save(filename,'x','-mat');

%2,4,10,30
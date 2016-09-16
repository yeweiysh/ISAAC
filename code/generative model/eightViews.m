function g=eightViews(num)

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

[f4,label4]=basicGenerator(2,4);
t4=randperm(1200)';
while (multiKDE([t1';t4'],[2])-multiKDE([t1';t4'],[1,1])<0)&&(multiKDE([t2';t4'],[2])-multiKDE([t2';t4'],[1,1])<0)&&(multiKDE([t3';t4'],[2])-multiKDE([t3';t4'],[1,1])<0),
    t4=randperm(1200)';
end
f4=f4(t4,:);
label4=label4(t4,:);
[f5,label5]=basicGenerator(2,6);
t5=randperm(1200)';
while (multiKDE([t1';t5'],[2])-multiKDE([t1';t5'],[1,1])<0)&&(multiKDE([t2';t5'],[2])-multiKDE([t2';t5'],[1,1])<0)&&(multiKDE([t3';t5'],[2])-multiKDE([t3';t5'],[1,1])<0)&&(multiKDE([t4';t5'],[2])-multiKDE([t4';t5'],[1,1])<0),
    t5=randperm(1200)';
end
f5=f5(t5,:);
label5=label5(t5,:);

[f6,label6]=basicGenerator(2,4);
t6=randperm(1200)';
while (multiKDE([t1';t6'],[2])-multiKDE([t1';t6'],[1,1])<0)&&(multiKDE([t2';t6'],[2])-multiKDE([t2';t6'],[1,1])<0)&&(multiKDE([t3';t6'],[2])-multiKDE([t3';t6'],[1,1])<0)&&(multiKDE([t4';t6'],[2])-multiKDE([t4';t6'],[1,1])<0)&&(multiKDE([t5';t6'],[2])-multiKDE([t5';t6'],[1,1])<0),
    t6=randperm(1200)';
end
f6=f6(t6,:);
label6=label6(t6,:);
[f7,label7]=basicGenerator(2,6);
t7=randperm(1200)';
while (multiKDE([t1';t7'],[2])-multiKDE([t1';t7'],[1,1])<0)&&(multiKDE([t2';t7'],[2])-multiKDE([t2';t7'],[1,1])<0)&&(multiKDE([t3';t7'],[2])-multiKDE([t3';t7'],[1,1])<0)&&(multiKDE([t4';t7'],[2])-multiKDE([t4';t7'],[1,1])<0)&&(multiKDE([t5';t7'],[2])-multiKDE([t5';t7'],[1,1])<0)&&(multiKDE([t6';t7'],[2])-multiKDE([t6';t7'],[1,1])<0),
    t7=randperm(1200)';
end
f7=f7(t7,:);
label7=label7(t7,:);
x=[f,f1,f2,f3,f4,f5,f6,f7,label,label1,label2,label3,label4,label5,label6,label7];
filename=['C:\Users\ye\Desktop\workspace\isa for synthdata\ITE-0.52_code\code\Synthetic data\10dim\' num2str(num) '\8views.mat'];
save(filename,'x','-mat');

%2 4 10 30 50 80 100 120
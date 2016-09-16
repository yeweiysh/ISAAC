clear;
[f,label]=basicGenerator(2);
[f1,label1]=basicGenerator(2);
t1=randperm(1200)';
f1=f1(t1,:);
label1=label1(t1,:);
%     x=[f,f1,label,label1];
%     filename=['Synthetic data\2views.mat'];
%     save(filename,'x','-mat');

[f2,label2]=basicGenerator(2);
t2=randperm(1200)';
while multiKDE([t1';t2'],[2])-multiKDE([t1';t2'],[1,1])<0,
    t2=randperm(1200)';
end
f2=f2(t2,:);
label2=label2(t2,:);

[f3,label3]=basicGenerator(2);
t3=randperm(1200)';
while (multiKDE([t1';t3'],[2])-multiKDE([t1';t3'],[1,1])<0)&&(multiKDE([t2';t3'],[2])-multiKDE([t2';t3'],[1,1])<0),
    t3=randperm(1200)';
end
f3=f3(t3,:);
label3=label3(t3,:);
%     x=[f,f1,f2,f3,label,label1,label2,label3];
%     filename=['Synthetic data\4views.mat'];
%     save(filename,'x','-mat');


[f4,label4]=basicGenerator(2);
t4=randperm(1200)';
while (multiKDE([t1';t4'],[2])-multiKDE([t1';t4'],[1,1])<0)&&(multiKDE([t2';t4'],[2])-multiKDE([t2';t4'],[1,1])<0)&&(multiKDE([t3';t4'],[2])-multiKDE([t3';t4'],[1,1])<0),
    t4=randperm(1200)';
end
f4=f4(t4,:);
label4=label4(t4,:);
[f5,label5]=basicGenerator(2);
t5=randperm(1200)';
while (multiKDE([t1';t5'],[2])-multiKDE([t1';t5'],[1,1])<0)&&(multiKDE([t2';t5'],[2])-multiKDE([t2';t5'],[1,1])<0)&&(multiKDE([t3';t5'],[2])-multiKDE([t3';t5'],[1,1])<0)&&(multiKDE([t4';t5'],[2])-multiKDE([t4';t5'],[1,1])<0),
    t5=randperm(1200)';
end
f5=f5(t5,:);
label5=label5(t5,:);
% x=[f,f1,f2,f3,f4,f5,label,label1,label2,label3,label4,label5];
% filename=['Synthetic data\6views.mat'];
% save(filename,'x','-mat');

[f6,label6]=basicGenerator(2);
t6=randperm(1200)';
while (multiKDE([t1';t6'],[2])-multiKDE([t1';t6'],[1,1])<0)&&(multiKDE([t2';t6'],[2])-multiKDE([t2';t6'],[1,1])<0)&&(multiKDE([t3';t6'],[2])-multiKDE([t3';t6'],[1,1])<0)&&(multiKDE([t4';t6'],[2])-multiKDE([t4';t6'],[1,1])<0)&&(multiKDE([t5';t6'],[2])-multiKDE([t5';t6'],[1,1])<0),
    t6=randperm(1200)';
end
f6=f6(t6,:);
label6=label6(t6,:);
[f7,label7]=basicGenerator(2);
t7=randperm(1200)';
while (multiKDE([t1';t7'],[2])-multiKDE([t1';t7'],[1,1])<0)&&(multiKDE([t2';t7'],[2])-multiKDE([t2';t7'],[1,1])<0)&&(multiKDE([t3';t7'],[2])-multiKDE([t3';t7'],[1,1])<0)&&(multiKDE([t4';t7'],[2])-multiKDE([t4';t7'],[1,1])<0)&&(multiKDE([t5';t7'],[2])-multiKDE([t5';t7'],[1,1])<0)&&(multiKDE([t6';t7'],[2])-multiKDE([t6';t7'],[1,1])<0),
    t7=randperm(1200)';
end
f7=f7(t7,:);
label7=label7(t7,:);
% x=[f,f1,f2,f3,f4,f5,f6,f7,label,label1,label2,label3,label4,label5,label6,label7];
% filename=['Synthetic data\8views.mat'];
% save(filename,'x','-mat');


[f8,label8]=basicGenerator(2);
t8=randperm(1200)';
while (multiKDE([t1';t8'],[2])-multiKDE([t1';t8'],[1,1])<0)&&(multiKDE([t2';t8'],[2])-multiKDE([t2';t8'],[1,1])<0)&&(multiKDE([t3';t8'],[2])-multiKDE([t3';t8'],[1,1])<0)&&(multiKDE([t4';t8'],[2])-multiKDE([t4';t8'],[1,1])<0)&&(multiKDE([t5';t8'],[2])-multiKDE([t5';t8'],[1,1])<0)&&(multiKDE([t6';t8'],[2])-multiKDE([t6';t8'],[1,1])<0)&&(multiKDE([t7';t8'],[2])-multiKDE([t7';t8'],[1,1])<0),
    t8=randperm(1200)';
end
f8=f8(t8,:);
label8=label8(t8,:);

[f9,label9]=basicGenerator(2);
t9=randperm(1200)';
while (multiKDE([t1';t9'],[2])-multiKDE([t1';t9'],[1,1])<0)&&(multiKDE([t2';t9'],[2])-multiKDE([t2';t9'],[1,1])<0)&&(multiKDE([t3';t9'],[2])-multiKDE([t3';t9'],[1,1])<0)&&(multiKDE([t4';t9'],[2])-multiKDE([t4';t9'],[1,1])<0)&&(multiKDE([t5';t9'],[2])-multiKDE([t5';t9'],[1,1])<0)&&(multiKDE([t6';t9'],[2])-multiKDE([t6';t9'],[1,1])<0)&&(multiKDE([t7';t9'],[2])-multiKDE([t7';t9'],[1,1])<0)&&(multiKDE([t8';t9'],[2])-multiKDE([t8';t9'],[1,1])<0),
    t9=randperm(1200)';
end
f9=f9(t9,:);
label9=label9(t9,:);
x=[f,f1,f2,f3,f4,f5,f6,f7,f8,f9,label,label1,label2,label3,label4,label5,label6,label7,label8,label9];
filename=['Synthetic data\10views.mat'];
save(filename,'x','-mat');







% a=[1 1 1 1 1 1 1 1];
% b=[2 2 1 1 1 1 0 0;3 1 1 1 1 1 0 0];
% c=[2 2 2 2 0 0 0 0;3 1 2 2 0 0 0 0;3 1 3 1 0 0 0 0;4 2 1 1 0 0 0 0;5 1 1 1 0 0 0 0];
% d=[4 4 0 0 0 0 0 0;5 3 0 0 0 0 0 0;6 2 0 0 0 0 0 0;7 1 0 0 0 0 0 0];
% count=1;
% for i=1
%     for j=1:2
%         for k=1:5
%             for p=1:4
%                 de=[a(i,:);b(j,:);c(k,:);d(p,:)];
%                 filename=['Synthetic data\' num2str(count) '\de.mat'];
%                 save(filename,'de','-mat');
%                 count=count+1;
%             end
%         end
%     end
% end





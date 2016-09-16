function f=SameCluster(objectA, objectB)
col=size(objectA,2);
t=0;
for j=1:col
    if objectA(j)==objectB(j)
        t=t+1;
    end
end
if t==0
    f=0;
else
    f=1;
end
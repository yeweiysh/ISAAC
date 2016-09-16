function f=Fmeasure(gold, test)
%'gold' is gold standard label
%'test' is test clustering label
[row,col]=size(gold);
[~,col1]=size(test);
TP=0;
FP=0;
FN=0;
TN=0;
for i=1:(row-1)
    for j=(i+1):row
        if SameCluster(test(i,:), test(j,:))==1
            if SameCluster(gold(i,:), gold(j,:))==1
                TP=TP+1;
            else
                FP=FP+1;
            end
        else
            if SameCluster(gold(i,:), gold(j,:))==1
                FN=FN+1;
            else
                TN=TN+1;
            end
        end
        
    end
end
precision = TP / (TP + FP);
recall = TP / (TP + FN);
f1 = 2 * precision * recall / (precision + recall);
f=f1;
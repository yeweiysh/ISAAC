function mdlcost=comput_MDL(e_hat,W_hat,dss)

% pdf_cost=cost_pdf(e_hat,dss)
% pdf_cost=multivariate_kde(e_hat,dss);
% pdf_cost=mkde(e_hat,dss);
% pdf_cost=clustering(e_hat,dss);

pdf_cost=multiKDE2(e_hat,dss);


a=size(dss,2);
cc=0;
for i=1:a
    cc=cc+dss(i)/2*log2(size(e_hat,1)/dss(i));
end
% ss_cost=a*log2(size(e_hat,1)/a);
i=size(W_hat,1);
dw=ones(1,i);
% dw=[i];
demixing_cost=1/2*log2(i^2);
% demixing_cost=mkde(W_hat,dw);
% demixing_cost=demixing_matrix_cost(W_hat);

sum_MDL=pdf_cost+demixing_cost+cc;
mdlcost=sum_MDL;
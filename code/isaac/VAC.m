% function f=VAC(mean,sigma,lower,upper)
% f1=0;
% h=(upper-lower)/2000;
% for i=lower:h:upper
%     f1=f1+(h/(2*sqrt(2*pi)*sigma))*(exp(-((i-mean).^2)/(2*sigma^2))+exp(-((i+h-mean).^2)/(2*sigma^2)));
% end


function f=VAC(mean,sigma,x)
f1=(1/(sqrt(2*pi)*sigma))*exp(-((x-mean).^2)/(2*sigma^2));

% % syms x
% % g=(1/(sqrt(2*pi)*sigma))*exp(-((x-mean).^2)/(2*sigma^2));
% % f1= double(int(g, x, lower, upper));

f=log2(1/f1);

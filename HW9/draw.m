function draw
load dataset4lineFit.txt
x=dataset4lineFit(:,1);
y=dataset4lineFit(:,2);
data=[x';y'];

%LS
[t1 t2]=size(x);
ls=ones(2,t1);
ls(1,:)=x';
size(ls)
ans=ls'\y;
interval=linspace(min(x),max(x));
ls_ans=ans(1)*interval+ans(2);

%TLS
data2(1,:) = data(1,:)-mean(data(1,:));
data2(2,:) = data(2,:)-mean(data(2,:));
[A2, eigVec, eigValue]=pca(data);
eigVec
eigVec(:,end)
c=-1*sum(eigVec(:,end)'*data)/t1;
tls_ans=-1*(interval*eigVec(1,end)+c)/eigVec(2,end);
plot(x,y,'o',interval,ls_ans,interval,tls_ans);
legend('data','LS','TLS', 4);

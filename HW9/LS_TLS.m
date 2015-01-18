function LS_TLS
load dataset4lineFit.txt;

x = dataset4lineFit(:, 1);
y = dataset4lineFit(:, 2);

data = [x'; y'];

% part of LS:
[xrow, xcol] = size(x);
LS = ones(2, xrow);
LS(1, :) = x';
temp_ans = LS'\y;
t = linspace(min(x), max(x));
LS_ans = temp_ans(1)*t + temp_ans(2);

% part of TLS:
data2(1,:) = data(1,:)-mean(data(1,:));
data2(2,:) = data(2,:)-mean(data(2,:));
[A2, eigVec, eigValue]=pca(data);

eigVec(:,end)
c=-1*sum(eigVec(:,end)'*data)/t1;
tls_ans=-1*(interval*eigVec(1,end)+c)/eigVec(2,end);
plot(x,y,'o',interval,ls_ans,interval,tls_ans);
legend('data','LS','TLS', 4);

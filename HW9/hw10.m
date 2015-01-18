load dataset4lineFit.txt
x = dataset4lineFit(:, 1);
y = dataset4lineFit(:, 2);
%plot(x, y, 'ro');
xlabel('X');
ylabel('Y');

A = [x, ones(size(x))];
theta = A\y;

%plot(x, y, 'ro', x, A*theta);
[A2, eigVec, eigValue] = pca(dataset4lineFit');
mx = mean(x);
my = mean(y);
a = eigVec(1, 2);
b = eigVec(2, 2);
c = -(a*mx + b*my);

plot(x, y, 'ro', x, A*theta, 'b-', x, (a*x+c)/(-b), 'g');

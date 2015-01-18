X = imread('annie19980405.jpg');
image(X)
[m, n, p]=size(X);
%index=reshape(1:m*n*p, m*n/64, 3*64 )';
%data=double(X(index));
b=8;
db=64;
data = zeros(m*n/db, db*3); % build a zero-matrix

count = 1;  % set counter = 1

for i=1 : b : m         % i from 1 to m, add every block side: i = i+8
    for j=1 : b : n     % j from 1 to n, add every block side: j = j+8
       data(count, 1:db*3) = reshape(X(i:i+b-1, j:j+b-1, 1:3), 1, db*3); 
       count = count+1; % refresh counter
    end
end
data = double(data');

maxI=10;
for i=1:maxI
	codeBookSize=2^i;
	fprintf('i=%d/%d: no. of centers=%d\n', i, maxI, codeBookSize);
	center=kMeansClustering(data, codeBookSize);
	distMat=distPairwise(center, data);
	[minValue, minIndex]=min(distMat);
    
    
    count=1;
	X2 = zeros(m, n, 3);
    for j=1 : b : m
        for k=1 : b : n
            X2(j:j+b-1, k:k+b-1, 1:3) = reshape(center(:, minIndex(count)), b, b, 3);
            count = count+1;
        end
    end
    X2 = X2./255;
    %minIndex1=reshape(minIndex, m, n);
	%X2=reshape(minIndex, m, n);
	%map=center'/255;
	figure; image(X2);axis image;
end

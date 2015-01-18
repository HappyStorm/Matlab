 addpath ../machineLearning/
 addpath ../utility/

maxI=5;
sz = 8;

X = imread('annie19980405.jpg');
[m, n, p]=size(X);

data = zeros(m*n/sz/sz, sz*sz*3);
ct=1;
for i=1:sz:m
    for j=1:sz:n
        data(ct, 1:sz*sz*3) = reshape(X(i:i+sz-1, j:j+sz-1, 1:3), 1, sz*sz*3);
        ct = ct + 1;
    end
end

data = double(data');

for ii=1:maxI
	centerNum=2^ii;
	
	center=kMeansClustering(data, centerNum);
	distMat=distPairwise(center, data);
	[minValue, minIndex]=min(distMat);
	
    ct=1;
    X2=zeros(m,n,3);
    for i=1:sz:m
        for j=1:sz:n
            X2(i:i+sz-1, j:j+sz-1, 1:3) = reshape(center(:,minIndex(ct)),sz,sz,3);
            ct= ct+1;
        end
    end
    X2 = X2 ./ 255;
	figure;
    image(X2);
    title(['Code book size=', num2str(centerNum), ', block=8x8, compression ratio=',num2str((n*m*p*8)/(ii*n*m/sz/sz+centerNum*sz*sz*3*8))]);
end
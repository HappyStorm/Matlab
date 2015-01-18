X = imread('annie19980405.jpg');    % X = 480x640x3 unit8

[m, n, p] = size(X);    % m=480, n=640, p=3

maxI = 10;
b = 8;  % block side = 8
db = b * b; % block size = block side * block side = 8*8 = 64 
data = zeros(m*n/db, db*3); % build a zero-matrix

count = 1;  % set counter = 1

for i=1 : b : m         % i from 1 to m, add every block side: i = i+8
    for j=1 : b : n     % j from 1 to n, add every block side: j = j+8
       data(count, 1:db*3) = reshape(X(i:i+b-1, j:j+b-1, 1:3), 1, db*3); 
       count = count+1; % refresh counter
    end
end

data = double(data');

for i=1 : maxI
	centerNum = 2^i;
	center = kMeansClustering(data, centerNum);
	distMat = distPairwise(center, data);
	[minValue, minIndex] = min(distMat);
    
    count=1;
	X2 = zeros(m, n, 3);
    for j=1 : b : m
        for k=1 : b : n
            X2(j:j+b-1, k:k+b-1, 1:3) = reshape(center(:, minIndex(count)), b, b, 3);
            count = count+1;
        end
    end
    X2 = X2./255;
	figure;
    image(X2);
    title(['Code book size=', num2str(centerNum), ', block=8x8, compression ratio=', num2str((n*m*p*8) / (i*n*m/db + centerNum*db*3*8))]);
    axis image;
end

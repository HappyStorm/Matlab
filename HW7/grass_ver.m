I=imread('annie19980405.jpg');
[r,c]=size(I);
bs=8; % Block Size (8x8)

nob=(r/bs)*(c/bs); % Total number of 8x8 Blocks

% Dividing the image into 8x8 Blocks
kk=0;
for i=1:(r/bs)
    for j=1:(c/bs)
        Block(:,:,kk+j)=I((bs*(i-1)+1:bs*(i-1)+bs),(bs*(j-1)+1:bs*(j-1)+bs));
    end
    kk=kk+(r/bs);
end

figure;imshow(Block(:,:,2))
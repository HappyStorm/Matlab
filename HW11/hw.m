function hw()
i = [ 2 6 3 4 4 5 6 1 1];
j = [ 1 1 2 2 3 3 3 4 6];
n = 6;
G = sparse(i,j,1,n,n);
full(G);
U={};
p=0:0.1:1;
for i=1:11;
	data(:,i)=pagerank(U,G,p(i));
end
bar(p,data','grouped');
title('page rank vs random transition probability');
xlabel('random transition probability');
ylabel('page ranks');
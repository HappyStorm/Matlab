function output = Q1_101062319(a, b)

aCell = struct2cell(a);
bCell = struct2cell(b);
fieldA = fieldnames(a); % all fieldnames of A
fieldB = fieldnames(b); % all fieldnames of B
% DiffA = setdiff(fieldA, fieldB); % all different fieldnames between A & B
DiffB = setdiff(fieldB, fieldA); % all different fieldnames between A & B
Diff = [fieldA; DiffB];

[rowA, colA] = size(a);
[rowB, colB] = size(b);

[row, col] = size(Diff);
answer = cell(row, colA+colB);

for i=1 : row
	if(isfield(a, Diff(i))==1)
		answer(i, [1:colA]) = aCell(i, [1:colA]);
	end
end

ct=0;
for i=1 : row
	if(isfield(b, Diff(i))==1)
		answer(i, [colA+1:colA+colB]) = bCell(i-ct, [1:colB]);
	else
		ct = ct+1;
	end
end
    output = cell2struct(answer, Diff, 1);
    
end

% a.name='alex';
% a.age=21;
% a(2).height=180;
% b.name='timmy';
% b.gender='male';
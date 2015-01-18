function out=Q1_101062324(a, b)
%{
a.name='alex';
a.age=21;
a(2).height=180;
b.name='timmy';
b.gender='male';
%}
field_a=fieldnames(a);
field_b=fieldnames(b);
different=setdiff(field_b,field_a);
field=[field_a;different];
cell_a=struct2cell(a);
cell_b=struct2cell(b);
[l,w1]=size(a);
[l,w2]=size(b);
[r,c]=size(field);
answer=cell(r,w1+w2);
for i=1:r
	if isfield(a,field(i))==1
		answer(i,[1:w1])=cell_a(i,[1:w1]);
	end
end
counter=0;
for i=1:r
	if isfield(b,field(i))==1
		answer(i,[w1+1:w1+w2])=cell_b(i-counter,[1:w2]);
	else
		counter=counter+1;
	end
end
out=cell2struct(answer,field,1)';


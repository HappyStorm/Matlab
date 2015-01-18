clear all;

apr = 0.03;
dr = 0.0138;
iiv = 0.07;
total = 400;
year = 20;

p = loan(total, apr, year);
%	Usage:
%		p=loan(total, r, n, mode)
%		total: �`���B�A������δ���
%		r: �~�Q�v
%		n: �`�~��
%		p: �C���J���B
%		mode: 'initial' for �����`���B, 'final' for �����`���B

fhv = 500 * ((1+iiv/12)^(year*12));

fmypay = saving(p, dr, year);
%	Usage: total=saving(p, r, n, mode)
%		p: �C���J���B
%		r: �~�Q�v
%		n: �`�~��
%		mode: 'initial' for �����`���B, 'final' for �����`���B
%		total: �`���B�A������δ���


forigin = 100 * ((1+dr/12)^(year*12));

income = fhv - fmypay - forigin;

nvalue = income * (1+dr/12)^(-1*year*12);

nfmypay = saving((p-1), dr, year);
%	Usage: total=saving(p, r, n, mode)
%		p: �C���J���B
%		r: �~�Q�v
%		n: �`�~��
%		mode: 'initial' for �����`���B, 'final' for �����`���B
%		total: �`���B�A������δ���

rentincome = fhv - nfmypay - forigin;

rentnvalue = rentincome * ((1+dr/12)^(-1*year*12));

fprintf('Monthly payment = %.5f\n', p);
fprintf('Final value of the house = %.2f\n', fhv);
fprintf('Final value of the payments = %.3f\n', fmypay);
fprintf('Final value of the down payment = %.3f\n', forigin);
fprintf('Final earning = %.2f\n', income);
fprintf('Initial earning = %.2f\n', nvalue);
fprintf('Final earning (with rent) = %.2f\n', rentincome);
fprintf('Initial earning (with rent) = %.2f\n', rentnvalue);
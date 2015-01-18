clear all;

apr = 0.03;
dr = 0.0138;
iiv = 0.07;
total = 400;
year = 20;

p = loan(total, apr, year);
%	Usage:
%		p=loan(total, r, n, mode)
%		total: 總金額，分期初或期末
%		r: 年利率
%		n: 總年數
%		p: 每月投入金額
%		mode: 'initial' for 期初總金額, 'final' for 期末總金額

fhv = 500 * ((1+iiv/12)^(year*12));

fmypay = saving(p, dr, year);
%	Usage: total=saving(p, r, n, mode)
%		p: 每月投入金額
%		r: 年利率
%		n: 總年數
%		mode: 'initial' for 期初總金額, 'final' for 期末總金額
%		total: 總金額，分期初或期末


forigin = 100 * ((1+dr/12)^(year*12));

income = fhv - fmypay - forigin;

nvalue = income * (1+dr/12)^(-1*year*12);

nfmypay = saving((p-1), dr, year);
%	Usage: total=saving(p, r, n, mode)
%		p: 每月投入金額
%		r: 年利率
%		n: 總年數
%		mode: 'initial' for 期初總金額, 'final' for 期末總金額
%		total: 總金額，分期初或期末

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
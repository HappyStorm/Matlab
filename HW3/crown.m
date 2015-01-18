clear all;

% (a)
% t = -pi:0.1:pi;
% y = sin(t)./t;
% stem(t, y);
% plot(t,y);

% (b)
% t = -pi:0.1:pi;
% y = abs(sin(t)./t);
% stem(t, y);
% plot(t,y);

% (c) x=1, y=0
range1=-pi/4:0.05:pi*1/4;
range2=pi/2-pi/8:0.05:pi*8/4-pi/8;
x = cos(range2-pi/8);
y = sin(range2-pi/8);
z = abs(cos(4*range2)).*exp(-abs(range2/8))+0.3;
s = cos(range1);
t = sin(range1);
p = abs(cos(2*range1)).*exp(-abs(range1/2))*4.3+0.3;
stem3(x, y, z, 'fill');
hold on
stem3(s, t, p, 'fill');
hold off
xlabel('X-axis');
ylabel('Y-axis');
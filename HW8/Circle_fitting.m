function Circle_fitting()
load circleData.txt

x = circleData(:,1);
y = circleData(:,2);
% plot(x, y, '.');

A = [x.*2, y.*2, ones(size(x))];
B = x.^2 + y.^2;
theta = A\B;

a = theta(1);
b = theta(2);
r = sqrt(theta(3) + a.^2 + b.^2);

t = linspace(0, 2*pi, 360);
rx = a + r*cos(t);
ry = b + r*sin(t);
% plot(x, y, '.', rx, ry);

ftheta = [a, b, r];
mtheta = fminsearch(@errorMeasure1, ftheta, []);
    function squaredError = errorMeasure1(theta)
        z = sqrt((theta(1)-x).^2 + (theta(2)-y).^2) - theta(3);
        squaredError = sum(z.^2);
    end
mx = mtheta(1) + mtheta(3)*cos(t);
my = mtheta(2) + mtheta(3)*sin(t);

plot(x, y, '*', rx, ry, mx, my);
axis image
end
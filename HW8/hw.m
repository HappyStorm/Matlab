function hw()
load circleData.txt
x=circleData(:,1);
y=circleData(:,2);
[t,s]=size(x);
A=ones(t,3);
A(:,1)=x.*2;
A(:,2)=y.*2;
B=ones(size(x));
B(:)=x.*x+y.*y;
theda=A\B;
a=theda(1);
b=theda(2);
r=sqrt(theda(3)+b*b+a*a);
t=linspace(0, 2*pi, 360);
cx=a+r*cos(t);
cy=b+r*sin(t);
theta0=[a,b,r];
min_theda=fminsearch(@errorMeasure,theta0,[]);
	function squaredError=errorMeasure(temp)
		%x=data(:,1);
		%y=data(:,2);
		z = sqrt((x-temp(1)).^2+(y-temp(2)).^2)-temp(3);
		squaredError=sum(z.^2);
	end
[a,b,r];
min_theda;
min_x=min_theda(1)+min_theda(3)*cos(t);
min_y=min_theda(2)+min_theda(3)*sin(t);
plot(x,y,'.',cx,cy,min_x,min_y);
axis image
end

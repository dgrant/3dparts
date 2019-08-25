$fn=100;

volume=8000;
height_to_diagonal_ratio=1;

c=(3*sqrt(3)/2);
a=pow(volume/c/height_to_diagonal_ratio/2, 1/3);

//a=10;
x=a*cos(60);
y=a*sin(60);
h=height_to_diagonal_ratio*a*2;
v=c*pow(a,2)*h;
echo("a=",a);
echo("diagonal=",a*2);
echo("h=",h);
echo("v=",v);

linear_extrude(height=h)
polygon(points=[
	[a,0], [x,y], [-x,y], [-a,0], [-x,-y], [x,-y]
]);

	
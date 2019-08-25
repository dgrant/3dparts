$fn=100;

width_height_ratio=2;
volume=8000;
Z=pow(volume/width_height_ratio, 1/3);
X=Z;
Y=width_height_ratio*X;
v=X*Y*Z;
echo("X=", X);
echo("Y=", Y);
echo("Z=", Z);
echo("v=", v);
cube([X,Y,Z], center = true);
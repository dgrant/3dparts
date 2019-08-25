$fn=100;

volume=8000.0;

a=pow(volume*6*sqrt(2), 1/3);
v=pow(a,3)/(6*sqrt(2));
echo("a=", a);
echo("v=", v);

x1=sqrt(3)/3*a;
x=sqrt(3)/6*a;
y=a/2;
h=sqrt(6)/3*a;

echo("x=", x);
echo("y=", y);

polyhedron(
  points=[ [x1,0,0],[-x,y,0],[-x,-y,0], // the 3 points at base
           [0,0,h]  ],    // the apex point 
  faces=[ [3,1,0],[0,2,3],[3,2,1], // each triangle side
              [0,1,2] ]    // two triangle for base
 );
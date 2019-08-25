$fn=100;

volume=8000;

h=pow((volume*2/3),1/3);
l=3/2*h;
w=2*h;

v=w*l*h/2;
echo("h=",h);
echo("l=",l);
echo("w=",w);
echo("volume=",v);

polyhedron(
   points=[
	  [0,0,0], [l,0,0], [0,w,0], //bottom triangle
	  [0,0,h], [l,0,h], [0,w,h]  //top triangle
   ],
   faces=[
     [0,1,2],                   //bottom triangle
     [5,4,3],                   //top triangle
     [3,0,2,5],                 //one short side
     [0,3,4,1],                 //other short side
     [4,5,2,1]                  //hypotenuse side
]);
$fn=100;

volume=8000.0;

height_to_base_ratio = 0.635;

w=pow(volume*3.0/height_to_base_ratio, 1/3.0);
h=height_to_base_ratio * w;
v=h*pow(w,2)/3.0;
echo("height=", h);
echo("base=", w);
echo("v=", v);


polyhedron(
  points=[ [w/2,w/2,0],[w/2,-w/2,0],[-w/2,-w/2,0],[-w/2,w/2,0], // the four points at base
           [0,0,h]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );
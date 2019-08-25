$fn=100;

volume=8000.0;

height_to_base_ratio = 0.635;

r=pow(volume*3/4/PI, 1/3.0);
v=4/3*PI*pow(r,3);
echo("radius=", r);
echo("v=", v);


sphere(r);
  
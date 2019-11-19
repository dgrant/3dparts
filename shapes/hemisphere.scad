$fn=200;

volume=8000.0;

height_to_base_ratio = 0.635;

r = pow(2 * volume*3/4/PI, 1/3.0);
v = (4/3*PI*pow(r,3)) / 2;
echo("radius=", r);
echo("v=", v);

difference() {
    sphere(r);
    translate([0,0,-25]) cube([50,50,50], center=true);
}
  
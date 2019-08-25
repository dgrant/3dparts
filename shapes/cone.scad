$fn=100;

volume=8000.0;

height_to_base_ratio = 1;

r=pow(3 * volume / PI / height_to_base_ratio / 2, 1/3.0);
h=height_to_base_ratio * r * 2;
v=PI*pow(r,2)*h/3.0;
echo("height=", h);
echo("2*r=", 2*r);
echo("v=", v);
cylinder(h, r, 0, center = true);
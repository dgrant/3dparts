$fn=100;




R=11.25791;
r=6;

rotate_extrude()
translate([R, 0, 0])
circle(r = r);

volume=PI*pow(r,2)*(2*PI*R);
echo("volume=", volume);
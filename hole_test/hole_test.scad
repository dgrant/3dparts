$fa=6;
$fs=1.75/2;

MIN_DIAMETER=1;
DIAMETER_INCREMENT=1;

module holes() {
    for (i=[0:10])
        translate([i*10,6,-1]) cylinder(r=MIN_DIAMETER/2 + i*DIAMETER_INCREMENT/2, h=20);
}

module block() {
    cube([200,100,10]);
}

difference() {
    block();
    holes();
}
$fa=1;
RADIUS=45;
HEIGHT_BASE=1;
HEIGHT_RIM=1;
WIDTH_RIM=1;
OVERLAP=20;
module base() {
    difference() {
        minkowski() {
            cylinder(r=RADIUS, h=OVERLAP);
            sphere(r=0.5);
        }
        translate([0,0,HEIGHT_BASE]) cylinder(r=RADIUS+5, h=OVERLAP);
    }
}

module rim() {
    difference() {
        minkowski() {
            cylinder(r=RADIUS, h=HEIGHT_RIM+HEIGHT_BASE);
            sphere(r=0.5);
        }
        translate([0,0,-OVERLAP/2]) cylinder(r=RADIUS-WIDTH_RIM, h=OVERLAP);
        translate([0,0,HEIGHT_BASE-OVERLAP]) cylinder(r=RADIUS+5, h=OVERLAP);
    }
}

base();
rim();
$fn=128;
	difference() {
    difference() {
        difference() {		
            difference() {	
                translate([-7.5,0,-4]) cylinder (h = 8, r=60, center = true);
                translate([-7.5,0,-8]) cylinder (h = 20, r=52, center = true);
            }
            translate([-67.5,-80,0]) rotate([0,5.14,0]) cube([90,160,20]);
        }
        translate([0,-80,-25]) cube([100,160,50]);
    }
    translate([-100,-60,0]) cube([100,120,10]);
}
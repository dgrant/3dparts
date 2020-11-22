$fn=128;
difference() {
    difference() {
        difference() {		
            difference() {	
                translate([-7.5,0,-10]) cylinder (h = 20, r=60, center = true);
                translate([-7.5,0,-15]) cylinder (h = 30, r=52, center = true);
            }
            translate([0,-80,0]) rotate([0,5.14,0]) cube([60,160,20]);
        }
        translate([-100,-80,-25]) cube([100,160,50]);
    }
    translate([-20,-80,0]) cube([100,160,10]);
}
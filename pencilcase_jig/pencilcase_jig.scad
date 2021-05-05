// Final parameters
CASE_WIDTH=265;
CASE_HEIGHT=95;
JIG_THICKNESS=3;
ZIPPER_SLOT_LENGTH=230;

// Draft parameters
//CASE_WIDTH=50;
//CASE_HEIGHT=95;
//JIG_THICKNESS=3;
//ZIPPER_SLOT_LENGTH=30;

ZIPPER_SLOT_WIDTH=12;
BLADE_THICKNESS=0.3;
//SLIT_EXTRA_SPACE=0.3; // this was a little loose
SLIT_EXTRA_SPACE=0.2;
EXTRA_SLIT_LENGTH=6;
//FIT_TOLERANCE=0.15; // this was a little loose
FIT_TOLERANCE=0.1;
TRIANGLE_SIZE=4;

module slit() {
    cube([ZIPPER_SLOT_LENGTH + 2*EXTRA_SLIT_LENGTH, BLADE_THICKNESS + SLIT_EXTRA_SPACE, JIG_THICKNESS*10], center=true);
}

module whole_jig() {
    difference() {
        cube([CASE_WIDTH, CASE_HEIGHT * 2, JIG_THICKNESS], center=true);
        translate([0,-ZIPPER_SLOT_WIDTH/2,0]) slit();
        translate([0,ZIPPER_SLOT_WIDTH/2,0]) slit();
    }
}

module half_jig_1() {
    difference() {
        whole_jig();
        translate([500,0,0]) cube([1000,1000,1000], center=true);
        triangle_cut_out();
        translate([0, -CASE_HEIGHT/6*5, 0]) triangle_cut_out();
        translate([0, -CASE_HEIGHT/2, 0]) triangle_cut_out();
        translate([0, -CASE_HEIGHT/6, 0]) triangle_cut_out();
        translate([0, CASE_HEIGHT/6, 0]) triangle_cut_out();
        translate([0, CASE_HEIGHT/2, 0]) triangle_cut_out();
        translate([0, CASE_HEIGHT/6*5, 0]) triangle_cut_out();
    }
}

module half_jig_2() {
    difference() {
        whole_jig();
        translate([-500,0,0]) cube([1000,1000,1000], center=true);
    }
    triangle();
    translate([0, -CASE_HEIGHT/6*5, 0]) triangle();
    translate([0, -CASE_HEIGHT/2, 0]) triangle();
    translate([0, -CASE_HEIGHT/6, 0]) triangle();
    translate([0, CASE_HEIGHT/6, 0]) triangle();
    translate([0, CASE_HEIGHT/2, 0]) triangle();
    translate([0, CASE_HEIGHT/6*5, 0]) triangle();
}

module triangle() {
    cylinder(JIG_THICKNESS, TRIANGLE_SIZE - FIT_TOLERANCE, TRIANGLE_SIZE - FIT_TOLERANCE, $fn=3, center=true);
}

module triangle_cut_out() {
    cylinder(JIG_THICKNESS*10, TRIANGLE_SIZE + FIT_TOLERANCE, TRIANGLE_SIZE + FIT_TOLERANCE, $fn=3, center=true);
}

//half_jig_1();
half_jig_2();


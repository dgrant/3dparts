$fa=1;
$fs=1;

stick_length=31;
stick_width=20;

base_length=150;
base_width=60;

top_length=stick_length*3;
top_width=base_width;
top_height=stick_width*1.5;

stick_height_above_ice = 60;
hole_depth = stick_height_above_ice / 2;

screw_length = 30;
distance_between_sticks = stick_width/2*2; // should be hypotenuse of hal sh
desired_hole_diameter=3.4;
hole_diameter = desired_hole_diameter + 0.4;

cone_diameter = 6;
cone_height = 4;
x_count = base_width / 2 / cone_diameter - 1;
y_count = base_length / 2 / cone_diameter - 1;

// stick
module stick1() {
    translate([distance_between_sticks/2, -stick_length/2, stick_height_above_ice])
    cube([base_width*2, stick_length, stick_width]);
}
module stick2() {
    mirror([1,0,0]) stick1();
}

module basic_shape() {
    hull() {
        translate([0, base_length/2 - base_width/2, 0]) circle(r=base_width/2);
        translate([0, -base_length/2 + base_width/2, 0]) circle(r=base_width/2);
    };
}

// screw hole
module screw_hole() {
    translate([base_width/3, 0, stick_height_above_ice - hole_depth]) 
    cylinder(h=400, d=hole_diameter);
}

module screw_holes() {
    screw_hole();
    mirror([1,0,0]) screw_hole();
};

// platform for stick
module base() {
    difference() {
        linear_extrude(height=stick_height_above_ice, scale=[top_width/base_width, top_length/base_length])
        basic_shape();
        // Screw holes
        screw_holes();
    }
};

module cone() {
    translate([0,0,-cone_height]) cylinder(h=cone_height, r1=0, r2=cone_diameter/2);
}

module cones() {
    for (x = [0:1:x_count-1] ) {
        for (y = [0:1:y_count-1] ) {
            translate([cone_diameter*x, cone_diameter*y, 0]) cone();
        }
    }
}

module main() {
    union() {
        base();
        cones();
        mirror([1,0,0]) cones();
        mirror([0,1,0]) cones();
        mirror([0,1,0]) mirror([1,0,0]) cones();
    }
}

main();
%stick1();
%stick2();
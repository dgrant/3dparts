$fa=0.5;
$fs=0.5;

stick_length=31;
stick_width=20;

base_length=150;
base_width=60;

top_length=stick_length*3;
top_width=base_width;
top_height=stick_width*1.5;
echo("top_height=", top_height);

stick_height_above_ice = 60;

m3_head_diameter = 5.68 + 0.1;
m3_outer_diameter = 3.0 + 0.1;
screw_length = 30;
nut_height = 2.4;
stick_screw_clearance = 10;


// stick
module stick() {
    translate([-200,-stick_length/2,0]) cube([400, stick_length, stick_width]);
}

module basic_shape() {
    hull() {
        translate([0, base_length/2 - base_width/2, 0]) circle(r=base_width/2);
        translate([0, -base_length/2 + base_width/2, 0]) circle(r=base_width/2);
    };
}

// screw hole
module screw_hole() {
    translate([0, stick_screw_clearance + stick_length/2 + m3_head_diameter/2, -250]) cylinder(h=500, d=m3_outer_diameter);
}

module screw_holes() {
    screw_hole();
    mirror([0,1,0]) screw_hole();
};

module screw_clearance_top() {
    translate([0,stick_screw_clearance + stick_length/2 + m3_head_diameter/2,screw_length/2]) cylinder(h=500, d=m3_head_diameter);
};

module screw_clearances_top() {
    screw_clearance_top();
    mirror([0,1,0]) screw_clearance_top();
};

module screw_clearance_bottom() {
    translate([0,stick_screw_clearance + stick_length/2 + m3_head_diameter/2, -screw_length/2+nut_height*2]) rotate([0,180,0]) cylinder(h=500, d=m3_head_diameter*5);
};

module screw_clearances_bottom() {
    screw_clearance_bottom();
    mirror([0,1,0]) screw_clearance_bottom();
};

// platform for stick
module base() {
    difference() {
        translate([0,0,-stick_height_above_ice])
        linear_extrude(height=stick_height_above_ice+top_height, scale=[top_width/base_width, top_length/base_length])
        basic_shape();
        // Remove the top part
        translate([-150,-150,0]) cube([300,300,300]);
        // Screw holes
        screw_holes();
        // Clearance holes
        screw_clearances_bottom();
    }
};

// stick clamp
module clamp() {
    difference() {
        translate([0,0,-stick_height_above_ice])
        // Same as base but extract heigher, then remove everything below stick
        linear_extrude(height=stick_height_above_ice+top_height, scale=[top_width/base_width, top_length/base_length])
        basic_shape();
        // Remove the bottom part
        translate([-150,-150,-300]) cube([300,300,300]);
        // Screw holes
        screw_holes();
        // Clearance holes
        screw_clearances_top(); 
        // Space for stack
        stick();

    };

};

base();
clamp();
%stick();
%screw_holes();
%screw_clearances_top();
%screw_clearances_bottom();